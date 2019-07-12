class Trick < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  
  belongs_to :genre

  has_many :connections
  has_many :clips, through: :connections, source: :video
end
