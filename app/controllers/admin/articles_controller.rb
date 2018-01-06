class Admin::ArticlesController < AdminController
  before_action :set_article, only: [:edit, :update, :publish, :destroy]
  before_action :set_article_admin, only: [:showAdmin]
  before_action :set_article_paginate, only: [:index]

  # GET /article
  # GET /article.json
  def index
    @page_title = "Articles page"
    @meta_descr = "Page admin!"
    @articles = Article.published(false).alpha.paginate(page: params[:page], per_page: 5)
    render layout: "admin"
  end

  # GET /article/new
  def new
    @article = Article.new
    render layout: "admin"
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_path, notice: 'Article was successfully created.' }
      else
        format.html { render :new, layout: "admin", notice: 'The article could not be created' }
      end
    end
  end

  # GET /article/1/edit
  def edit
    render layout: "admin"
  end

  # PATCH/PUT /article/1
  # PATCH/PUT /article/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :showAdmin, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    if @article.update_attribute(:online, true)
      redirect_to admin_articles_path, notice: 'Article was successfully published'
    else
      render @article, layout: "admin", notice: 'Problem with the publication of the article, retry in a few moment pls'
    end
  end

  # DELETE /article/1
  # DELETE /article/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_path, notice: 'Article was successfully destroyed.' }
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
    @articles = Article.alpha.paginate(page: params[:page], per_page: 5)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:admin_id, :title, :text, :image)
  end
end