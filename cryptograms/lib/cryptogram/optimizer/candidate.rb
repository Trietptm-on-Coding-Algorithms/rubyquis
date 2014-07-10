=begin
The MIT License (MIT)

Copyright (c) 2014 James Espinosa

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=end

module Cryptogram
  module Optimizer
    #
    # Provides a list of possible candidates based on letter count.
    #
    # @author James Espinosa <jamesejr@gmail.com>
    #
    class Candidate
      attr_reader :dictionary
      attr_reader :mappings

      def initialize(dictionary)
        @dictionary = dictionary
        @mappings   = map(dictionary)
      end

      def map(dictionary)
        words = {}

        File.open(dictionary).each do |word|
          word = word.chomp
          length = word.length
          words[word] = length
        end
        words
      end

      def fetch_for(word)
        candidates = []

        length = word.chomp.length.to_i
        results = mappings.select { |k, v| mappings[k] == length }

        results.each_key { |k| candidates << k }
        return candidates
      end
    end
  end
end
