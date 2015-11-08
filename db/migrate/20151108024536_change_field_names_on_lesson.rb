class ChangeFieldNamesOnLesson < ActiveRecord::Migration
  def change
    rename_column :lessons, :lesson_pdf_url, :lesson_pdf
    rename_column :lessons, :handout_pdf_url, :handout_pdf
  end
end
