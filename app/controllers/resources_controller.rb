require 'json'

class ResourcesController < ApplicationController
  def index
  	@resources = Resource.all.order(:name)
    @places = []
    @resources.each do |r|
      if r.latitude && r.longitude # if both have geocode values
        obj = { lat: r.latitude, lng: r.longitude, infowindow: r.name }
        @places.push(obj)
      end
    end
    @places = @places.to_json
    # puts @places
  end

  def new
  	@resource = Resource.new
  	@categories = Category.all.order(:name)
  end

  def edit
  	@resource = Resource.find(params[:id])
  	@categories = Category.all.order(:name)
  end

  def show
  	@resource = Resource.find(params[:id])
  end

  def create
  	Resource.create(resource_params)
  	redirect_to resources_path
  end

  def destroy
  	@resource_to_delete = Resource.find(params[:id])
  	@resource_to_delete.categories.clear # removes the categories associations before deleting the resource
  	@resource_to_delete.delete
  	redirect_to resources_path
  end

  def update
  	Resource.find(params[:id]).update(resource_params)
  	redirect_to resources_path
  end

	private

	def resource_params # whitelisting
		params.require(:resource).permit(:name, :address, :website, :phone, :description, :latitude, :longitude, :comment, :category_ids => [])
	end
end
