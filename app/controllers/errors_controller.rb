class ErrorsController < ApplicationController
  def e404
    respond_to do |format|
      format.html { render template: 'errors/e404', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end
end