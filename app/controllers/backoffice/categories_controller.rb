class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      flash[:success] = "Category '#{@category.description}' was registered!"
      redirect_to backoffice_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    Category.destroy(params[:id])
    flash[:success] = "Category was deleted"
    redirect_to backoffice_categories_path
  end

  def update
    if @category.update(params_category)
      flash[:success] = "Category was edited"
      redirect_to backoffice_categories_path
    else
      render :edit
    end
  end



  private

  def params_category
    params.require(:category).permit(:description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
