$ ->
  $(document).on 'turbolinks:load', ->
    $('.countable').on 'click keyup blur change paste input onload', ->
      countLength($(this))
    $('.countMeaning').on 'click keyup blur change paste input onload', ->
      countMeaning($(this))

  countLength = ($field) ->
    len = $field.val().length
    $("##{$field.attr('id')}_len").html(len)
    countMax = Number($("#" + ($field.attr('id')) + "_max").html())
    countDown = countMax - len
    if countDown < 0
      $("##{$field.attr('id')}_len").css
        color: 'red'
    else
      $("##{$field.attr('id')}_len").css
        color: '#555'

  countMeaning = ($field) ->
    len = $field.val().length
    $("#towa_meanings_len").html(len)
    countMax = Number($("#" + ($field.attr('id')) + "_max").html())
    countDown = countMax - len
    if countDown < 0
      $("#towa_meanings_len").css
        color: 'red'
    else
      $("##{$field.attr('id')}_len").css
        color: '#555'
