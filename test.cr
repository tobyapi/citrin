#require "mysql"
#require "crecto"
require "./src/citrin/core/*"
require "./src/citrin/utils/*"

include Citrin::Core
include Citrin::Utils

def test
  Dir.cd("../")
  Git.clone("https://github.com/TobiasGSmollett/crystalg.git")
  Dir.cd("crystalg")
  paths = Traverser.new.all_file_path "spec"
  paths.select! { |path| !/_spec.cr/.match(path).nil?  }
  puts paths  
  result = Executor.new.run_all_test paths
  Dir.cd("../")
  Shell.run("rm -rf crystalg")
  puts result
end

test()