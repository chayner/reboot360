class Lesson < ActiveRecord::Base
  extend FriendlyId
  
  validates :week, :title, :presence => true

  friendly_id :week, use: :slugged

end
