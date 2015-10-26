class StaticPagesController < ApplicationController
  before_action :authenticate_admin!
  before_filter :disable_nav

  def home
  end
end
