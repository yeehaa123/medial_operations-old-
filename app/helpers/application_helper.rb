module ApplicationHelper
  def kramdown(text)
    return raw Kramdown::Document.new(text).to_html
  end

  def roman_numeral(number)
    result, numerals = "", [
      [1000, "M"], [900, "CM"], [500, "D"], [400, "CD"],
      [100,  "C"], [90,  "XC"], [50,  "L"], [40,  "XL"],
      [10,   "X"], [9,   "IX"], [5,   "V"], [4,   "IV"],
      [1,    "I"]
    ]
    numerals.each do |order, roman|
      result << roman * (number / order)
      number %= order
    end
    result
  end

  def works_cited(references, title = "Works Cited")
    haml_tag :section, class: "bibliography" do
      haml_tag :h1, title
      haml_tag :ul do
        a = []
        references.each do |r|
          if a == r.authors && a != []
            haml_tag :li, link_to(raw(r.to_mla(true)), r)
          else
            haml_tag :li, link_to(raw(r.to_mla), r)
          end
          a = r.authors
        end
      end
    end
  end
end