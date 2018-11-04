module ApplicationHelper
  def stylesheets(*css)
    content_for(:stylesheets) { stylesheet_pack_tag(*css) }
  end

  def javascripts(*js)
    content_for(:javascripts) { javascript_pack_tag(*js) }
  end

  def packs(*name)
    stylesheets(*name)
    javascripts(*name)
  end
end
