require "mysql"
require "crecto"

module Citrin::Core
  module Repo extend Crecto::Repo
    config do |conf|
      conf.adapter = Crecto::Adapters::Mysql
      conf.database = ENV["DB"]
      conf.hostname = ENV["HOST"]
      conf.username = ENV["USER"]
      conf.password = ENV["PASS"]
      conf.port = ENV["PORT"]
    end
  end

  class Result < Crecto::Model
    def initialize(@run_id, @file_path, @time) end

    schema "results" do
      field :run_id, Int32
      field :file_path, String
      field :time, String
    end
  end
end