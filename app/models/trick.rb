class Trick < ApplicationRecord
  belongs_to :genre
  
  has_many :connections
  has_many :clips, through: :connections, source: :video
end
