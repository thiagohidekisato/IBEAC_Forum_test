class Backoffice::LikesController < BackofficeController
  before_action :set_like, only: [:edit, :update]
  before_action :set_select, only: [:new, :edit]

  def index
    @likes = Like.all
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(params_like)
    if @like.save
      flash[:success] = "Like '#{@like.id}' was registered!"
      redirect_to backoffice_likes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @like.update(params_like)
      flash[:success] = "Like was edited"
      redirect_to backoffice_likes_path
    else
      render :edit
    end
  end

  def destroy
    Like.destroy(params[:id])
    flash[:success] = "Like was deleted"
    redirect_to backoffice_likes_path
  end


  private

  def params_like
    params.require(:like).permit(:member_id, :comment_id)
  end

  def set_like
    @like = Like.find(params[:id])
  end

  def set_select
    @members = Member.all.collect{ |s| [s.name, s.id]}
    @comments = Comment.all.collect{ |s| [s.text, s.id]}
  end

end
