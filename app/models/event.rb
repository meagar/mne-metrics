class Event < ActiveRecord::Base
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
end
