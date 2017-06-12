class CategoriesController < ApplicationController
  def index
  	@categories = Category.all.order(:name)
  end

  def new
  end

  def edit
  end

  def show
  end
end
