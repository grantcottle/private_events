# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :authenticate_user
  before_action :registered, only: [:create]

  def new
    @invitation = Invitation.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @invitation = Invitation.new(invitation_params.merge(attendee: current_user, attended_event: @event))
    if @invitation.save
      redirect_to event_path(@event), notice: 'Thanks for registering'
    else
      render :new
    end
  end

  private

  def authenticate_user
    @event = Event.find(params[:event_id])

    unless current_user
      redirect_to event_path(@event), alert: 'You must be logged in'
    end
  end

  def registered
    if Invitation.exists?(attendee: current_user, attended_event: @event)
      redirect_to event_path(@event), alert: 'You are already registerd for this event'
    end
  end

  def invitation_params
    params.require(:invitation).permit(:accepted)
  end
end
