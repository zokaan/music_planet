class Album < ApplicationRecord

  belongs_to :user
  has_many :songs

  scope :last_added_first, -> { order(created_at: :desc) }
end
