module Backstage::SidebarHelper
  def sidebar_toggler
    icon = fa_icon('bars')
    content_tag :div, icon, id: 'sidebar-toggler', class: 'btn btn-outline-dark'
  end

  def sidebar_card_link(content, path, klass: '', id: nil)
    border = 'rounded-0 border-bottom-0 border-right-0 border-left-0'
    # active = (request.path == path ? 'active' : '')
    # all_class = "#{border} #{klass} #{active}"
    all_class = "#{border} #{klass}"
    link_to content, path, class: all_class, id: id
  end
end
