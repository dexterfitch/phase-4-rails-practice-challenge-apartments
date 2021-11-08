class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :apartment_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :apartment_invalid

    def index
        all_apartments = Apartment.all 
        render json: all_apartments
    end

    def show
        this_apartment = Apartment.find(params[:id])
        render json: this_apartment
    end

    def create
        new_apartment = Apartment.create!(apartment_params)
        render json: new_apartment, status: :created
    end

    def update
        this_apartment = Apartment.find(params[:id])
        this_apartment.update!(apartment_params)
        render json: this_apartment, status: :no_content
    end

    def destroy
        this_apartment = Apartment.find(params[:id])
        this_apartment.destroy
        render status: :ok
    end

    private

    def apartment_params
        params.permit(:number)
    end

    def apartment_not_found
        render json: { error: "Apartment not found"}, status: :not_found
    end

    def apartment_invalid(error_hash)
        render json: { errors: error_hash.records.errors.full_messages}, status: :unprocessable_entity
    end
end
