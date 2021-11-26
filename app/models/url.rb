class Url < ApplicationRecord
  belongs_to :user
  def to_param
    short_url
  end
end
