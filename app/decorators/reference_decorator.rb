class ReferenceDecorator < ApplicationDecorator
  decorates :reference

  def author_list(dup = false)
    if dup
      al = "---. "
    else
      al = ""
      model.authors.each_with_index do |a, i|
        if i == 0
          al += "#{ a }"
        elsif i > 0 && model.authors.size == 2
          al += " and #{ a.full_name }"
        elsif i > 0 && i < model.authors.size - 1
          al += ", #{ a.full_name }"
        else
          al += ", and #{ a.full_name }"
        end
      end
      al += ". " unless al == ""
    end
    al
  end

  def title
    if model.title && model.collection
      t = content_tag :em, "#{ model.title.titleize }"
    elsif model.title
      t = "\"#{ model.title.titleize }.\" "
      if model.respond_to?(:monograph)
        t += content_tag :em, "#{ model.monograph.title.titleize }"
      elsif model.respond_to?(:journal)
        t += content_tag :em, "#{ model.journal.name.titleize }"
      elsif model.respond_to?(:magazine)
        t += content_tag :em, "#{ model.magazine.name.titleize }"
      end
    end
    t += ". " unless t == ""
  end

  def volume_issue
    if model.respond_to?(:journal)
      vi = " #{ model.volume }." if model.volume
      vi += "#{ model.issue } " if model.issue
    end
  end

  def editor_list
    editors = if model.respond_to?(:monograph)
      model.monograph.editors
    else
      model.editors
    end

    if editors
      s = ""
      editors.each_with_index do |t, i|
        if i == 0
          s += "Ed. #{ t.full_name}"
        elsif i > 0
          s += " and #{t.full_name}"
        end
      end
      s += ". " unless s == ""
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
      s += ". " unless s == ""
    end
  end

  def publisher
    if model.respond_to?(:monograph)
      "#{ model.monograph.publisher }, " if model.monograph.publisher
    elsif model.respond_to?(:journal)
      "#{ model.journal.publisher }, " if model.journal.publisher
    else
      "#{ model.publisher }, " if model.publisher
    end
  end

  def year
    if model.respond_to?(:magazine)
      "#{ model.date.strftime("%e %b. %Y") }: " if model.date
    else
      "#{ model.date.strftime("%Y") }. " if model.date
    end
  end

  def pages
    "#{ model.pages }. " if model.pages
  end

  def medium
    if model.respond_to?(:monograph)
      "#{ model.monograph.medium.capitalize }."
    elsif model.respond_to?(:journal)
      "#{ model.journal.medium.capitalize }."
    else
      "#{ model.medium.capitalize }." if model.medium
    end
  end

  def to_mla(dup = false)
    s = ""
    s += author_list(dup) if authors
    s += title if title
    s += volume_issue if volume_issue
    s += editor_list if editor_list
    s += translator_list if translator_list
    s += publisher if publisher
    s += year if year
    s += pages if pages
    s += medium if medium
  end
  alias_method :to_s, :to_mla
end