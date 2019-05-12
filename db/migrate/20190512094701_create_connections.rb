class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.references :trick, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end
