class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article is successfully created!"  #Show message if article is created successfully
      redirect_to article_path(@article)  #redirect to the show page
    else
      render 'new'  #render the new create template again
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end