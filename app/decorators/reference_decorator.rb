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
    s += ". "
  end

  def title
    if model.title && model.collection
      s = content_tag :em, "#{ model.title.titleize }"
      s += ". "
    elsif model.title
      s = "\"#{ model.title.titleize }.\" "
      s += content_tag :em, "#{ monograph.title.titleize }"
      s += ". "
    end
  end
  
  def editor_list
    if model.respond_to?(:monograph) 
      editors = model.monograph.editors
    else
      editors = model.editors
    end
    if editors
      s = ""
      editors.each_with_index do |t, i|
        if i == 0
          s += "Ed. #{ t.full_name}"
        elsif i > 0
          s += " and #{t.full_name}"
        end
        s += ". "
      end
    end
    s
  end

  def translator_list
    if model.translators.size > 0
      s = ""
      model.translators.each_with_index do |t, i|
        if i == 0
          s += "Trans. #{ t.full_name }"
        elsif i > 0
          s += " and #{ t.full_name }"
        end
      end
      s += ". "
    end
  end

  def publisher
    if model.respond_to?(:monograph) && model.monograph.editors
      "#{ model.monograph.publisher }"
    elsif model.editors
      "#{ model.publisher }"
    end
  end

  def year
    if model.date
      "#{ model.date.strftime("%Y") }"
    end
  end

  def pages
    if model.pages
      "#{ model.pages }. "
    end
  end
  def medium
    if model.medium
      "#{ model.medium.capitalize }"
    end
  end



  def to_mla(dup = false)
    s =  "#{ author_list(dup) }"
    s += "#{ title }"
    s += "#{ editor_list }"
    s += "#{ translator_list }"
    s += "#{ publisher }, "
    s += "#{ year }. "
    s += "#{ pages }"
    s += "#{ medium }."
  end
  alias_method :to_s, :to_mla
end