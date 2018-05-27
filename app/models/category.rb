class Category < ApplicationRecord
  has_many :topics

  validates :description, presence: true

end
