class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :submitter, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter, 
    class_name: :User, 
    foreign_key: :submitter_id, 
    primary_key: :id
    
  has_many :visits,
    class_name: :Visit,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    dependent: :destroy

  # TA: Again, the association would return the same user multiple times. You
  # may uncomment the lambda below to eliminate duplicates in the result set.
  has_many :visitors,
    # -> { distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    def self.random_code
      loop do
        random_code = SecureRandom.urlsafe_base64(16)
        return random_code unless ShortenedUrl.exists?(short_url: random_code)
      end
    end
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select('user_id').distinct.count
  end

  def num_recent_uniques
    visits
      .select('user_id')
      .where('created_at > ?', 10.minutes.ago)
      .distinct
      .count
  end


end