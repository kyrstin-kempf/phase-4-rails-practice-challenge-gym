class GymsController < ApplicationController

    def index 
        gyms = Gym.all 
        render json: gyms
    end
    
    def show 
        gym = Gym.find_by(id: params[:id])
        if gym
            render json: gym, except: [:created_at, :updated_at]
        else
            render json: {error: 'Gym not found'}, status: :not_found
        end
    end

    def update 
        gym = Gym.find_by(id: params[:id])
        if gym 
            gym.update(params.permit(:name, :address)) 
            render json: gym 
        else 
            render json: { error: 'Gym not found' }, status: :not_found
        end
    end

    def destroy 
        gym = Gym.find_by(id: params[:id])
        if gym
            gym.destroy 
            head :no_content 
        else 
            render json: {error: 'Gym not found'}, status: :not_found 
        end
    end

end
