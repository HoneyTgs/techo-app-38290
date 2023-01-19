class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @plans = user.plans
  end  
end
