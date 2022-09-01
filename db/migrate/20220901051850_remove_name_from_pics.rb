class RemoveNameFromPics < ActiveRecord::Migration[6.0]
  def change
    remove_column :pics, :name, :string
  end
end
