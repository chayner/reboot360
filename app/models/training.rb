class Training < ActiveRecord::Base
  has_many :videos, -> { order("position asc") }
  has_many :downloads, -> { order("position asc") }

  accepts_nested_attributes_for :videos, allow_destroy: true
  accepts_nested_attributes_for :downloads, allow_destroy: true

  mount_uploader :image, ImageUploader

  validates :slug, :title, :presence => true

end
