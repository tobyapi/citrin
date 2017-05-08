module Citrin::Core
  class Traverser
    def all_file_path(root_path)

      result = Array(String).new
      queue = Array(String).new
      queue << root_path

      until (current = queue.first?).nil?
        queue.shift
        
        if File.file? current
          result << current
        else
          Dir.foreach(current) do |entry|
            next if entry == "." || entry == ".."
            queue << current + '/' + entry
          end
        end
      end
      result
    end
  end
end
