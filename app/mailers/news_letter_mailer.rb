class NewsLetterMailer < ActionMailer::Base
  default from: 'metrics@500px.com'
  add_template_helper(ApplicationHelper)
  # send a signup email to the user, pass in the user object that contains the user's email address
  def daily_update(news_letter)
    @news_letter = news_letter
    mail(to: 'meagar@gmail.com', subject: '500px Team Metrics')
  end
end
