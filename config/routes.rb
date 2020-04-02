Rails.application.routes.draw do
  if LIVE_WEB # https Redirect
    get "*path" => redirect("https://#{FQDN}/%{path}"), :constraints => { :protocol => "http://" }
  end

  root to: 'website#home', as: :homepage
  get '/app', to: 'app#index', as: :app

  # Marketing Site
  get '/for_events', to: "website#for_events", as: :for_events
  get '/contact_us', to: "website#contact_us", as: :contact_us
  post '/contact_us', to: "website#send_message", as: :send_us_a_message

  get '/choose/sign_up', to: "website#choose_registeration", as: :choose_registration
  get '/choose/sign_in', to: "website#choose_sign_in", as: :choose_sign_in
  get '/schedule_demo', to: "website#schedule_demo", as: :schedule_demo
  get '/terms-of-service', to: "website#tos", as: :tos
  get '/privacy', to: "website#privacy", as: :privacy
  get '/sponsor-terms-of-service', to: "website#sponsor_tos", as: :sponsor_tos
  get '/organizer-terms-of-service', to: "website#org_tos", as: :org_tos
  get '/sponsor-cancellation-policy', to: "website#sponsor_cancellation_policy", as: :sponsor_cancellation_policy
  get '/organizer-cancellation-policy', to: "website#organizer_cancellation_policy", as: :organizer_cancellation_policy
  get '/announcement-new-platform-launch', to: "website#announcement_new_platform_launch", as: :announcement_new_platform_launch

  get 'website', to: "website#home"

  get 'sitemap.xml', :to => 'xml_sitemap#index', :defaults => { :format => 'xml' }
  get '/robots.txt' => 'xml_sitemap#robots'

end
