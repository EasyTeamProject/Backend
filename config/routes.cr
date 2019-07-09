Amber::Server.configure do
  pipeline :public do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
  end

  pipeline :api do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Pipes::Auth.new
    # plug Amber::Pipe::CORS.new
  end

  # All static content will run these transformations
  pipeline :static do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :public do
    post "/users", UsersController, :create
    get "/users", UsersController, :index
    post "/sessions", SessionsController, :create
  end

  routes :api do
    get "/events", EventsController, :index
    get "/events/:id", EventsController, :show
    patch "/events/:id", EventsController, :update
    post "/events", EventsController, :create

    get "/profile", SessionsController, :show

    get "/friends", FriendsController, :index
    post "/friends", FriendsController, :create
    delete "/friends/:friend_id", FriendsController, :delete

    namespace "/events/:event_id" do
      get "/transactions", Events::TransactionsController, :index
      post "/transactions", Events::TransactionsController, :create

      get "/balances", Events::BalancesController, :index

      post "/invitations", Events::InvitationsController, :create
      delete "/invitations/:user_id", Events::InvitationsController, :delete

      post "/survey", Events::SurveysController, :create
      get "/survey", Events::SurveysController, :index

      post "/medias", Events::MediasController, :create
      get "/medias", Events::MediasController, :index
    end
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", Amber::Controller::Static, :index
  end
end
