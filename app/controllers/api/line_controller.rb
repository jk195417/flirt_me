class Api::LineController < ApiController
  def callback
    render plain: 'success', status: 200
  end
end
