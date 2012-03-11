class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  
  before_filter :admin_user, :only => [:destroy]
 
  def create
    @article = Article.find(params[:article_id])
      @comment = @article.comments.build(params[:comment])
      @comment.user = current_user
    respond_to do |format|
      if @comment.save
                format.html { redirect_to(@article, :notice => 'Comment was successfully created.') }
              else
                format.html { redirect_to(@article, :alert => 'There was an error saving your comment (empty comment or comment way to long).') }
              end
          end
        end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

      respond_to do |format|
        format.html { redirect_to news_path, :notice => "Comment has been deleted"}
        format.json { head :ok }
    end
  end
  
  private 
  
  def admin_user

    redirect_to root_url, :alert => "You can't access this page!" unless current_user && current_user.admin?
  end
  
end
