# == Schema Information
#
# Table name: visits
#
#  id           :integer          not null, primary key
#  visitor_id   :integer
#  short_url_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Visit < ActiveRecord::Base

  validates :visitor_id, :short_url_id, presence: true

  def self.record_visit!(user, shortened_url)
      Visit.create!(visitor_id: user.id, short_url_id: shortened_url.id)
  end

  belongs_to :visitor,
    foreign_key: :visitor_id,
    primary_key: :id,
    class_name: 'User'

  belongs_to :short_url,
    foreign_key: :short_url_id,
    primary_key: :id,
    class_name: 'ShortenedURL'

end
