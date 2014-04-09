class MoviesController < ApplicationController
  def index
      @movies = Movie.all
  end

  def create
      @movie = Movie.new(movie_params)
      @movie.save
      redirect_to movies_path
  end

  private
      def movie_params
          params.require(:movie).permit(:title)
      end

end
