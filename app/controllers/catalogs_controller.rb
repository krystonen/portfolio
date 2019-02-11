class CatalogsController < ApplicationController
  def index
    @catalog_items = Catalog.all
  end
end
