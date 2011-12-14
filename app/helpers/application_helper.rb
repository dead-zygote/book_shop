# coding: utf-8
module ApplicationHelper
  def errors_of(object)
    if object.errors.any?
      @object = object
      render('common/errors')
    end
  end

  def links_to_authors_books(authors)
    authors.map do |author|
      link_to author.name, author_books_path(author)
    end.join(', ').html_safe
  end
  
  def nav_link(text, path, controller)
    if controller_name == controller
      link_to text, path, class: 'active'
    else
      link_to text, path
    end
  end
  
  def state_to_russian(state)
    case state
    when 'unpaid'
      'не оплачен'
    when 'paid'
      'оплачен'
    when 'ready'
      'готов к отправке'
    when 'sent'
      'отправлен'
    end
  end
  
  def sorting_link(text, field)
    direction = 'asc'
    if params[:field] == field
      direction = (params[:direction] == 'asc') ? 'desc' : 'asc'
      text += (direction == 'asc') ? ' ▴' : ' ▾'
    end
    link_to text, field: field, direction: direction
  end
end
