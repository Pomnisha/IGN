#encoding: utf-8
class UserMailer < ActionMailer::Base
  default :from => "admin@ign.su"
  def signup_notification(user)
    @user = user
    mail(:to => user.email, :subject => "Регистрация на IGN", :body =>
"Вы получили это письмо, так как Ваш e-mail был использован при регистрации на ign.su

Если Вы не регистрировались на указанном сайте, просто проигнорируйте и удалите это письмо

Для продолжения регистрации в системе ign.su проследуйте в личный кабинет по следующей ссылке:

http://www.ign.su/profile/edit

Это автоматическое письмо. Если у вас есть какие-либо вопросы, Вы можете
изучить Справочную информацию: или отправить вопрос на адрес  ign@gmail.ru

Добро пожаловать в сообщество ИНТЕРНЕТ ГАРАНТ НАВИГАТОР

Ваши логин: #{@user.username} 

С уважением,
Команда ИНТЕРНЕТ ГАРАНТ НАВИГАТОР
")
  end
end
