require 'SecureRandom'

class ShortenedURL < ActiveRecord::Base

  validates :submitter_id, :short_url, :long_url, presence: true, uniqueness: true

  belongs_to :submitter,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: 'User'

  has_many :visits,
    foreign_key: :short_url_id,
    primary_key: :id,
    class_name: 'Visit'

  has_many :visitors,
    through: :visits,
    source: :visitor

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedURL.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = ShortenedURL.random_code
    ShortenedURL.create!(submitter_id: user.id, short_url: short_url, long_url: long_url)
  end



end
