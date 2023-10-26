# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview
  def new_post_alert
    PostMailer.new_post_mail
  end
end
