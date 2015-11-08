class Lesson < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image, ImageUploader
  mount_uploader :lesson_pdf, AwsFileUploader
  mount_uploader :handout_pdf, AwsFileUploader

  validates :week, :title, :presence => true

  friendly_id :week, use: :slugged

  before_save :remove_files

  def remove_lesson_pdf
  end

  private

  def remove_files
    self.remove_lesson_pdf! if self.remove_lesson_pdf == '1'
    self.remove_handout_pdf! if self.remove_handout_pdf == '1'
  end
end
