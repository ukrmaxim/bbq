class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_event, only: %i[show edit update destroy]

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # GET /events
  def index
    @events = policy_scope(Event)
  end

  # GET /events/1
  def show
    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["event_#{@event.id}_pincode"] = params[:pincode]
    end
    authorize @event
  rescue Pundit::NotAuthorizedError
    flash.now[:alert] = t('controllers.events.wrong_pincode') if params[:pincode].present?
    render 'pincode_form'
  end

  # GET /events/new
  def new
    @event = current_user.events.build
    authorize @event
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events
  def create
    @event = current_user.events.build(event_params)

    authorize @event

    if @event.save
      redirect_to @event, notice: t('controllers.events.created')
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: t('controllers.events.updated')
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    authorize @event

    @event.destroy
    redirect_to @event, notice: t('controllers.events.destroyed')
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end
end
