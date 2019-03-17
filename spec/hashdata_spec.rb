require 'hashdata'

RSpec.describe HashData do
  TomlRB.load_file('data/fixtures.toml').each do |input, expected|
    it "#{input.inspect} matches #{expected.inspect}" do
      expect(HashData.new.check(input)).to eq expected.join(', ')
    end
  end

  it 'returns an empty string when there are no matching hashes' do
    expect(HashData.new.check('not a matching hash')).to be_empty
  end
end
