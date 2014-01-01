module TocFilter
  def toc(input)
    output = "<ul class=\"unstyled\">"
    input.scan(/<(h2)(?:>|\s+(.*?)>)([^<]*)<\/\1\s*>/mi).each do |entry|
      id = (entry[1][/^id=(['"])(.*)\1$/, 2] rescue nil)
      title = entry[2].gsub(/<(\w*).*?>(.*?)<\/\1\s*>/m, '\2').strip
      if id
        output << %{<li><a class="navigation-text" href="##{id}">#{title}</a></li>}
      else
        output << %{<li>#{title}</li>}
      end
    end
    output << '</ol>'
    output
  end
end
Liquid::Template.register_filter(TocFilter)