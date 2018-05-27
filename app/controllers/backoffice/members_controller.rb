class Backoffice::MembersController < BackofficeController
  def index
    @members = Member.all
  end
end
