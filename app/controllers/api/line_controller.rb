class Api::LineController < ApiController
  def callback
    bot = LineBotService.new(request)
    bot.reply
    render plain: 'success', status: 200
  end
end
