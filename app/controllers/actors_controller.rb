class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    actor = Actor.new(
      name: params[:name],
      dob: params[:dob],
      bio: params[:bio],
      image: params[:image]
    )
    actor.save

    redirect_to("/actors")
  end

  def update
    actor = Actor.find(params[:id])

    actor.name = params[:name]
    actor.dob = params[:dob]
    actor.bio = params[:bio]
    actor.image = params[:image]

    actor.save

    redirect_to("/actors/#{params[:id]}")
  end

  def destroy
    actor = Actor.find(params[:id])
    actor.delete

    redirect_to("/actors")
  end
end
