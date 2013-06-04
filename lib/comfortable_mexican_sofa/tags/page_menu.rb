class ComfortableMexicanSofa::Tag::PageMenu
  include ComfortableMexicanSofa::Tag
  
  def self.regex_tag_signature(identifier = nil)
    identifier ||= /[\w\-]+/
    /\{\{\s*cms:page_menu\s*\}\}/ # not really using identifier
  end

  def content
    "<%= render :partial => 'cms_content/menu', locals: {menu_id: #{page.menu_id}} %>"
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