Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post "/directors" => "directors#create"
  post "/directors/:id" => "directors#update"
  get "/delete_directors/:id" => "directors#destroy"

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post "/movies" => "movies#create"
  post "/movies/:id" => "movies#update"
  get "/delete_movies/:id" => "movies#destroy"
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post "/actors" => "actors#create"
end
