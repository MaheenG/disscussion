class MarkdownRenderer
  def initialize
    @renderer = Redcarpet::Render::HTML.new(
      filter_html: true,
      no_links: false,
      no_images: false,
      with_toc_data: true,
      hard_wrap: true,
      link_attributes: { target: '_blank', rel: 'noopener' }
    )
    
    @markdown = Redcarpet::Markdown.new(
      @renderer,
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true,
      underline: true,
      highlight: true,
      quote: true
    )
  end

  def render(text)
    html = @markdown.render(text)
    syntax_highlight(html)
  end

  private

  def syntax_highlight(html)
    doc = Nokogiri::HTML::DocumentFragment.parse(html)
    
    doc.css('pre code').each do |code|
      next unless code['class']
      
      lang = code['class'].gsub('language-', '')
      
      begin
        highlighted = Rouge.highlight(code.inner_text, lang, 'html')
        code.inner_html = highlighted
        code.parent['class'] = 'highlight'
      rescue
        # If language is not supported, leave as-is
      end
    end
    
    doc.to_html
  end
end