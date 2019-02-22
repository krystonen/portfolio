module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Portfolio Website | Krisztina Kovari"
    @seo_keywords = "krisztina kovari portfolio website webdevelopment rails ruby react software development"
  end
end
