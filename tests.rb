require 'rubygems'
require 'bundler/setup'
ENV['RACK_ENV'] = 'test'

require 'test/unit'
require 'rack/test'
require 'faker'

require_relative 'first_app'
require_relative 'ipsum'
require_relative 'migration'

class FirstAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_the_index
    get '/'
    assert last_response.ok?
    assert_equal 'Welcome!', last_response.body
  end

  def test_names_page
    name = Faker::Name.first_name
    get "/#{name}"
    assert last_response.ok?
    assert_equal "Hi, #{name}!", last_response.body
  end

  def test_tina_lipsum
    get "/lorem/tina"
    assert last_response.ok?
    assert_equal Tina.text, JSON.parse(last_response.body)['paragraphs']
  end

  def test_adev_lipsum
    get "/lorem/adev/4"
    assert last_response.ok?
    assert_equal 4, JSON.parse(last_response.body)['paragraphs'].split("</p>").count
  end

  def test_futurama_lipsum
    get "/lorem/futurama/2"
    assert last_response.ok?
    assert_equal 2, JSON.parse(last_response.body)['paragraphs'].split("</p>").count
  end

  def test_make_a_post
    post "/lorem/new",
      { name: Faker::Zelda.character, paragraph: "this is a paragraph" }
    assert last_response.ok?
  end

end
