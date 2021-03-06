#encoding: utf-8
require 'devise'
require 'friendly_id'

module Refinery
  class User < Refinery::Core::BaseModel
    extend FriendlyId

  
    
    
    has_and_belongs_to_many :roles, :join_table => :refinery_roles_users

    has_many :plugins, :class_name => "UserPlugin", :order => "position ASC", :dependent => :destroy
    has_many :shops, :class_name => "Refinery::Shops::Shop", :dependent => :destroy
    has_many :companies, :class_name => "Refinery::Companies::Company", :dependent => :destroy
    has_many :topics, :class_name => "Refinery::Topics::Topic", :dependent => :destroy
    has_many :posts, :class_name => "Refinery::Posts::Post", :through => :topics, :dependent => :destroy
    
    
    friendly_id :username

    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable, :lockable and :timeoutable
    if self.respond_to?(:devise)
      devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :authentication_keys => [:login]
    end

    # Setup accessible (or protected) attributes for your model
    # :login is a virtual attribute for authenticating by either username or email
    # This is in addition to a real persisted field like 'username'
    attr_accessor :login
    attr_accessible :email, :city, :password, :password_confirmation, :remember_me, :username, :plugins, :login, :vip_code

    validates_presence_of :username, :message => 'Поле имя пользователя должно быть заполнено.', :if => :email_required?
    validates_uniqueness_of :username, :message => 'Такое имя пользователя уже используеться.', :allow_blank => true, :if => :email_changed?

    validates_presence_of   :email, :message => 'Поле e-mail должно быть заполнено.'
    validates_uniqueness_of :email, :allow_blank => true, :message => 'Такой e-mail уже используеться.'
    validates_format_of     :email, :with  => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :message => 'Неправильный формат e-mail адреса.', :if => :email_changed?

    validates_presence_of     :password, :message => 'Пароль должен быть указан.', :if => :password_required?
    validates_confirmation_of :password, :message => 'Пароль не совпадает с подтверждением.', :if => :password_required?
    validates_length_of       :password, :within => 4..20, :allow_blank => true
    
    
    class << self
      # Find user by email or username.
      # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign_in-using-their-username-or-email-address
      def find_for_database_authentication(conditions)
        value = conditions[authentication_keys.first]
        where(["username = :value OR email = :value", { :value => value }]).first
      end
    end

    def plugins=(plugin_names)
      if persisted? # don't add plugins when the user_id is nil.
        UserPlugin.delete_all(:user_id => id)

        plugin_names.each_with_index do |plugin_name, index|
          plugins.create(:name => plugin_name, :position => index) if plugin_name.is_a?(String)
        end
      end
    end

    def authorized_plugins
      plugins.collect(&:name) | ::Refinery::Plugins.always_allowed.names
    end

    def can_delete?(user_to_delete = self)
      user_to_delete.persisted? &&
        !user_to_delete.has_role?(:superuser) &&
        ::Refinery::Role[:refinery].users.any? &&
        id != user_to_delete.id
    end

    def can_edit?(user_to_edit = self)
      user_to_edit.persisted? && (
        user_to_edit == self ||
        self.has_role?(:superuser)
      )
    end

    def add_role(title)
      raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(::Refinery::Role)
      roles << ::Refinery::Role[title] unless has_role?(title)
    end

    def has_role?(title)
      raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(::Refinery::Role)
      roles.any?{|r| r.title == title.to_s.camelize}
    end

    def create_first
      if valid?
        # first we need to save user
        save
        # add refinery role
        add_role(:refinery)
        # add superuser role
        add_role(:superuser) if ::Refinery::Role[:refinery].users.count == 1
        # add plugins
        self.plugins = Refinery::Plugins.registered.in_menu.names
      end

      # return true/false based on validations
      valid?
    end

    def to_s
      username.to_s
    end

    def to_param
      to_s.parameterize
    end
      
    def password_required?
      !persisted? || !password.nil? || !password_confirmation.nil?
    end

    def email_required?
      true
    end
    
    module ClassMethods
        Devise::Models.config(self, :email_regexp, :password_length)
    end
    
  end
end
