class UsersController < ApplicationController

  def show
    @carbon_quantity = current_user.trips.clean.carbon_quantity
    @relative_score = current_user.trips.clean.relative_score
  end





end
