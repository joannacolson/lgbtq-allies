class CategoriesController < ApplicationController
  def index
  	@categories = Category.all.order(:name)
  end

  def new
  	@category = Category.new
  	@resources = Resource.all.order(:name)
  end

  def edit
  	@category = Category.find(params[:id])
  	@resources = Resource.all.order(:name)
  end

  def show
  	@category = Category.find(params[:id])
    @places = []
    @category.resources.each do |r|
      if r.latitude && r.longitude # if both have geocode values
        obj = { lat: r.latitude, lng: r.longitude, infowindow: r.name }
        @places.push(obj)
      end
    end
    @places = @places.to_json
    # puts @places
  end

  def create
  	Category.create(category_params)
  	redirect_to categories_path
  end

  def destroy
  	@category_to_delete = Category.find(params[:id])
  	@category_to_delete.resources.clear # removes the resources associations before deleting the category
  	@category_to_delete.delete
  	redirect_to categories_path
  end

  def update
  	Category.find(params[:id]).update(category_params)
  	redirect_to categories_path
  end

	private

	def category_params # whitelisting
		params.require(:category).permit(:name, :resource_ids => [])
	end
end
