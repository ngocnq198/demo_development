module ApplicationHelper
  def context_title page_title = ""
    default = t "title_default"
    if page_title.empty?
      default
    else
      page_title +  " | " + default
    end
  end
end
