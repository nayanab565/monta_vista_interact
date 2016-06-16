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
    @signups = Signup.all
    @users = User.all
  end
  def new_event
    user = User.find_by(id: session['uid'])
    if user.blank?
      redirect_to '/events'
    elsif user.isAdmin == true
      render 'new_event'
    else
      redirect_to '/events'
    end
  end
  def create_event
    @event = Event.new
    @event.name = params['name']
    @event.location = params['location']
    @event.date = params['date']
    @event.sign_ups = params['sign_ups']
    @event.maximum = params['maximum']
    @event.time = params['time']
    @event.hours = params['hours']
    @event.completed = params['completed']
    @event.description = params['description']
    @event.save
    redirect_to '/events'
  end
  def edit_event
    @signups = Signup.all
    @users = User.all
    user = User.find_by(id: session['uid'])
    if user.blank?
      redirect_to '/events'
    elsif user.isAdmin == true
      @event = Event.find_by_id(params['id'])
      render 'edit_event'
    else
      redirect_to '/events'
    end
  end
  def change_event
    @signups = Signup.all
    @users = User.all
    @event = Event.find_by_id(params['id'])
    @event.name = params['name']
    @event.location = params['location']
    @event.date = params['date']
    @event.sign_ups = params['sign_ups']
    @event.maximum = params['maximum']
    @event.time = params['time']
    @event.hours = params['hours']
    @event.completed = params['completed']
    @event.description = params['description']
    @event.save
    redirect_to "/events"
  end
  
  def complete_event
  @event = Event.find_by(id: params[:id])
    @event.completed = true
  @event.save

  redirect_to "/events"
end
end