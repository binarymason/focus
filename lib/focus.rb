module Focus
  class << self
    def root
      File.expand_path("../..", __FILE__)
    end
  end
end

require "focus/action"
require "focus/actions"
require "focus/cli"
require "focus/config"
require "focus/config_loader"
require "focus/formatter"
require "focus/stdout"
require "focus/string"
require "focus/util"
require "focus/utils"
require "focus/version"
