module ApplicationHelper
  def link_to_menu_item(menu_item)
    url = url_to_menu_item(menu_item)
    link_to(menu_item.label, url)
  end

  def url_to_menu_item(menu_item)
    if 'link' == menu_item.menu_item_type
      url = menu_item.link
    else
      if menu_item.page_id
        page = Cms::Page.find(menu_item.page_id)
        url = page.url
      else
        ComfyPress.logger.warn('Page is not selected for menu item.')
      end
    end

    url
  end
end
