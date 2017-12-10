module ApplicationHelper
  def nav_li(text, path, klass: '', method: :get)
    active = request.path == path ? 'active' : ''
    klass += ' nav-item'
    content_tag :li, link_to(text, path, method: method, class: "nav-link #{active}"), class: klass
  end

  def flash_message
    alert_types = { notice: :success, alert: :danger, warning: :warning }
    x_options = { class: 'close', 'data-dismiss' => 'alert', 'aria-label' => 'Close' }
    x = content_tag :button, '×', x_options
    alerts = flash.map do |key, value|
      type = alert_types.fetch(key.to_sym) { key.to_s }
      content = x + value
      klass = "alert alert-#{type} alert-dismissible fade show"
      content_tag :div, content, class: klass, role: 'alert'
    end
    alerts.join('\n').html_safe
  end
end
