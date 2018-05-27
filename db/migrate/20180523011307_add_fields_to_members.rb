class AddFieldsToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :name, :string
    add_column :members, :address, :string
    add_column :members, :birthday, :datatime
    add_column :members, :phone1, :string
    add_column :members, :phone2, :string
    add_column :members, :phone3, :string
    add_column :members, :level, :integer
    add_column :members, :description, :text
    add_column :members, :indicator, :int
  end
end
