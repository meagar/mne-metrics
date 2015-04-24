class NewsLetterEvent < ActiveRecord::Base
  belongs_to :news_letter
  belongs_to :event
end
