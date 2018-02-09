class WelcomeController < ApplicationController

  # GET /articles
  # GET /articles.json
  def index
    @page_title = t(:welcome_on_figaroblog_title)
    @meta_descr = t(:welcome_on_figaroblog_descr)
  end
end
