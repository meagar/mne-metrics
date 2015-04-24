class NewsLetterMailer < ActionMailer::Base
  default from: 'metrics@500px.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def daily_update
    mail(to: 'meagar@gmail.com', subject: '500px Team Metrics')
  end
end
