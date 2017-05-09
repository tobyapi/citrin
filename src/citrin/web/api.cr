require "./*"
require "kemal"
require "json"

post "/push" do |env|
  payload = Citrin::Web::PushEvent.from_json env.params
  puts payload
  {result: "success"}.to_json
end

get "/" do
  "Hello World!"
end

