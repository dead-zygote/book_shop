jQuery ->

  $('form.new_cart_item').live 'submit', ->
    jQuery.ajax
      url: $(this).attr('action') + '.json'
      type: 'POST'
      data: $(this).serialize()
      success: (data) =>
        $('span#cart-price').html("#{data.cart_price}")
        decline_action_template = $('#decline_action_template').html()
        html = Mustache.to_html decline_action_template, data
        $(this).closest('.actions').html(html)
      statusCode:
        422: -> alert 'Недоступное количество.'
    false


  $('form.decline').live 'submit', ->
    jQuery.post $(this).attr('action') + '.json', jQuery(this).serialize(), (data) =>
      $('span#cart-price').html("#{data.cart_price}")
      buy_action_template = $('#buy_action_template').html()
      html = Mustache.to_html buy_action_template, data
      $(this).closest('.actions').html(html)
    false
