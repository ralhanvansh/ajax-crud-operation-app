class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article = Article.new

  end

  def create
    @article = Article.create(article_params)
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def edit
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      respond_to do |format|
        format.html {}
        format.js {}
      end
    else
      flash[:alert] = "Something went wrong, Data not updated"
      render root_path
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end

  private
    def article_params
      params.require(:article).permit(:title,:body)
    end
end
