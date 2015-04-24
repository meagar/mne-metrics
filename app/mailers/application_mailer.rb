class ApplicationMailer < ActionMailer::Base
  default from: 'metrics@500px.com'
  layout 'mailer'
end
