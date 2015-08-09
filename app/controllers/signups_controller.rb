class SignupsController < ApplicationController
  before_filter :login_required
  def index
    @signups = Signup.all
    @user = User.find_by(id: session['uid'])
    if @user.id != 1
      redirect_to "/sessions/new"
    end
  end

  def show
    @signup = Signup.find_by(id: params[:id])
    @user = User.find_by(id: session['uid'])
    if @user.id != 1
      redirect_to "/sessions/new"
    end
  end

  def new
  end

  def create
    @signup = Signup.new
    @signup.user_id = session['uid']
    @signup.event_id = params['id']
    @signup.is_complete = false

    if @signup.save
      @event = Event.find_by_id(params['id'])
      @event.sign_ups += 1
      @event.save
      redirect_to "/events"
    else
      render "/users/#{session['uid']}"
  end
end

def edit
   @user = User.find_by(id: session['uid'])
    if @user.id != 1
      redirect_to "/sessions/new"
    end
  @signup = Signup.find_by(id: params[:id])
end

def update
  @signup = Signup.find_by(id: params[:id])
  @signup.is_complete = params['is_complete']
  @user = User.find_by(id: @signup.user_id)
  @event = Event.find_by(id: @signup.event_id)
  if @signup.is_complete == true
    @signup.save
    @user.hours += @event.hours
    if @user.save
      redirect_to "/users/#{ @signup.user_id }"
      return
    else
    end
  end
  @signup.save
  redirect_to "/signups/#{ @signup.id }"
end

def destroy
   @user = User.find_by(id: session['uid'])
    if @user.id != 1
      redirect_to "/sessions/new"
    end
  @signup = Signup.find_by(id: params[:id])
  @signup.destroy


  redirect_to "/events"
end

def cancel_signup
  @signup = Signup.where(event_id: params[:id])
  @todestroy = @signup.find_by(user_id: session['uid'])
  @event = Event.find_by(id: params[:id])
  @event.sign_ups -= 1
  @event.save
  @todestroy.destroy

  redirect_to "/events"
end
end
