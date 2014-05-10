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

require 'optparse'

module Cryptogram
  class Options
    attr_reader :puzzle, :dictionary

    def initialize(argv)
      parse(argv)
    end

    private

    def parse(argv)
      OptionParser.new do |opts|
        opts.banner = "Usage: cryptogram [options]"

        opts.on("-p", "--puzzle PATH", "Provide a path to the puzzle") do |puzzle|
          @puzzle = puzzle
        end

        opts.on("-d", "--dictionary PATH", "Provide a path to the dictionary") do |dictionary|
          @dictionary = dictionary
        end

        opts.on("-h", "--help", "Display this message") do
          puts opts
          exit
        end

        begin
          argv = ["-h"] if argv.empty?
          opts.parse!(argv)
        rescue OptionParser::ParseError => e
          STDERR.puts e.message, opts
          exit(-1)
        end
      end
    end
  end
end
