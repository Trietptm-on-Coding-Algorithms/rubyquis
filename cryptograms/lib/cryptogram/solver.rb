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
  #
  # Solves a cryptogram puzzle.
  #
  # @author James Espinosa <jamesejr@gmail.com>
  #
  class Solver
    # @return [Cryptogram::Options]
    attr_reader :options

    #
    # Instantiates Solver class with user options.
    #
    # @param [Cryptogram::Options] argv
    #
    def initialize(argv)
      @options = Options.new(argv)
    end

    #
    # Provides the solution to a cryptogram.
    #
    # @return [Array]
    #
    def solve
      if files_exist?
        #do magic
      end
    end

    private

    #
    # Helper method that verifies the existance of the dictionary and puzzle files.
    #
    # @return [Bool]
    #   True if dictionary and puzzle exists, False if either one doesn't exist.
    # @private
    def files_exist?
      File.exists?(options.dictionary) and File.exists?(options.puzzle)
    end

    #
    # Helper method that retrieves words from the file specified.
    #
    # @param file [String] The file to read the words from
    # @return [Array] A collection of words
    # @private
    def get_words_from(file)
      if File.exists?(file)
        words = []
        File.open(file).each { |word| words << word.chomp }
        return words
      end
    end
  end
end
