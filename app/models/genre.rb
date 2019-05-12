class Genre < ApplicationRecord
  
  has_many :relationships
  has_many :clips, through: :relationships, source: :video
  
  has_many :tricks
  
   def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Genre.where(['name LIKE ?', "%#{search}%"])
    else
      Genre.all #全て表示。
    end
   end
end 
