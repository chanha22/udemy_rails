module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_filter :set_title
  end

  def set_title
    @page_title = "Devcamp Portfolio | My portfolio Website"
    @seo_keywords = "chanha portfolio site"
  end
end
