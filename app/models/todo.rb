class Todo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_list scope: :user

  validates :title, :deadline, presence: true
end
