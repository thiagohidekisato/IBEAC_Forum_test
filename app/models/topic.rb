class Topic < ApplicationRecord
  belongs_to :category
  belongs_to :member
  has_many :comments
end
