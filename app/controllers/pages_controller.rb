class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @properties = Properties.all
  end

  def contact
  end

  def entry
  end
end
