class ApplicationDecorator < Draper::Base
  include Draper::LazyHelpers

  def description
    if model.description
      content_tag :p, kramdown(model.description)
    end
  end

  def heading
    "#{ model }"
  end
end