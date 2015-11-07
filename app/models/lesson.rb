class Lesson < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image, ImageUploader

  validates :week, :title, :presence => true

  friendly_id :week, use: :slugged

end
