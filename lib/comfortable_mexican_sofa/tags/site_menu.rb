class ComfortableMexicanSofa::Tag::SiteMenu
  include ComfortableMexicanSofa::Tag
  
  def self.regex_tag_signature(identifier = nil)
    identifier ||= /[\w\-]+/
    /\{\{\s*cms:site_menu\s*\}\}/ # not really using identifier
  end

  def content
    site = Cms::Site.find(page.site_id)
    "<%= render :partial => 'cms_content/menu', locals: {menu_id: #{site.menu_id}} %>"
  end

  def render
    whitelist = ComfortableMexicanSofa.config.allowed_partials
    if whitelist.is_a?(Array)
      content if whitelist.member?(identifier)
    else
      content
    end
  end
end