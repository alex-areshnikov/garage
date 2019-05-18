module ApplicationHelper
  def yes_no_icon(value)
    content_tag(:i, value ? 'check' : 'clear', class: "material-icons text-#{value ? 'success' : 'danger'}")
  end
end
