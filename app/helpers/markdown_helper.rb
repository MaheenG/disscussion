module MarkdownHelper
  def markdown(text)
    return '' if text.nil?

    options = {
      hard_wrap: true,
      input: 'GFM',
      syntax_highlighter: 'rouge',
      syntax_highlighter_opts: {
        css_class: 'highlight',
        line_numbers: true
      }
    }

    require 'kramdown'
    require 'kramdown-parser-gfm'
    require 'rouge'
    
    Kramdown::Document.new(text, options).to_html.html_safe
  end
end 