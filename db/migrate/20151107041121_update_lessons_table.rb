class UpdateLessonsTable < ActiveRecord::Migration
  def change
    remove_column :lessons, :image
    remove_column :lessons, :teaching_content
    remove_column :lessons, :teaching_tips
    remove_column :lessons, :weekly_communication
    add_column :lessons, :video_embed, :text
    add_column :lessons, :video_dnload_url, :string
    add_column :lessons, :lesson_pdf_url, :string
    add_column :lessons, :handout_pdf_url, :string
    add_column :lessons, :weekly_summary, :text
  end
end
