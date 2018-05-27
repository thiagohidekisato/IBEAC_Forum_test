class Backoffice::TopicsController < BackofficeController
  before_action :set_topic, only: [:edit, :update]
  before_action :set_select, only: [:new, :edit]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params_topic)
    if @topic.save
      flash[:success] = "Topic '#{@topic.title}' was registered!"
      redirect_to backoffice_topics_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(params_topic)
      flash[:success] = "Topic was edited"
      redirect_to backoffice_topics_path
    else
      render :edit
    end
  end

  def destroy
    Topic.destroy(params[:id])
    flash[:success] = "Topic was deleted"
    redirect_to backoffice_topics_path
  end

  private

  def params_topic
    params.require(:topic).permit(:kind, :title, :text, :member_id, :category_id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_select
    @members = Member.all.collect{ |s| [s.email, s.id]}
    @categories = Category.all.collect{ |s| [s.description, s.id]}
  end

end
