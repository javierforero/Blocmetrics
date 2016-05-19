class API::EventsController < ApplicationController

  skip_before_action  :verify_authenticity_token
  before_filter :set_access_control_headers

  def create

    @registered_app = RegisteredApp.find_by(url: request.env['HTTP_ORIGIN'])
    @event = Event.new(event_params)
    @event.registered_app_id = @registered_app.id

    if @registered_app.nil?

      render json: "Sorry. This is an unregistered application", status: :unprocessable_entity
    elsif @event.save
      render json: @event, status: 200
    else
      render json: {error: "There was an error sending your request", status: 400}, status: 400
    end
  end

  def preflight
    head 200
  end

  def set_access_control_headers

    headers['Access-Control-Allow-Origin'] = '*'

    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'

    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
