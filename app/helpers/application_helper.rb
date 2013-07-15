module ApplicationHelper

  def title
    t = ''
    if @title
      t = "#{@title} | "
    end
    t += I18n.translate('title')
    t
  end
end
