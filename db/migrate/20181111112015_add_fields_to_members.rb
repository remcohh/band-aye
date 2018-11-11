class AddFieldsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
    add_column :members, :phone_number, :string
  end
end
