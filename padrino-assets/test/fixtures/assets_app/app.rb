require 'padrino-core'
require 'padrino-assets'

class AssetsApp < Padrino::Application
  register Padrino::Assets
end

Padrino.load!
