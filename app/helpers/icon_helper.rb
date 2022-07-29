module IconHelper
  def icon name, type
    content_tag(:i, '', class: "fa-#{type} fa-#{name}")
  end
end