class BagelsController < ApplicationController


    def index
        @bagels = Bagel.all 
        render json: @bagels
    end

end
