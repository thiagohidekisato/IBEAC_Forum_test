class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :topic, foreign_key: true
      t.references :member, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end