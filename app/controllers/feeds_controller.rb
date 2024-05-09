class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
  end

  def show
    @feed = Feed.find(params[:id])
  end

  def new
    @feed = Feed.new
  end

  def create
    @user = User.find(current_user.id)
    @feed = @user.feeds.create(feed_params)

    if @feed.save
      redirect_to @feed
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @feed = Feed.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:id])

    if @feed.update(feed_params)
      redirect_to @feed
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    redirect_to @feed, status:  :see_other
  end

  private
    def feed_params
      params.require(:feed).permit(:body, :status)
    end
end
