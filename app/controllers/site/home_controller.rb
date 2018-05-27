class Site::HomeController < ApplicationController
  layout "site"

  def index
    @topics = Topic.all
  end
end
