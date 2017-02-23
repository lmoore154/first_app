require 'sinatra'
require 'sqlite3'
require'active_record'

require_relative 'base_lorem'
require_relative 'tina'
require_relative 'futurama'
require_relative 'adev'
require_relative 'ipsum'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db.sqlite3"
)

get "/" do
  "Welcome!"
end

get "/lorems" do
  ipsums = Ipsum.all
  ipsums.to_json
end

post "/lorem/new" do
  ipsum = Ipsum.new(params)
  if ipsum.save
    "Name: #{ipsum.name}, paragraph: #{ipsum.paragraph}"
  else
    status 404
  end
end

get "/lorem/:lipsum/?:num?" do
  if %w(adev futurama tina).include? params[:lipsum]
    Object.const_get(params[:lipsum].capitalize).call(params[:num])
  elsif Ipsum.find_by(id: params[:lipsum])
  # elsif params[:lipsum].to_i > 0
    ipsum = Ipsum.find(params[:lipsum])
    "<p>Name: #{ipsum.name}</p>
    <p>Paragraph: #{ipsum.paragraph}</p>"
  else
    status 404
  end
end

get "/:name" do
  "Hi, #{params[:name]}!"
end
