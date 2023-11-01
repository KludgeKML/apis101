module Api
  module V1
    class GroupsController < ApplicationController
      before_action :set_group, only: %i[ show update destroy add_user_to_group ]

      # GET /groups
      def index
        @groups = Group.all.order(:id)

        render json: @groups
      end

      # GET /groups/1
      def show
        render json: @group, include: [:users]
      end

      # POST /groups
      def create
        @group = Group.new(group_params)

        if @group.save
          render json: @group, status: :created, location: api_v1_group_url(@group)
        else
          render json: @group.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /groups/1
      def update
        if @group.update(group_params)
          render json: @group
        else
          render json: @group.errors, status: :unprocessable_entity
        end
      end

      # PUT /groups/1/users/1
      def add_user_to_group
        if @group.users << User.find_by(id: params[:user_id])
          render json: @group
        else
          render json: @group.errors, status: :unprocessable_entity
        end
      end

      # DELETE /groups/1
      def destroy
        @group.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_group
          @group = Group.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def group_params
          params.require(:group).permit(:name)
        end
    end
  end
end
