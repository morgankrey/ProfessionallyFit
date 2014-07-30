class StaticPagesController < ApplicationController
   before_action :signed_in_user, only: [:blog, :news, :nutrition, :training, :supplements]

   def home
      if signed_in?
         @feed_items = current_user.feed.paginate(page: params[:page])
      end
   end

   def help
   end

   def about
   end

   def contact
   end

   def blog
      @feed_items = Post.where(blog: true).paginate(page: params[:page]).limit(10)
   end

   def news
      @feed_items = Post.where(news: true).paginate(page: params[:page]).limit(10)
   end

   def nutrition
      @feed_items = Post.where(nutrition: true).paginate(page: params[:page]).limit(10)
   end

   def training
      @feed_items = Post.where(training: true).paginate(page: params[:page]).limit(10)
   end

   def supplements
      @feed_items = Post.where(supplements: true).paginate(page: params[:page]).limit(10)
   end
end
