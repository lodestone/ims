require 'optparse'
require 'ostruct'

module Imsg
  class Parser
    class << self
      def parse(options)
        OpenStruct.new.tap do |args|
          args.contacts = []
          args.text = nil
          args.attachment = nil
          args.verbose = false

          opt_parser(args).parse!(options)
        end
      end

      private

      def opt_parser(args)
        OptionParser.new do |opts|
          opts.banner = "Usage: imsg [options]"

          opts.separator ""
          opts.separator "Specific options:"

          opts.on("-t", "--to x,y,z", Array, "Deliver message TO these contacts") do |contacts|
            args.contacts = contacts
          end

          opts.on("-m", "--message [MESSAGE]", String, "The MESSAGE to deliver") do |mesg|
            if File.exists?(mesg)
              args.attachment = File.expand_path(mesg)
            else
              args.text = mesg
            end
          end

          opts.separator ""
          opts.separator "Common options:"

          opts.on("-v", "--version", "Show version") do
            puts "imessage v#{Imsg::VERSION}"
            exit
          end

          opts.on("-h", "--help", "Prints this help") do
            puts opts
            exit
          end
        end
      end
    end
  end
end
