module ApplicationHelper
  def markdown(text)
    return '' if text.blank?
    MarkdownRenderer.new.render(text).html_safe
  end

  def time_ago_in_words_or_date(time)
    if time > 1.week.ago
      time_ago_in_words(time) + ' ago'
    else
      time.strftime('%B %d, %Y')
    end
  end

  def user_avatar(user, size: 'sm')
    classes = case size
              when 'xs' then 'width: 20px; height: 20px;'
              when 'sm' then 'width: 32px; height: 32px;'
              when 'md' then 'width: 48px; height: 48px;'
              when 'lg' then 'width: 64px; height: 64px;'
              end

    if user.avatar.attached?
      image_tag user.avatar, class: 'rounded-circle', style: classes
    else
      content_tag :div, user.display_name.first.upcase,
                  class: 'rounded-circle bg-primary text-white d-flex align-items-center justify-content-center fw-bold',
                  style: classes
    end
  end
end
