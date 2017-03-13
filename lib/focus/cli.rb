require "optparse"
require "ostruct"
require "pp"

module Focus
  class Parser
    DEFAULT_VALUES = {
      minutes: 25,
      quiet:   true
    }.freeze

    class << self
      def parse(options)
        args = OpenStruct.new(DEFAULT_VALUES)
        parser = build_parser(args)
        parser.parse!(options)
        args
      end

      private

      def build_parser(args) # rubocop:disable MethodLength
        OptionParser.new do |opts|
          opts.banner = "Usage: example.rb [options]"

          opts.on("-v", "--verbose", "Run focus with more verbose STDOUT") do
            args.quiet = false
          end

          opts.on("-d", "--daemonize", "Allow focus to be forked to the background") do
            args.daemonize = true
          end

          opts.on("-tTIME", "--time=TIME", "Alias to minutes") do |t|
            args.minutes = t
          end

          opts.on("-mMINUTES", "--minutes=MINUTES", "How many minutes to focus.") do |m|
            args.minutes = m
          end

          opts.on("-h", "--help", "Prints this help") do
            puts opts
            exit
          end
        end
      end
    end
  end

  class CLI
    class << self
      def run!(argv)
        options = Parser.parse(argv)
        StartFocusTime.call(options.to_h)
      end
    end
  end
end
