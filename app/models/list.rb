class List < ApplicationRecord
  belongs_to :song
  belongs_to :playlist

  def set_user!(user)
  self.user_id = user.id
  self.save!
end
end
