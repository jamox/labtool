class NotificationMailer < ActionMailer::Base

  def email(from, to, body, subject)
    from
    subject = "[Ohjelmoinnin harjoitustyo] #{subject}"
    @mailbody = body
    mail(:from => from, :to => to, :cc => from, :subject => subject)
  end

end