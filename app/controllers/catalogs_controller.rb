class CatalogsController < ApplicationController
  def index
    @catalog_items = Catalog.all
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
    @catalog_item = Catalog.find(params[:id])
  end

  def update
    @catalog_item = Catalog.find(params[:id])
    respond_to do |format|
      if @catalog_item.update(catalog_params)
        format.html { redirect_to catalogs_path, notice: 'Your portfolio item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @catalog_item = Catalog.find(params[:id])
  end

  def destroy
    @catalog_item = Catalog.find(params[:id])
    @catalog_item.destroy
    respond_to do |format|
      format.html { redirect_to catalogs_url, notice: 'Portfolio item was successfully removed.' }
    end
  end

  private
    def catalog_params
      params.require(:catalog).permit(:title, :subtitle, :body, technologies_attributes:[:name])
    end
end
