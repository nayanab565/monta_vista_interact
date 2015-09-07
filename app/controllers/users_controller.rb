class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  def index
    @users = User.all
    @user = User.find_by(id: session['uid'])
    if @user.isAdmin == false
      redirect_to "/sessions/new"
    end
  end

  def show
    @user = User.find_by(id: session['uid'])
    if ((@user.id).to_i == (params[:id]).to_i) || (@user.isAdmin == true)  
      @user = User.find_by(id: params['id'])
    else
      redirect_to "/sessions/new"
    end
  end

  def new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.grade = params[:grade]
    @user.student_id = params[:student_id]
    @student_id_confirmation = params[:student_id_confirmation]
    @user.hours = 0.0
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.isAdmin = false
    
    if (@student_id_confirmation == @user.student_id && @user.save)
        redirect_to "/sessions/new"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: session['uid'])
    if (@user.id == params['id']) || (@user.isAdmin == true)  
      @user = User.find_by(id: params['id'])
    else
      redirect_to "/sessions/new"
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.grade = params[:grade]
    @signedinperson = User.find_by(id: session['uid'])
    if @signedinperson.isAdmin == true
      @user.hours = params[:hours]
      @user.isAdmin = params[:isAdmin]
    end
    if @user.save
      redirect_to "/users/#{ @user.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: session['uid'])
    if @user.isAdmin == false
      redirect_to "/sessions/new"
      return
    else
      @user = User.find_by(id: params[:id])
      @signups = Signup.where(user_id: params['id'])
      @signups.each do |signup|
        @event = Event.find_by(id: signup.event_id)
        @event.sign_ups -= 1
        @event.save
      end
      @user.destroy
      redirect_to "/users"
    end
  end
end
