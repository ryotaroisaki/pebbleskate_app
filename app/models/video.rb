class Video < ApplicationRecord
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
