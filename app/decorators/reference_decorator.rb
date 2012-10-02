class ReferenceDecorator < ApplicationDecorator
  decorates :reference

  def author_list(dup = false)
    if dup
      s = "---"
    else
      s = ""
      model.authors.each_with_index do |a, i|
        if i == 0
          s += "#{ a }"
        elsif i > 0 && model.authors.size == 2
          s += " and #{ a.full_name }"
        elsif i > 0 && i < model.authors.size - 1
          s += ", #{ a.full_name }"
        else
          s += ", and #{ a.full_name }"
        end
      end
    end
    s
  end

  def title
    if model.title && model.collection
      content_tag :em, "#{ model.title.titleize }"
    elsif model.title
      s = "\"#{ model.title.titleize }.\" "
      s += content_tag :em, "#{ monograph.title.titleize }"
    end
  end

  def publisher
    if model.publisher
      "#{ model.publisher }"
    end
  end

  def year
    if model.date
      "#{ model.date.strftime("%Y") }"
    end
  end

  def medium
    if model.medium
      "#{ model.medium.capitalize }"
    end
  end

  def to_mla(dup = false)
    s =  "#{ author_list(dup) }. "
    s += "#{ title }. "
    s += "#{ publisher }, "
    s += "#{ year }. "
    s += "#{ medium }."
  end
  alias_method :to_s, :to_mla
end