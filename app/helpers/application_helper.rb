module ApplicationHelper

  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title) # Method definition
    base_title = "Mag" # Variable assignment
    if page_title.empty? # Boolean test
      base_title # Implicit return
    else
      "#{page_title} | #{base_title}" # String interpolation
    end
  end

  def current_controller?(name)
    if controller.controller_name == name
      return true
    else
      return false
    end
  end

  def active_li(name, action, link_text, link_path)
    if current_page?(:controller => name, :action => action)
      content_tag(:li, :class => 'sub_show') do
        link_to link_text, link_path
      end
    else
      content_tag(:li) do
        link_to link_text, link_path
      end
    end

  end

  def formated_time(time)
    time.to_s(:time)
  end


end
