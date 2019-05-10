class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :genre, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end
