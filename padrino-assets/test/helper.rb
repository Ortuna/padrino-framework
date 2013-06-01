require File.expand_path('../../../load_paths', __FILE__)
require File.join(File.dirname(__FILE__), '..', '..', 'padrino-core', 'test', 'mini_shoulda')
require 'rack/test'
require 'webrat'
require 'padrino-helpers'
require 'active_support/time'

class MiniTest::Spec
  include Padrino::Helpers::OutputHelpers
  include Padrino::Helpers::TagHelpers
  include Padrino::Helpers::AssetTagHelpers
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat.configure do |config|
    config.mode = :rack
  end

end

module Webrat
  module Logging
    def logger # @private
      @logger = nil
    end
  end
end
