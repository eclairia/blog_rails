class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "root", password: "root", only: [:index, :showAdmin, :new, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :publish, :destroy]
  before_action :set_article_admin, only: [:showAdmin]
  before_action :set_article_paginate, only: [:index]

  # GET /articles
  # GET /articles.json
  def index
    @page_title = "Articles page"
    @meta_descr = "Page admin!"
    render layout: "admin"
  end

  def blog
    @articles = Article.published(true).alpha.paginate(page: params[:page], per_page: 5).search(params[:search])
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
      @page_descr = @article.text.truncate(120)
  end

  # GET /articles/1
  # GET /articles/1.json
  def showAdmin
    @page_title = @article.title
    @page_descr = @article.text.truncate(120)
    render layout: "admin"
  end

  # GET /articles/new
  def new
    @article = Article.new
    render layout: "admin"
  end

  # GET /articles/1/edit
  def edit
    render layout: "admin"
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    if @article.save
      render 'showAdmin', notice: 'Article was successfully created.'
    else
      render 'new', layout: "admin"
    end
  end

  def publish
    if @article.update_attribute(:online, true)
      redirect_to articles_path, notice: 'Article was successfully published'
    else
      render 'articles', layout: "admin", notice: 'Problem with the publication of the article, retry in a few moment pls'
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def set_article_admin
      @article = Article.find(params[:article_id])
    end

    def set_article_paginate
      @articles = Article.published(false).alpha.paginate(page: params[:page], per_page: 5).search(params[:search])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text, :url_picture, :image)
    end
end
