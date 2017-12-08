module Backstage::SidebarHelper
  def sidebar_toggler
    icon = content_tag :i, nil, 'data-feather' => 'sidebar'
    content_tag :div, icon, id: 'sidebar-toggler', class: 'btn btn-outline-dark'
  end
end
