class RemoveTitleFromPictures < ActiveRecord::Migration[6.0]
  def change
    remove_column :pictures, :title, :string
  end
end
