# frozen_string_literal: true

module Seedbank
  class Runner
    module Notifier
      def evaluate(_seed_task, seed_file)
        relative_seed_file_path = seed_file.gsub(Rails.root.to_s, "")
        puts "-- Seeding: #{relative_seed_file_path}"

        super_result = nil
        duration = Benchmark.measure { super_result = super }.real
        puts "   -> #{'%.4f' % duration}s"
        super_result
      end
    end
  end
end
