class LessonsController < InheritedResources::Base

  before_action :get_lessons

  private
    def get_lessons
      @lessons = Lesson.all().order('week asc')
    end

    def lesson_params
      params.require(:lesson).permit(:week, :title, :description, :image, :teaching_content, :teaching_tips, :weekly_communication)
    end
end
