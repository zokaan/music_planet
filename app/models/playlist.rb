class Playlist < ApplicationRecord
  belongs_to :user

  has_many :lists
  has_many :songs, through: :lists
end
