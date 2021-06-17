class SpicesController < ApplicationController
    #GET
    def index
        spices = Spice.all
        render json: spices
    end

    #Post
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :create
    end
    
    #PATCH /spices/:id
    def update
        spice = Spice.find_by(id: params[:id])
        if spice 
            spice.update(spice_params)
            render json: bird
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end
    
    #DELETE
    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice 
            spice.destroy
            head :no_content
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
