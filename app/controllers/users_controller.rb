class UsersController < ApplicationController

  def show
    @carbon_quantity = current_user.trips.carbon_quantity
    @relative_score = current_user.trips.relative_score
  end





end
