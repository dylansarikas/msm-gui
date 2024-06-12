class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def create
    @dir = Director.new(
      name: params[:name],
      dob: params[:dob],
      bio: params[:bio],
      image: params[:image]
    )
    @dir.save

    redirect_to("/directors")
  end

  def update
    @dir = Director.find(params[:id])
    @dir.name = params[:name]
    @dir.dob = params[:dob]
    @dir.bio = params[:bio]
    @dir.image = params[:image]

    @dir.save

    redirect_to("/directors/#{params[:id]}")
  end

  def destroy
    @dir = Director.find(params[:id])
    @dir.destroy

    redirect_to("/directors")
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
end
