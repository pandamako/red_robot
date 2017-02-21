require 'rspec/collection_matchers'
require_relative '../lib/parser'

describe Parser do
  let(:parser) { Parser.new line.split }
  describe '#call' do
    let(:line) { 'PLACE 1,2,EAST MOVE MOVE FOO LEFT MOVE REPORT' }
    subject { parser.call }
    it do
      is_expected.to have(6).items
      expect(subject.map(&:name)).to eq %w(place  move move left move report)
    end
  end
end
