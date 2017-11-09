# frozen_string_literal: true

module Tracing
  module Scrubber
    class Variables
      def self.perform(variables = {}, blacklist = [])
        new.scrub(variables, blacklist)
      end

      def scrub(variables, blacklist)
        variables.each_with_object({}).each do |(key, value), obj|
          obj[key] = blacklist.include?(key) ? scrub_value : value
        end
      end

      private

      def scrub_value
        '*' * 5
      end
    end
  end
end
