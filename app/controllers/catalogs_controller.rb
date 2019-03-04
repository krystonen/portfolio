class CatalogsController < ApplicationController
  before_action :set_catalog_item, only: [:edit, :update, :show, :destroy]
  layout 'catalog'
  access all: [:show, :index, :angular],
         user: {except: [:destroy, :new, :create, :update, :edit, :sort]},
         site_admin: :all

  def index
    @catalog_items = Catalog.by_position
  end

  def sort
    params[:order]. each do |key, value|
      Catalog.find(value[:id]).update(position: value[:position])
    end
    render nothing: true
  end

  def angular
    @angular_catalog_items = Catalog.angular
  end

  def new
    @catalog_item = Catalog.new
    3.times {@catalog_item.technologies.build}
  end

  def create
    @catalog_item = Catalog.new(catalog_params)

    respond_to do |format|
      if @catalog_item.save
        format.html { redirect_to catalogs_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @catalog_item.update(catalog_params)
        format.html { redirect_to catalogs_path, notice: 'Your portfolio item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @catalog_item.destroy
    respond_to do |format|
      format.html { redirect_to catalogs_url, notice: 'Portfolio item was successfully removed.' }
    end
  end

  private
    def catalog_params
      params.require(:catalog).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes:[:name]
                                      )
    end
    def set_catalog_item
      @catalog_item = Catalog.find(params[:id])
    end
end
