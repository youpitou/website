class ArticlesController < ApplicationController
  before_filter :admin_user, :only => [:new, :edit, :update, :destroy]
  
  
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all(:order => "created_at DESC")
    @title ="News"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.all
@title = @article.title
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @title ="Create a new article"
    @article.content

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end

  end

  # GET /articles/1/edit
  def edit
    @title ="Edit article"
    @article = Article.find(params[:id])
    @article.content
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
 @article.content.html_safe
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
     @article.content.html_safe

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def admin_user
    redirect_to articles_path, :alert => "You can't access this page!" unless current_user && current_user.admin?
  end
  
end
