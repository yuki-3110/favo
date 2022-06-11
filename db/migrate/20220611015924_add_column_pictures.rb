class AddColumnPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :user_name, :string
  end
end
