class SessionsController < ApplicationController
  def new
  end 
  
  def create
    u = User.find_by(:student_id => params['student_id'])
    if u && u.authenticate(params['password'])
    session['student_id'] = params['student_id']
      session['uid'] = u.id
      redirect_to "/users/#{u.id}"
    else
      redirect_to '/sessions/new'
    end
  end
  
  def destroy
    reset_session
    redirect_to '/sessions/new'
  end
end