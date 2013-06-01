require 'sprockets'
require 'uglifier'

module Padrino
  ##
  # Add public api docs here
  module Assets
    class << self

      def registered(app)
        app.set :serve_assets, true
        app.set :assets, Sprockets::Environment.new
        app.settings.assets.append_path File.join(app.settings.root, 'assets/javascripts')
        app.settings.assets.js_compressor  = Uglifier.new(mangle: true)

        app.get "/assets/javascripts/:file.js" do
          content_type "application/javascript"
          if settings.assets["#{params[:file]}.js"]
            settings.assets["#{params[:file]}.js"]
          else
            not_found
          end
        end
      end

      alias :included :registered
    end
  end
end
