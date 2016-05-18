class API::EventsController < ApplicationController

  skip_before_action  :verify_authenticity_token
  before_filter :set_access_control_headers

  def create

    registered_app = RegisteredApp.find_by(url: request.ENV['HTTP_ORIGIN'])
    @event = Event.new(event_params)

    if registered_app == nil

      render json: "Sorry. This is an unregistered application", status: :unprocessable_entity
    elsif @event.valid?
      @event.save!
      render json: @event, status: :created
    else
      render json: {errors: @event.errors}, status: :unprocessable_entity
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
