# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w{ *.png *.jpg *.jpeg *.gif *.eot *.svg *.ttf *.woff }
Rails.application.config.assets.precompile += %w( min/slippry.min.js min/scripts.min.js min/initmap.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-select/i18n/*.js )
