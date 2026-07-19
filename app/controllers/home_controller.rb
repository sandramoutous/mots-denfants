class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  layout "landing", only: :index

  def index; end
end
