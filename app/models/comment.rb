class Comment < ApplicationRecord
  belongs_to :todo
  has_one :user, through: :todo

  validates :content, presence: true
end
