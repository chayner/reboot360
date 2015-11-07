class AddImageToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :image, :string
  end
end
