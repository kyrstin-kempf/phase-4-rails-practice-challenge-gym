class ClientsController < ApplicationController

    def index 
        clients = Client.all 
        render json: clients, except: [:created_at, :updated_at]
    end

    def show 
        client = Client.find_by(id: params[:id])
        if client
            render json: client, except: [:created_at, :updated_at]
        else
            render json: {error: 'Client not found'}, status: :not_found
        end
    end

    def update 
        client = Client.find_by(id: params[:id])
        if client 
            client.update(params.permit(:name, :age)) 
            render json: client, except: [:created_at, :updated_at]
        else 
            render json: { error: 'Client not found' }, status: :not_found
        end
    end

end
