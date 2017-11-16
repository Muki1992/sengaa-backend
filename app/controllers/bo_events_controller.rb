class BoEventsController < ApplicationController
  include Secured

  def index
    @events = Event.all
    render json: @events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_back(fallback_location: "pages/dashboard")
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_back(fallback_location: "pages/dashboard")
  end


  def event_params
    params.require(:user).permit(:name, :description)
  end

end