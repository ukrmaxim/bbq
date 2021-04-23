class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: "Событие создано."
    else
      render :new, status: :unprocessable_entity
    end
  end
end

# PATCH/PUT /events/1 or /events/1.json
def update
  if @event.update(event_params)
    redirect_to @event, notice: "Событие обновлено."
  else
    render :edit, status: :unprocessable_entity
  end
end

# DELETE /events/1 or /events/1.json
def destroy
  @event.destroy
  redirect_to @event, notice: "Событие удалено."
end

private

# Use callbacks to share common setup or constraints between actions.
def set_event
  @event = Event.find(params[:id])
end

# Only allow a list of trusted parameters through.
def event_params
  params.require(:event).permit(:title, :address, :datetime, :description)
end
