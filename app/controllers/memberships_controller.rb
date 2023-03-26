class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        memberships = Membership.all
        render json: memberships
    end
    
    def create
        membership = Membership.new(membership_params)
        if membership.save
            render json: membership
        else
            render json: membership.errors.full_messages, status: 422
        end
    end

    def destroy
        membership = Membership.find(params[:id])
        membership.destroy
        head :no_content
    end


    private
    def membership_params
        params.require(:membership).permit(:client_id, :gym_id, :charge)
    end

    def render_not_found_response
        render json: { error: "Membership not found" }, status: :not_found
    end
end
