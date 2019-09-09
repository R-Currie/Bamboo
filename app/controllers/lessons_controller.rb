class LessonsController < ApplicationController
  before_action :authenticate_user!  
  before_action :require_authorized_for_current_lesson
  
  def show

    end

    private

    helper_method :current_lesson
    def current_lesson
      @current_lesson ||= Lesson.find(params[:id])
    end

    def require_authorized_for_current_lesson
      if current_course.enrolled_in? != current_course
        render plain: "Unauthorized", status: :unauthorized
        redirect_to course_path(current_course), alert: 'You are not enrolled in that course'
      end
    end
end
