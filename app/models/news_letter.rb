class NewsLetter < ActiveRecord::Base

  def send!
    NewsLetterMailer.daily_update.deliver_now
  end

end
