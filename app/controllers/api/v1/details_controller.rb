module Api
  module V1
    class DetailsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_detail, only: [:update]

      def index
        render json: Detail.all
      end

      
      def create
        @detail = Detail.new(detail_params)
        if @detail.save
          render json: @detail, status: :created
        else
          render json: @detail.errors, status: :unprocessable_entity
        end
      end

      def update
        if @detail.update(detail_params)
          render json: @detail
        else
          render json: @detail.errors, status: :unprocessable_entity
        end
      end

      private

      def set_detail
        @detail = Detail.find(params[:id])
      end

      def detail_params
        params.require(:detail).permit(:description, :person_id)
      end
    end
  end
end
