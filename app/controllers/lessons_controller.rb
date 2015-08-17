class LessonsController < InheritedResources::Base

  private

    def lesson_params
      params.require(:lesson).permit(:week, :title, :description, :image, :teaching_content, :teaching_tips, :weekly_communication)
    end
end
