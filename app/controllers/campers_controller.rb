class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_error

def index
   campers= Camper.all
   render json: campers 
   
end

def show
   camper= Camper.find(params[:id])
   render json: camper, include: :activities
end

def create
   camper= Camper.create(camper_params)
   if camper.valid?
   render json: camper, status: 201    
   else
   render json:  {errors: camper.errors.full_messages}, status: 400   
   end
end


private


def camper_error
   render json: {error: "Camper not found"}, status: :not_found
end

def camper_params
 params.permit(:name, :age)
end

   

end
