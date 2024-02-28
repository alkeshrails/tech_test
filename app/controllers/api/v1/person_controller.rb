module Api
  module V1
    class PersonController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_person, only: [:show, :update, :destroy]

      def index
        @people = Person.all
        render turbo_stream: turbo_stream.replace('people_list', partial: 'people_list')
      end

      def create
        @person = Person.new(person_params)
        if @person.save
          render turbo_stream: turbo_stream.append('people_list', partial: 'people_list'),status: :created
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      def update
        if @person.update(person_params)
          render turbo_stream: turbo_stream.replace('people_list', partial: 'people_list')
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @person.destroy
      end

      private

      def set_person
        @person = Person.find(params[:id])
      end

      def person_params
        params.require(:person).permit(:name, :email)
      end
    end
  end
end
