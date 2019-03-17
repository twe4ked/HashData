require 'toml-rb'

class HashData
  def initialize
    @patterns = TomlRB.load_file('data/regexes.toml').map do |regex, matches|
      [Regexp.new(regex), matches.join(', ')]
    end
  end

  def check(input)
    patterns.map { |i| i[1] if i[0].match(input) }.compact.uniq.join(', ')
  end

  def check_type(input, hashtype)
    patterns.each do |i|
      return true if i[0].match(input) and i[1].start_with?(hashtype)
    end
    false
  end

  private

  attr_reader :patterns
end
