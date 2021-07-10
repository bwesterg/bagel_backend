class BagelsController < ApplicationController


    def index
        @bagels = Bagel.all 
        render json: @bagels
    end

    def create
        @bagel = Bagel.create(bagel_params)
        render json: @bagel
    end

    private

    def bagel_params
        params.require(:bagel).permit(:name, :rating)
    end

end
