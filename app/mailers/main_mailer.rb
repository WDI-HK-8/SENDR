class MainMailer < ApplicationMailer

  def send_email(email)
    @email = email
    mail(to: @email.to, subject: @email.title, from: @email.from) do |format|
      format.html { render html: @email.content }
      format.text { render plain: @email.content }
    end
  end
  
end
