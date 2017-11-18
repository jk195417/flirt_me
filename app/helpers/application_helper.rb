module ApplicationHelper
  def nav_li(text, path, klass: '', method: :get, inner_class: '', target: nil)
    active = request.path == path ? 'active' : ''
    klass += ' nav-item'
    content_tag :li, link_to(text, path, method: method, class: "nav-link #{active} #{inner_class}", target: target), class: klass
  end
end
