require "json"
require "kemal"
require "./citrin/core/*"
require "./citrin/utils/*"
require "docker"

include Citrin::Core
include Citrin::Utils

get "/" do
  "Hello World!"
end

post "/push" do |env|
  repository = env.params.json["repository"].as(Hash(String, JSON::Type))
  name = repository["name"].as(String)
  clone_url = repository["clone_url"].as(String)
  response = Docker::Container.create("docker.io/crystallang/crystal")
  container_id = JSON.parse(response.body)["Id"].to_s[0,12]
  id = Array(String).new(1){ container_id }
  container = Docker.client.containers(all: true, filters: {"id" => id}).first
  container.start
  container.exec "git", "clone", clone_url
  paths = container.exec "bash", "-c", "cd #{name} && find spec -name \"*_spec.cr\" -type f"
  result = Executor.new(name, container).run_all_test paths.lines
  puts result
  #Dir.cd("../")
  #Shell.run("rm -rf #{name}")
  container.stop
  container.remove

  {result: "success"}.to_json
end

Kemal.run
