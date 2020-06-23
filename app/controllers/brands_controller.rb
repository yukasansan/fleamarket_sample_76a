class BrandsController < ApplicationController
  before_action :set_brand, only: [:edit, :update, :destroy]

    def new
      @brands = Brand.all
      @brand = Brand.new
    end
  
    def create
      @brand = Brand.create(brand_params)
      redirect_to new_brand_path
    end

    def edit
    end

    def update
      if @brand.update(brand_params)
        redirect_to new_brand_path
      else
        redirect_to edit_brand_path(@brand.id)
      end
    end

    def destroy
      @brand.destroy
      redirect_to new_brand_path
    end
  
  
    private
    def brand_params
      params.require(:brand).permit(:name)
    end

    def set_brand
      @brand = Brand.find(params[:id])
    end
end
