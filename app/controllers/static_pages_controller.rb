class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.microposts.paginate page: params[:page]
    end
  end

  def about
  end

  def contact
  end

  def help
  end
end