module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "International Correspondents - Media Network"
    @seo_keywords = "Reportagen, Radio, Journalisten, Jutta Schwengsbier, Mirko Schwanitz"
  end
end