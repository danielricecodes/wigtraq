# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def display_boolean(bool)
    case bool
      when true
        return "Yes"
      when false
        return "No"
    end
    return "???"
  end
end
