class Url < ApplicationRecord
  belongs_to :user
  validates :short_url, presence: true
  validates :long_url, presence: true
  validates :user_id, presence: true
  def to_param
    short_url
  end
end
