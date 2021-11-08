class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :tenant_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :tenant_invalid

    def index
        all_tenants = Tenant.all 
        render json: all_tenants
    end

    def show
        this_tenant = Tenant.find(params[:id])
        render json: this_tenant
    end

    def create
        new_tenant = Tenant.create!(tenants_params)
        render json: new_tenant, status: :created
    end

    def update
        this_tenant = Tenant.find(params[:id])
        this_tenant.update!(tenants_params)
        render json: this_tenant, status: :no_content
    end

    def destroy
        this_tenant = Tenant.find(params[:id])
        this_tenant.destroy
        render status: :ok
    end

    private

    def tenants_params
        params.permit(:name, :age)
    end

    def tenant_not_found
        render json: { error: "Tenant not found" }, status: :not_found
    end

    def tenant_invalid(error_hash)
        render json: { errors: error_hash.records.errors.full_messages }, status: :unprocessable_entity
    end
end
