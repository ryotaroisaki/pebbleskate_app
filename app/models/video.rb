class Video < ApplicationRecord
  validates :iframe_url, presence: true, length: { maximum: 255 }
  validates :skater, presence: true, length: { maximum: 255 }
  validates :trick, presence: true, length: { maximum: 255 }
  validates :instagram_url, length: { maximum: 255 }
  validates :video_url, presence: true, length: { maximum: 255 }
  validates :video_type, presence: true, length: { maximum: 255 }

  has_many :relationships
  has_many :types, through: :relationships, source: :genre

  has_many :connections
  has_many :names, through: :connections, source: :trick

  has_many :favorites
  has_many :likes, through: :favorites, source: :user


  def belong(group)
    self.relationships.find_or_create_by(genre_id: group.id)
  end
end
