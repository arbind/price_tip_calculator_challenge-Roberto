# Be sure to restart your server when you modify this file.
Rails.application.config.assets.version = '1.0'

# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join('node_modules')
# Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
# Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'stylesheets')
# Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'javascripts')

Rails.application.config.assets.precompile += %w( .svg .eot .woff .ttf .otf )

Rails.application.config.assets.precompile += %w( website.css website.js website-theme.js )
