class Training < ActiveRecord::Base
  has_many :videos, -> { order("position asc") }
  has_many :downloads, -> { order("position asc") }
  belongs_to :training_category

  accepts_nested_attributes_for :videos, allow_destroy: true
  accepts_nested_attributes_for :downloads, allow_destroy: true

  mount_uploader :image, ImageUploader

  validates :training_category_id, :position, :presence => true

  def find_trainings_by_section(section)

  end
end
