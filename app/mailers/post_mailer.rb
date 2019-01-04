class PostMailer < ApplicationMailer
  def create_post post, email, subject
    @post = post
    mail to: email, subject: t(".new_post")
  end
end
