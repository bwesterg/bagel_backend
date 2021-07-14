class BagelsController < ApplicationController


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
        render json: @bagel
    end

    def update
        @bagel = Bagel.find_by(bagel_params)
        @bagel.save
        render json: @bagel

    end

    def destroy
        @bagel = Bagel.find(params[:id])
        @bagel.destroy
        
        render status: :no_content
    end

    private

    def bagel_params
        params.require(:bagel).permit(:name, :rating)
    end

end
