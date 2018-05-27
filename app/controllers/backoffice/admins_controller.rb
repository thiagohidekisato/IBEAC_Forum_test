class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    @admin.role = 1
    if @admin.save
      flash[:success] = "Admin '#{@admin.email}' was registered!"
      redirect_to backoffice_admins_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    passwd = params[:admin][:password]
    passwd_conf = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_conf.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admin.update(params_admin)
      flash[:success] = "Admin was edited"
      redirect_to backoffice_admins_path
    else
      render :edit
    end
  end

  def destroy
    Admin.destroy(params[:id])
    flash[:success] = "Admin was deleted"
    redirect_to backoffice_admins_path
  end

  private

  def params_admin
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end
