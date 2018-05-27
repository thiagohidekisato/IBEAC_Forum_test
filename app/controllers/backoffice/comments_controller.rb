class Backoffice::CommentsController < BackofficeController
  before_action :set_comment, only: [:edit, :update]
  before_action :set_select, only: [:new, :edit]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params_comment)
    if @comment.save
      flash[:success] = "Comment '#{@comment.id}' was registered!"
      redirect_to backoffice_comments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(params_comment)
      flash[:success] = "Comment was edited"
      redirect_to backoffice_comments_path
    else
      render :edit
    end
  end

  def destroy
    Comment.destroy(params[:id])
    flash[:success] = "Comment was deleted"
    redirect_to backoffice_comments_path
  end

  private

  def params_comment
    params.require(:comment).permit(:text, :topic_id, :member_id, :comment_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_select
    @topics = Topic.all.collect{ |s| [s.title, s.id]}
    @members = Member.all.collect{ |s| [s.name, s.id]}
    @comments = Comment.all.collect{ |s| [s.text, s.id]}
  end



end
