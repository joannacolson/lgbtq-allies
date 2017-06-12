class ResourcesController < ApplicationController
  def index
  	@resources = Resource.all.order(:name)
  end

  def new
  end

  def edit
  end

  def show
  end
end
