class NewsLetter < ActiveRecord::Base

  has_many :news_letter_events
  has_many :events, through: :news_letter_events

  def send!
    if events.none?
      Event.this_period.each do |e|
        self.events << e
      end
    end

    NewsLetterMailer.daily_update(self).deliver_now
  end

end
