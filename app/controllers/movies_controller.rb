class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    movie = Movie.new(
      title: params[:title],
      year: params[:year],
      duration: params[:duration],
      description: params[:description],
      image: params[:image],
      director_id: params[:director_id]
    )
    movie.save

    redirect_to("/movies")
  end

  def update 
    movie = Movie.find(params[:id])

    movie.title = params[:title]
    movie.year = params[:year]
    movie.duration = params[:duration]
    movie.description = params[:description]
    movie.image = params[:image]
    movie.director_id = params[:director_id]
    
    movie.save

    redirect_to("/movies/#{params[:id]}")
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.delete

    redirect_to("/movies")
  end

end
