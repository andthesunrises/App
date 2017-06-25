module DefaultPageContent
  extend ActiveSupport::Concern
  
  included do
    before_filter :set_page_defaults
  end
  
  def set_page_defaults
    @page_title = "KY's Test Web App"
    @seo_keywords = "Kenneth  Yu Profolio"
  end
end