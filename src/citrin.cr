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

  #Dir.cd("../")
  #Git.clone clone_url
  #Dir.cd(name)
  
  Docker::Container.create("alpine")
  container = Docker.client.containers(all: true).first
  container.start
  container.exec "git clone #{clone_url}"

  paths = Traverser.new.all_file_path "spec"
  paths.select! { |path| !/_spec.cr/.match(path).nil?  }
  result = Executor.new.run_all_test paths
  
  Dir.cd("../")
  Shell.run("rm -rf #{name}")

  {result: "success"}.to_json
end

Kemal.run
