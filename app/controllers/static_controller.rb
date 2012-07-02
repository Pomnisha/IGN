class StaticController < ApplicationController
  layout 'static'
  helper Refinery::Core::Engine.helpers
  
  def welcome
    @user = Refinery::User.new
  end
end
