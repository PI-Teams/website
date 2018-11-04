class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_sidebar_topics, except: [:update, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    if logged_in?(:site_admin)
      @blogs = Blog.recent.page(params[:page]).per(5)
    else
      @blogs = Blog.published.recent.page(params[:page]).per(5)
    end
    @page_title = "IC-MN Blog"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show

    if request.path != blog_path(@blog)

      return redirect_to @blog, :status => :moved_permanently

    end

    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new

      @page_title = @blog.title 
      @seo_keywords = @blog.permalink
   
    else
      redirect_to blogs_path, notice: "Sie haben keine Zugang zu dieser Seite"
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    user = current_user
    @blog = user.blogs.build(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Der Blog ist jetzt live.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Der Blog wurde erfolgreich gespeichert.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog gelöscht.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
        
    redirect_to blogs_url, notice: 'Blog wurde aktualisiert.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id, :status, :permalink, :audio, {images: []})
    end

    def set_sidebar_topics
      @side_bar_topics = Topic.with_blogs
    end
end
