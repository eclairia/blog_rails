class AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    unless current_admin
      flash[:fail] = "You don't have access to this page"
      redirect_to root_path
    end
  end
end