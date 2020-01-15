class LessonsController < ApplicationController
  before_action :authenticate_user!  
  before_action :require_authorized_for_current_lesson
  
  def show

    end

    private

    # Prevents repeating code when calling current_lesson

    helper_method :current_lesson
    def current_lesson
      @current_lesson ||= Lesson.find(params[:id])
    end

    # Checks enrollment

    def require_authorized_for_current_lesson
      if !current_user.enrolled_in? current_lesson.section.course
        redirect_to course_path(current_lesson.section.course), alert: 'You are not enrolled in that course'
      end
    end
end
