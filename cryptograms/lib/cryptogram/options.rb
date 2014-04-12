require 'optparse'

module Cryptogram
  class Options

    def initialize(argv)
      parse(argv)
    end

    private

    def parse(argv)
      OptionParser.new do |opts|
        opts.banner = "Usage: cryptogram [options]"

        opts.on("-p", "--puzzle PATH", "Path to the puzzle") do |puzzle|
          @puzzle = puzzle
        end

        opts.on("-d", "--dict PATH", "Path to the dictionary") do |dict|
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
          STDERR.puts e.message, "\n", opts
          exit(-1)
        end
      end
    end
  end
end
