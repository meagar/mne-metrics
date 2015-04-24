class Event < ActiveRecord::Base

  has_many :news_letter_events
  has_many :news_letters, through: :news_letter_events

  TEAMS = [
    ['Web', :web], 
    ['Mobile', :mobile],
    ['Marketing', :marketing],
    ['CX/UX', :cx],
    ['Licensing', :licensing],
    ['General', :general],
  ]

  enum team: TEAMS.map(&:last)

  validates :starts_at, format: /\d\d\d\d-\d\d-\d\d/
  validates :description, presence: true
  validates :results, presence: true
  validates :team, presence: true

  scope :this_period, -> { where('starts_at > ? and starts_at < ?', Time.now.midnight - 2.weeks, Time.now.midnight + 2.weeks) }
end
