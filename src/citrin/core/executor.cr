module Citrin::Core
  class Executor

    def run_all_test(paths)
      result = Hash(String, Time::Span).new
      paths.each do |path|
        file = path.split('/').last
        result[file] = run_test path
      end
      result
    end

    def run_test(path)
      stdout, stderr = IO::Memory.new, IO::Memory.new
      status = Process.run(command(path), shell: true, output: stdout, error: stderr)
                      .exit_code

      raise stderr if status != 0

      get_time(output.to_s)
    end

    def command(path)
      "crystal spec #{path} --time"
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
