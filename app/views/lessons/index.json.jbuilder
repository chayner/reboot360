json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :week, :title, :description, :image, :teaching_content, :teaching_tips, :weekly_communication
  json.url lesson_url(lesson, format: :json)
end
