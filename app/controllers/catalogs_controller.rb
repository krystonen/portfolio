class CatalogsController < ApplicationController
  def index
    @catalog_items = Catalog.all
  end

  def new
    @catalog_item = Catalog.new
  end

  def create
    @catalog_item = Catalog.new(params.require(:catalog).permit(:title, :subtitle, :body))

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
      if @catalog_item.update(params.require(:catalog).permit(:title, :subtitle, :body))
        format.html { redirect_to catalogs_path, notice: 'Your portfolio item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @catalog_item = Catalog.find(params[:id])
  end

end
