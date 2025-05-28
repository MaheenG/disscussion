module ApplicationHelper
  def has_role?(role)
    case role
    when :admin
      current_user&.admin?
    else
      false
    end
  end

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

    Kramdown::Document.new(text, options).to_html.html_safe
  end

  def strip_markdown(text)
    return '' if text.nil?
    
    # Remove code blocks
    text = text.gsub(/```[\s\S]*?```/, '')
    
    # Remove inline code
    text = text.gsub(/`[^`]*`/, '')
    
    # Remove headers
    text = text.gsub(/^#+\s+/, '')
    
    # Remove emphasis
    text = text.gsub(/[*_]{1,2}([^*_]+)[*_]{1,2}/, '\1')
    
    # Remove links
    text = text.gsub(/\[([^\]]+)\]\([^\)]+\)/, '\1')
    
    # Remove images
    text = text.gsub(/!\[([^\]]*)\]\([^\)]+\)/, '')
    
    # Remove blockquotes
    text = text.gsub(/^\s*>\s+/, '')
    
    # Remove horizontal rules
    text = text.gsub(/^\s*[-*_]{3,}\s*$/, '')
    
    # Remove lists
    text = text.gsub(/^\s*[\*\-+]\s+/, '')
    text = text.gsub(/^\s*\d+\.\s+/, '')
    
    # Collapse multiple newlines
    text = text.gsub(/\n{2,}/, "\n")
    
    text.strip
  end

  def discussion_author(discussion)
    user_signed_in? && current_user.id == discussion.user_id
  end
end
