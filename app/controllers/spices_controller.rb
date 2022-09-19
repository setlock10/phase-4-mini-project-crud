class SpicesController < ApplicationController
    def index
        spices=Spice.all
        render json: spices
    end

    # def show
    #     spice=Spice.find_by(id: params[:id])
    #     render json: spice
    # end

    def update
        spice=Spice.find_by(id: params[:id])
        spice.update(params.permit(:title, :image, :description, :notes, :rating))
        render json: spice
    end

    def create
        spice=Spice.create(params.permit(:title, :image, :description, :notes, :rating))
          if spice
            render json: spice, status: :created
          else
            render json: { error: spice.errors }, status: :unprocessable_entity
          end
    end

    def destroy
        spice=Spice.find_by(id: params[:id])
        spice.destroy
        if spice
            spice.destroy
            head :no_content
          else
            render json: { error: "Spice not found" }, status: :not_found
          end

        
    end
end
