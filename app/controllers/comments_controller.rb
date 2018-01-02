class CommentsController < ApplicationController
  #http_basic_authenticate_with name: "root", password: "root", only: [:index, :edit, :update, :destroy]
  before_action :set_article_admin, except: [:update]
  before_action :set_comment, except: [:create]

  def showAdmin
  end

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
    render layout: "admin"
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_showAdmin_path
    else
      render 'edit'
    end
  end

def destroy
    @comment.destroy
    redirect_to article_showAdmin_path
end  

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

    def set_article_admin
      @article = Article.find(params[:article_id])
    end

    def set_comment
      @comment = Comment.alpha.find(params[:id])
    end
end