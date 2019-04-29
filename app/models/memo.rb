class Memo < ApplicationRecord
    validates :trick, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 100 }
    
    
  belongs_to :user
end
