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

    get "/events/:event_id/transactions", Events::TransactionsController, :index
    post "/events/:event_id/transactions", Events::TransactionsController, :create

    get "/events/:event_id/balances", Events::BalancesController, :index
  end

  routes :api do
    get "/events", EventsController, :index
    post "/events", EventsController, :create
    get "/friends", FriendsController, :index
    post "/friends", FriendsController, :create
    delete "/friends/:friend_id", FriendsController, :delete

    post "/events/:event_id/invitations", Events::InvitationsController, :create

    namespace "/events/:event_id" do
      post "/survey", Events::SurveysController, :create
      get "/survey", Events::SurveysController, :index

      post "/albums", Events::AlbumsController, :create
      get "/albums", Events::AlbumsController, :index

      namespace "/albums/:album_id" do
        post "/medias", Events::Albums::MediasController, :create
      end
    end
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", Amber::Controller::Static, :index
  end
end
