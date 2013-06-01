module Padrino
  ##
  # Add public api docs here
  module Assets
    class << self
      def registered(app)
        app.set :serve_assets, true
      end

      alias :included :registered
    end
  end
end
