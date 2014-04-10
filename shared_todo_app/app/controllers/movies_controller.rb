class MoviesController < ApplicationController
  def index
      @movies = Movie.all
  end

  def create
      @movie = Movie.new(movie_params)
      @movie.save
      redirect_to movies_path
  end

  def update
      if params[:watched_toggle]
          params[:movies_checkbox].each do |check|
              movie_id = check
              m = Movie.find_by_id(movie_id)
              m.update_attribute(:watched, !m.watched)
          end
      end
      redirect_to movies_path
  end

  def self.getpic(title)
      results = GoogleCustomSearchApi.search(title + " minimalist movie poster", :num => 1)
      results.items.first do |item|
          puts item.link
      end
  end

  private
      def movie_params
          params.require(:movie).permit(:title)
      end

end
