module IconHelper
  def icon(name, type, classes = "")
    content_tag(:i, '', class: "fa-#{type} fa-#{name} #{classes}")
  end
end