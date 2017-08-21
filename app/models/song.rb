class Song < ApplicationRecord
  belongs_to :album
  belongs_to :user

  has_many :lists
  has_many :playlists, through: :lists

  validates :youtube_link, presence: true
  validates :year_of_publishing, presence: true

  scope :last_added_first, -> { order(created_at: :desc) }

   def self.search(search)
  #   if search
       where('song_name LIKE ? OR artist LIKE ?', "%#{search}%", "%#{search}%")
  #   else
  #     order('created_at DESC')
     end
  # end



end
