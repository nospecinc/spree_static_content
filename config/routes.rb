Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :pages
  end

  get '/blog/posts.rss', to: 'static_content#blog_feed'

  constraints(Spree::StaticPage) do
    get '/(*path)', to: 'static_content#show', as: 'static'
  end
end
