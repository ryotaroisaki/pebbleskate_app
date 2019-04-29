class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
      t.string :trick
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
