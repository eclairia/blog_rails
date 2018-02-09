class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def blog

    @articles = Article.published(true).language(cookies[:lang]).alpha.paginate(page: params[:page], per_page: 5).search(params[:search])
    @categories = Category.all
  end

  # GET /article/1
  # GET /article/1.json
  def show
      @page_descr = @article.text.truncate(120)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text, :image, :slug, :language)
    end
end
