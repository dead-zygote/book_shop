#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require_self

$ ->
  $('.content input:submit').button()
  $('#radio').buttonset()

  
  split = (val) ->
    val.split( /,\s*/ )

  getLast = (term) ->
    split(term).pop()

  authorNames = $('#book_author_names').data('autocomplete-source')

  $('#book_author_names')
    .bind 'keydown', (event) ->
      if event.keyCode == $.ui.keyCode.TAB and $(this).data('autocomplete').menu.active
        event.preventDefault()
        
    .autocomplete
      minLength: 2,
      source: (request, response) ->
        response $.ui.autocomplete.filter(authorNames, getLast(request.term))

      focus: -> false
        
      select: (event, ui) ->
        terms = split(this.value)
        terms.pop()
        terms.push ui.item.value
        terms.push ''
        this.value = terms.join(', ')
        false
          
  categoryNames = $('#book_category_names').data('autocomplete-source')
    
  $('#book_category_names')
    .bind 'keydown', (event) ->
      if event.keyCode == $.ui.keyCode.TAB and $(this).data('autocomplete').menu.active
        event.preventDefault()
        
    .autocomplete
      source: (request, response) ->
        response $.ui.autocomplete.filter(categoryNames, getLast(request.term))

      focus: -> false
        
      select: (event, ui) ->
        terms = split(this.value)
        terms.pop()
        terms.push ui.item.value
        terms.push ''
        this.value = terms.join(', ')
        false
