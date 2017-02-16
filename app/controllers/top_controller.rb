class TopController < ApplicationController
  wrap_parameters format: [:json]

  def index
  end

  def callback
    p request
    MessageParser.parse(request)
    head 200, content_type: 'text/html'
  end

  def line
  end
end
