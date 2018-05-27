class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :kind
      t.string :title
      t.text :text
      t.references :category, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
