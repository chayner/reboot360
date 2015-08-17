class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :week
      t.string :title
      t.text :description
      t.string :image
      t.string :teaching_content
      t.string :teaching_tips
      t.string :weekly_communication

      t.timestamps null: false
    end
  end
end
