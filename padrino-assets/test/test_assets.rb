require File.expand_path(File.dirname(__FILE__) + '/helper')
require File.expand_path(File.dirname(__FILE__) + '/fixtures/assets_app/app')

describe 'Padrino::Assets' do
  def app
    AssetsApp
  end

  context 'for application behavior' do
    it 'knows that it is serving assets' do
      assert_equal app.serve_assets?, true
    end
  end

  context 'for javascript assets' do
    # it 'sets up the default javascript route' do
    #   get '/assets/javascripts/application.js'
    #   assert_equal  200, last_response.status
    # end

    it 'can retrieve an asset by file name' do
      get '/assets/javascripts/unrequired.js'
      assert_match 'var unrequired;', last_response.body
    end

    it 'shows a 404 for unkown assets' do
      get '/assets/javascripts/xyz.js'
      assert_not_equal 200, last_response.status
    end

    it 'picks up require statements' do
      get '/assets/javascripts/app.js'
      p last_response.body
      assert_match 'var second_js_file;', last_response.body
    end
  end
end
