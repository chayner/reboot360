module ApplicationHelper

  def get_video_iframe(video_url)
    c = Conred::Video.new(
      video_url: video_url,
      width: 960,
      height: 540,
      error_message: "Video url is invalid"
    )
    c.code.html_safe
  end

end
