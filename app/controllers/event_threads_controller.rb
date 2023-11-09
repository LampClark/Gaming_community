class EventThreadsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])

    if @event
      @event_thread = @event.event_threads.build(event_thread_params)
      @event_thread.user = current_user

      if @event_thread.save
        redirect_to event_path(@event), notice: "Thread posted successfully!"
      else
        render 'events/show'
      end
    else
      # Event not found
      redirect_to events_path, alert: "Discussion not found"
    end
  end

  private

  def event_thread_params
    params.require(:event_thread).permit(:content)
  end
end
