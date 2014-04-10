class MoviesController < ApplicationController
  def index
      @movies = Movie.order(watched: :asc).order(created_at: :desc)
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
			elsif params[:delete_movies]
					params[:movies_checkbox].each do |check|
              movie_id = check
              m = Movie.find_by_id(movie_id)
							m.delete
					end
      end
      redirect_to movies_path
  end

  def self.getpiclink(title)
		image = Google::Search::Image.new(:query => title + " minimalist movie poster").first	
		return image.uri
  end

  private
      def movie_params
          params.require(:movie).permit(:title)
      end

end
