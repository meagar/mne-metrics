
class EventsController < ApplicationController

  before_filter :find_event, only: %w(edit update delete)

  def root
    @events = Event.order('starts_at desc')
    @events = @events.limit(10)
    apply_filters
  end

  def index
    @events = Event.order('starts_at desc')
    @events = @events.send(params[:team]) if params[:team]
    apply_filters
  end

  def new
    @event = Event.new
    @events = Event.order(:starts_at)
  end

  def create
    @event = Event.new(create_params)

    if @event.save
      redirect_to '/', notice: { success: 'Created' }
    else
      @events = Event.order(:starts_at)
      render 'new'
    end

  end

  def edit
  end

  def update
    @event.update_attributes(update_params)
    redirect_to events_path, notice: { success: 'Event updated' }
  end

  def destroy
    @event.destroy
    redirect_to root_url
  end

  protected

  def find_event
    @event = Event.find(params[:id])
  end

  def create_params
    params.require(:event).permit(:starts_at, :team, :description, :description_link, :metrics_impact, :results)
  end

  def update_params
    create_params
  end

  def apply_filters
    @team = params[:team] || 'all'

    @events = @events.send(@team) unless @team == 'all'

    @date = params[:date] || 'all'

    if @date == 'month'
      @events = @events.where('starts_at > ?', Time.now.yesterday.midnight - 4.weeks)
    end 
  end
end

