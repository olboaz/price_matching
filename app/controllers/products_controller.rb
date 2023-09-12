class ProductsController < ApplicationController
    def index
        @products = Product.all
        @customers = Customer.order(:name)
    end
    
    def show 
    end

    def new
    end

    def create
    end

    def edit
    end

    def Update
    end

    def destroy
    end

    private

    def product_params
        params.require(:product).permit(:id, :short_name, :long_name, :quantity, :size, :company, :brand, :ean, :categories)
    end
end