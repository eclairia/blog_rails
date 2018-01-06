class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "root", password: "root", only: [:index, :showAdmin, :new, :edit, :update, :destroy]
  before_action :set_article, only: [:show]

  def blog
    @articles = Article.published(true).alpha.paginate(page: params[:page], per_page: 5).search(params[:search])
  end

  # GET /article/1
  # GET /article/1.json
  def show
      @page_descr = @article.text.truncate(120)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def set_article_paginate
      @articles = Article.published(false).alpha.paginate(page: params[:page], per_page: 5).search(params[:search])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text, :image)
    end
end
