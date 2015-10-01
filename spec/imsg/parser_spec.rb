require 'spec_helper'
require 'Imsg/parser'

describe Imsg::Parser do
  context '.parse' do
    it 'parse help' do
      expect {
        options = Imsg::Parser.parse(["--help"])
      }.to raise_error(SystemExit)
    end

    it 'parse contacts' do
      options = Imsg::Parser.parse(["--to", "foo@example.com,bar@example.com"])
      expect(options.contacts).to eq(["foo@example.com", "bar@example.com"])
    end

    it 'parse message attachment' do
      options = Imsg::Parser.parse(["--message", "README.md"])
      expect(options.attachment).to eq(File.expand_path("README.md"))
    end

    it 'parse message text' do
      options = Imsg::Parser.parse(["--message", "hello"])
      expect(options.text).to eq("hello")
    end
  end
end
