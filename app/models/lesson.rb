class Lesson < ActiveRecord::Base
  extend FriendlyId
  has_many :videos, -> { order("position asc") }
  has_many :downloads, -> { order("position asc") }

  mount_uploader :image, ImageUploader
  mount_uploader :lesson_pdf, AwsFileUploader
  mount_uploader :handout_pdf, AwsFileUploader

  accepts_nested_attributes_for :downloads, allow_destroy: true
  accepts_nested_attributes_for :videos, allow_destroy: true

  validates :week, :title, :presence => true

  friendly_id :week, use: :slugged

  before_save :remove_files

  def get_video_iframe
    c = Conred::Video.new(
      video_url: self.video_embed,
      width: 960,
      height: 540,
      error_message: "Video url is invalid"
    )
    c.code.html_safe
  end

  private

  def remove_files
    self.remove_lesson_pdf! if self.remove_lesson_pdf == '1'
    self.remove_handout_pdf! if self.remove_handout_pdf == '1'
  end
end
