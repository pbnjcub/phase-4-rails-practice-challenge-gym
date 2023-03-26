class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show
        find_client
        render json: client
    end

    private
    def find_client
        client = Client.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end
end
