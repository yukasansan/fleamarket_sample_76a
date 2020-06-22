class GenresController < ApplicationController
before_action :set_genre, only: [:edit, :update, :destroy]

    def new
      @genres = Brand.all
      @genre = Brand.new
    end
  
    def create
      @genre = Brand.create(genre_params)
      redirect_to new_genre_path
    end

    def edit
    end

    def update
      @genre.update(genre_params)
      redirect_to new_genre_path
    end

    def destroy
      @genre.destroy
      redirect_to new_genre_path
    end
  
  
    private
    def genre_params
      params.require(:genre).permit(:name)
    end

    def set_genre
      @genre = Brand.find(params[:id])
    end

end
