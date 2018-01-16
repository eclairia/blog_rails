class AdminController < ApplicationController
  before_action :require_admin

  add_flash_types :danger, :success

  def require_admin
    unless current_admin
      redirect_to root_path, danger: "You don't have access to this page"
    end
  end
end