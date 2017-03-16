module Focus
  class ChangeBlinkColor < Action
    def call
      context.fail! unless perform
    end

    private

    def perform
      url = "#{config.blink_server}/fadeToRGB?rgb=%#{context.color}"
      res = HTTParty.get(url)
      res.code == 200
    end
  end
end
