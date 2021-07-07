class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :activity_error 
 
    def index
        activities= Activity.all
        render json: activities 
    end

    def destroy
        activity= Activity.find(params[:id])
        activity.destroy
        render json: {},  status: 200
    end



private

def activity_error
   render json: {error: "Activity not found"}, status: :not_found
end


end


