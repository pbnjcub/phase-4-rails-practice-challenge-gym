class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # before_action :find_memberships, only: [:destroy]

    def show
        find_gym
        render json: @gym, include: :clients
    end

    def destroy
        find_gym
        find_memberships
        if @memberships.length > 0
            render json: { errors: @gym.errors.full_messages }, status: :unprocessable_entity
        else
            @gym.destroy
            head :no_content
        end
    end

    private
    def find_gym
        @gym = Gym.find(params[:id])
    end

    def find_memberships
        @memberships = Membership.where(gym_id: params[:id])
    end


    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end
end
