class PostMailer < ApplicationMailer
  def new_post_mail
    mail to: "harishgokulmtp123@gmail.com",subject: "Thanks for crating post"
  end
end
