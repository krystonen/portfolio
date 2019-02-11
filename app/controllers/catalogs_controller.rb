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
        # format.json { render :show, status: :created, location: @catalog }
      else
        format.html { render :new }
        # format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end
end
