require 'spec_helper'
require 'Imsg/sender'

describe Imsg::Sender do
  context '#deliver' do
    it 'deliver with text only' do
      sender = Imsg::Sender.new
      expect(sender).to receive(:deliver_text).with('hello', 'foo@example.com')
      sender.deliver(text: 'hello', contacts: ['foo@example.com'])
    end

    it 'deliver with attachment only' do
      sender = Imsg::Sender.new
      expect(sender).to receive(:deliver_attachment).with('README.md', 'foo@example.com')
      sender.deliver(attachment: 'README.md', contacts: ['foo@example.com'])
    end

    it 'deliver nothing' do
      sender = Imsg::Sender.new
      expect {
        sender.deliver(text: nil, attachment: nil, contacts: ['foo@example.com'])
      }.to raise_error('You must specific a message, either a text or file attachment.')
    end
  end
end
