class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :member
  belongs_to :comment, optional: true
  has_one :comment
end
