class Download < ActiveRecord::Base
  belongs_to :training
  belongs_to :lesson

  mount_uploader :file, AwsFileUploader

  validates :file, :title, :presence => true

end
