class PagesController < ApplicationController
  def home 
  end
  def about
  end
  def officers
  end
  def ipc
  end
  def cpc
  end
  def contact
  end
  def events
    @events = Event.all
  end
  def new_event
  end
  def create_event
    @event = Event.new
    @event.name = params['name']
    @event.location = params['location']
    @event.date = params['date']
    @event.sign_ups = params['sign_ups']
    @event.maximum = params['maximum']
    @event.time = params['time']
    @event.user_id = params['user_id']
    @event.hours = params['hours']
    @event.save
    redirect_to '/events'
  end
  def edit_event
    @event = Event.find_by_id(params['id'])
  end
  def change_event
    @event = Event.find_by_id(params['id'])
    @event.name = params['name']
    @event.location = params['location']
    @event.date = params['date']
    @event.sign_ups = params['sign_ups']
    @event.maximum = params['maximum']
    @event.time = params['time']
    @event.user_id = params['user_id']
    @event.hours = params['hours']
    @event.save
    redirect_to "/events"
  end
end