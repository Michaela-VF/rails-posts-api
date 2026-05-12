class PostsController < ApplicationController
  def index
    # shows all posts
    posts = Post.all
    render json: posts
  end

  def show
    # shows a specific post requested by its id
    post = Post.find(params[:id])
    render json: post
  end

  def create
    # crreates a new post with params from the URL
    post = Post.new(post_params)

      # if post?
      if post.save
        # runs validations before saving and renders respective json data
        render json: post, status: :created
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def update
    # updates an existing post with params from the URL
    post = Post.find_by(id: params[:id])

    return render json: { message: "Post not found!" }, status: :not_found unless post

    post.update(post_params)

    post.errors.any? ?
                      # this will handle errors, later can be handled with global error handling to keep controller skinny
                      render(json: { errors: post.errors.full_messages }, status: :unprocessable_entity) :
                      render(json: { message: "Post successfully updated" }, status: :ok)
  end

  def destroy
    post = Post.find_by(id: params[:id])

    return render json: { message: "Post not found" }, status: :not_found unless post

    post.destroy

    post.errors.any? ?
                    render(json: { errors: post.errors.full_messages }, status: :unprocessable_entity) :
                    render(json: { message: "Post sucessfully deleted" }, status: :ok)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
