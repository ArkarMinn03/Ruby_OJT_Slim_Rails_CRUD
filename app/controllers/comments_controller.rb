class CommentsController < ApplicationController
  def new
    @feed = Feed.find(params[:feed_id])
    @comment = Comment.new
  end

  def create
    comment_params = params.require(:comment).permit(:content, :user_id, :feed_id)

    user = User.find(comment_params[:user_id])
    feed = Feed.find(comment_params[:feed_id])

    @comment = Comment.new(content: comment_params[:content], user: user, feed: feed)

    if @comment.save
      redirect_to feed_path(feed)
    else
      render :new
    end
  end

  def destroy
    feed = Feed.find(params[:feed_id])
    @comment = feed.comments.find(params[:id])
    @comment.destroy

    redirect_to feed_path(feed), status: :see_other
  end
end
