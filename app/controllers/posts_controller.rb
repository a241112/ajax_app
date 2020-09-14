class PostsController < ApplicationController
  def index # indexアクションを定義した
    @posts = Post.all.order(id: "DESC") # 全てのレコードを@postsに代入
  end

  # def new
  # end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end

  def checked
    post = Post.find(params[:id])
    if post.checked then
      post.update(checkes: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
