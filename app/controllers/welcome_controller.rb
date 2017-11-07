class WelcomeController < ApplicationController

  # GET /articles
  # GET /articles.json
  def index
    @page_title = "Welcome on the blog"
    @meta_descr = "Le blog du ta gueule c'est magique!"
  end
end
