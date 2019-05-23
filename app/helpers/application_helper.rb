module ApplicationHelper
  def yes_no_icon(value)
    content_tag(:i, value ? 'check' : 'clear', class: "material-icons text-#{value ? 'success' : 'danger'}")
  end

  def unknown_if_blank(value, options={})
    check_object = options.fetch(:check_object, value)
    check_object.blank? ? content_tag(:span, t(options.fetch(:text, :unknown)), class: 'text-muted') : value
  end
end
