class Lesson < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image, ImageUploader

  validates :week, :title, :presence => true

  friendly_id :week_and_title, use: :slugged

  def week_and_title
    "Week #{week} #{title}"
  end
end
