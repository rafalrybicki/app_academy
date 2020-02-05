class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase) } ? true : false
  end

  def initialize(pegs)
    if self.class.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise 'invalid pegs'
    end
  end

  def self.random(length)
    pegs = Array.new(length) { Code::POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(instance)
    instance.pegs.each_with_index.inject(0) do |acc, (el, index)|
      acc+=1 if el == @pegs[index]
      acc
    end

    #(0...guess_code.length).count { |i| guess_code[i] == @pegs[i] }
  end

  def num_near_matches(instance)
    instance.pegs.each_with_index.inject(0) do |acc, (el, index)|
    if !(el == @pegs[index]) && @pegs.include?(el)
      acc +=1
    end
      acc
    end
  end

  def ==(instance)
    instance.pegs == @pegs
  end

end
