require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrpgApp
  class Application < Rails::Application
    config.load_defaults 8.1

    # Propshaft に stylesheets を読ませる
    config.assets.paths << Rails.root.join("app/assets/stylesheets")
  end
end
