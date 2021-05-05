class AdminNotifierMailer < ApplicationMailer
  default :from => 'ecodipmanager@gmail.com'

  def send_email_about_order(favour, user)
    @favour = favour
    @user = user
    mail( :to => 'katsapvlad@yandex.by',
    :subject => 'Новый заказ!' )
  end

  def send_email_about_consultation(user)
    @user = user
    mail( :to => 'katsapvlad@yandex.by',
    :subject => 'Запрос на консультацию!' )
  end
end
