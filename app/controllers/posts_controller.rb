class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:update, :destroy]
  
  
  def create
    @post = current_user.posts.build(post_params)
    @post.group_id = params[:group_id]
    @group = Group.find_by(id: params[:group_id])
    # binding.pry
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to posts_group_path(@group)
    else
      @posts = @group.posts.order(id: :desc).page(params[:page]).per(20)
      flash.now[:danger] = "投稿できませんでした。"
      render "groups/posts"
    end    
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "投稿を編集しました。"
      redirect_to posts_group_path(@group)
    else
      flash.now[:danger] = "投稿を編集できませんでした。"
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to posts_group_path(@group)
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:content, :image)
  end
  
  def correct_user
    @post = Post.find_by(id: params[:id])
    params[:group_id] = @post.group_id
    @group = Group.find_by(id: params[:group_id])
     
    unless current_user == @post.user
        redirect_to groups_user_path(current_user)
    end
  end
  
  def set_post
    @post = current_user.posts.find_by(id: params[:id])
  end
end
