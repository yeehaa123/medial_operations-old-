class ApplicationDecorator < Draper::Base
  include Draper::LazyHelpers

  def heading
    "#{ model }"
  end

  def description
    if model.description
      content_tag :p, kramdown(model.description)
    end
  end
end