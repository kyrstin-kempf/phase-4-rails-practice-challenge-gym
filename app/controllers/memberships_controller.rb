class MembershipsController < ApplicationController
    
    def index 
        memberships = Membership.all 
        render json: memberships, except: [:created_at, :updated_at]
    end

    def create 
        membership = Membership.create(gym_id: params[:gym_id], client_id: params[:client_id], charge: params[:charge])
        if membership.valid? 
            render json: membership, status: :created
        else
            render json: { errors: membership.errors.full_messages }, status: :unprocessable_entity 
        end
    end

end
