require_relative 'options'

module Cryptogram
  class Solver
    def initialize(argv)
      @options = Options.new(argv)
    end

    def solve
    end
  end
end
