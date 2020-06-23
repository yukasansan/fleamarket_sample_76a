class BrandsController < ApplicationController
  before_action :set_brand, only: [:edit, :update, :destroy]

    def new
      @brands = Brand.includes(:name)
      @brand = Brand.new.includes(:name)
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
      if @brand.destroy
        redirect_to new_brand_path
      else
        redirect_to root_path
      end
    end
  
  
    private
    def brand_params
      params.require(:brand).permit(:name)
    end

    def set_brand
      @brand = Brand.find(params[:id])
    end
end
