class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :memos
    
    has_many :favorites
    has_many :liked, through: :favorites, source: :video
    
    def like(other_video)
      self.favorites.find_or_create_by(video_id: other_video.id)
    end

    def unlike(other_video)
      favorite = self.favorites.find_by(video_id: other_video.id)
      favorite.destroy if favorite
    end

    def liking?(other_video)
      self.liked.include?(other_video)
    end
  
end
