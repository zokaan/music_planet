class Playlist < ApplicationRecord
  belongs_to :user

  has_many :lists
  has_many :songs, through: :lists

  def set_user!(user)
    self.user_id = user.id
    self.save!
  end

end
