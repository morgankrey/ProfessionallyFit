class PostsController < ApplicationController
   before_action :admin_user
   def new
      @post = Post.new(user_id: current_user.id)
   end

   def create
      post = current_user.posts.build(post_params)
      if post.save
         flash[:success] = "Post created"
         redirect_to root_url
      else
         @feed_items = []
         render 'static_pages/home'
      end
   end

   def destroy
      @post = Post.find(params[:id])
      if @post.present?
         @post.destroy
      end
      redirect_to root_url
   end

   private
      def post_params
         params.require(:post).permit(:content,
                                      :news,
                                      :blog,
                                      :nutrition,
                                      :training,
                                      :supplements,
                                      :title)
      end
end