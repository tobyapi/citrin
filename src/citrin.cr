require "json"
require "kemal"
require "./citrin/utils/*"

include Citrin::Utils

get "/" do
  "Hello World!"
end

post "/push" do |env|
  clone_url = env.params.json["repository"].as(Hash(String, JSON::Type)).fetch("clone_url").as(String)
  Git.clone clone_url
  {result: "success"}.to_json
end

Kemal.run
