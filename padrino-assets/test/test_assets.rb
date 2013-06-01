require File.expand_path(File.dirname(__FILE__) + '/helper')
require File.expand_path(File.dirname(__FILE__) + '/fixtures/assets_app/app')

describe 'Padrino::Assets' do
  context 'for application behavior' do
    it 'knows that it is serving assets' do
      assert_equal mock_app.serve_assets?, true
    end
  end
end
