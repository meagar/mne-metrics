
class HeartbeatController < ApplicationController

  def index
    last_letter = NewsLetter.order(:id).last
    if Time.now.in_time_zone('EST').hour > 9
      if last_letter.nil? || Time.now - last_letter.created_at > 23.hours
        @news_letter = NewsLetter.new
        @news_letter.send!
        @news_letter.save!
      end
    end

    render inline: "Feelin' fine"
  end

end
