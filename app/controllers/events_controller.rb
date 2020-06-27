# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :owner_only, only: %i[edit update destroy]

  def index
    @events = Event.all
  end

  def past
    @past_events = Event.past_events
  end

  def live
    @live_events = Event.live_events
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event), notice: "Successfully created #{@event.name}"
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event.destory
    redirect_to events_path
  end

  private

  def owner_only
    @event = Event.find(params[:id])
    redirect_to events_path if current_user != @event.creator
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :location, :cover_image)
  end
end
