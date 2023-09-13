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

    def barcode
      # recherche si ean existe
      # si oui
      # ajouter un nouveau prix client
      # sinon
      # créer le product en allant chercher les infos sur l'api open food fact + ajouter nouveau prix client

    end

    private

    def product_params
        params.require(:product).permit(:id, :short_name, :long_name, :quantity, :size, :company, :brand, :ean, :categories)
    end
end
