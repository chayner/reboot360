class AddTrainingSections < ActiveRecord::Migration
  def change
    create_table :training_categories do |t|
      t.string :slug
      t.string :title
      t.string :image
      t.text :description
    end

    add_column :trainings, :training_category_id, :integer
    add_column :trainings, :position, :integer
    add_column :videos, :training_category_id, :integer
    add_column :downloads, :training_category_id, :integer
    remove_column :trainings, :slug, :string

    add_index :training_categories, :slug
    add_index :trainings, :training_category_id
  end
end
