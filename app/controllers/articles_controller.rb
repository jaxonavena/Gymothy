class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # instantiates new article but doesn't save it -- this article will be used in the view when building the form
  def new
    @article = Article.new
  end

  # instantiates new article and attempts to save it
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      # Else, the action redisplays the form by rendering app/views/articles/new.html.erb with status code 422 Unprocessable Entity.
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
