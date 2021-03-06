class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :dislike]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit


  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def dislike
    if @post.dislike_count.nil?
      @post.dislike_count = 0
    end
    @post.dislike_count = @post.dislike_count + 1
    @post.save
    redirect_to posts_path
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json


  # DELETE /posts/1
  # DELETE /posts/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :photo, :user_id)
    end
end
