class AddTrainingToCms < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :position
      t.integer :training_id
      t.integer :lesson_id
      t.string :title
      t.string :video_url
    end

    create_table :downloads do |t|
      t.integer :position
      t.integer :training_id
      t.integer :lesson_id
      t.string :title
      t.string :file
    end

    create_table :trainings do |t|
      t.string :slug
      t.string :title
      t.text :subtitle
      t.string :image
      t.text :description
    end

    add_index :trainings, :slug
  end
end
