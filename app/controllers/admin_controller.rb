class AdminController < ApplicationController
  before_action :require_admin

  add_flash_types :danger, :success

  def require_admin
    unless current_admin
      redirect_to root_path, danger: t(:fail_access_page)
    end
  end
end