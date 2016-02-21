class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def new
    @article = Article.new
  end

  def index
    #@article = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article is successfully created!"  #Show message if article is created successfully
      redirect_to article_path(@article)  #redirect to the show page
    else
      render 'new'  #render the new create template again
    end

  end

  def show
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article is successfully deleted"
    redirect_to articles_path
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
  
    def require_same_user
      if current_user != @article.user
        flash[:danger] = "You can only edit or delete your own article"
        redirect_to root_path
      end
    end

end