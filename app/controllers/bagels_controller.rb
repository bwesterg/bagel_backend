class BagelsController < ApplicationController

    before_action :find_bagel, only: [:update, :destroy]

    def index
        @bagels = Bagel.all 
        render json: @bagels
    end

    def show
        @bagel = Bagel.find_by(bagel_params)
        render json: @bagel
    end

    def create
        @bagel = Bagel.create(bagel_params)
        render json: @bagel, status: :created
    end

    def update
        @bagel.update(bagel_params)
        render json: @bagel
    end

    def destroy
        @bagel = Bagel.find(params[:id])
        @bagel.destroy
        
        render status: :no_content
    end

    private

    def find_bagel
        @bagel = Bagel.find(params[:id])
    end

    def bagel_params
        params.require(:bagel).permit(:name, :rating)
    end

end
