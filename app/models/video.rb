class Video < ActiveRecord::Base
  belongs_to :training
  belongs_to :lesson

  validates :video_url, :presence => true

  def get_video_iframe
    c = Conred::Video.new(
      video_url: self.video_url,
      width: 960,
      height: 540,
      error_message: "Video url is invalid"
    )
    c.code.html_safe
  end

end
