class ApplicationDecorator < Draper::Base
  include Draper::LazyHelpers

  def cited_works
    if model.references.count > 0
      wc = ""
      model.references.list.each do |r|
        wc += content_tag :li, raw(r)
      end
      raw(wc)
    end
  end
  alias_method :readings, :cited_works
  
  def description
    if model.description
      content_tag :p, kramdown(model.description)
    end
  end
  
  def heading
    "#{ model }"
  end
end