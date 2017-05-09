require "../utils/shell_command"

module Citrin::Core
  class Executor
    include Citrin::Utils
    
    def run_all_test(paths)
      result = Hash(String, Time::Span).new
      paths.each do |path|
        file = path.split('/').last
        result[file] = run_test path
      end
      result
    end

    def run_test(path)
      result = Shell.run "crystal spec #{path} --time"
      get_time result
    end

    def get_time(output)
      result = Time::Span::MaxValue
      output.each_line do |line|
        if line.include? "Execute: "
          time, milisec = line.split('.')
          h,m,s = time.split(':').map { |e| e.to_i }
          result = Time::Span.new(0, h, m, s, milisec.to_i)
        end
      end
      result
    end
  end
end
