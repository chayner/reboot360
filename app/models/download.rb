class Download < ActiveRecord::Base
  belongs_to :training
  belongs_to :lesson

  mount_uploader :file, AwsFileUploader

  validates :file, :title, :presence => true

  def get_new_height(new_width=150)
    download_type = FastImage.type(self.file_url)
    if [:jpeg, :png, :jpg].include? download_type
      dimension = FastImage.size(self.file_url)
      new_height = new_width * (dimension[1].to_f / dimension[0])
      return new_height.floor
    end

  end
end
