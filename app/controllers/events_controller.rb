class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[ show index ]
  # Задаем объект @event для экшена show
  before_action :set_event, only: [:show]
  # Задаем объект @event от текущего юзера для других действий
  before_action :set_current_user_event, only: %i[ edit update destroy ]

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Событие создано."
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Событие обновлено."
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to @event, notice: "Событие удалено."
  end

  private

  def set_current_user_event
    @event = current_user.events.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description)
  end
end
