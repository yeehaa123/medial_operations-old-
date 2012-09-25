class ApplicationDecorator < Draper::Base
  include Draper::LazyHelpers

  def works_cited
    wc = []
    model.authors.each do |a|
      a.references.each do |r|
        wc << r
      end
    end
    wc
  end
  alias_method :readings, :works_cited 
  
  def description
    if model.description
      content_tag :p, kramdown(model.description)
    end
  end

  def heading
    "#{ model }"
  end
end