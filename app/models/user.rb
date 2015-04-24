class User < ActiveRecord::Base
  validates :uid, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  before_validation :normalize_email

  def normalize_email
    self.email = self.email.try(:downcase).try(:strip)
  end

  class AuthorizationError < StandardError; end

  def self.find_or_create_from_auth_hash(auth_hash)
    raise AuthorizationError, 'You cannot do that!' unless auth_hash['extra']['raw_info']['user']['admin'] == 1

    # Find the players based on email (first-time login) or auth UID, which never changes
    u = User.where('email = ? or uid = ?', auth_hash['info']['email'].downcase, auth_hash['uid'].to_s).first

    u ||= User.new
    u.uid ||= auth_hash['uid']
    u.name = auth_hash['info']['name']
    u.email = auth_hash['info']['email'].downcase

    u.save!
    u
  end



end
