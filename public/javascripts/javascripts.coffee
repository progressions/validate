$ ->
  $("#code").focus()

  $("#code").typing
    delay: 200
    start: Input.validate
    stop: Input.validate

  $("#code").focus()

  $("#upc").submit () ->
    upc = $("#code").val()
    validator = new Validate(upc)

    if validator.valid()
      return true
    else
      alert "Can't submit an invalid UPC"
      return false

class window.Input
  @validate: (event, elem) ->
    upc = $("#code").val()

    validator = new Validate(upc)

    $(".errors").html("")

    if validator.valid()
      console.log "valid"
      $("#create").attr("disabled", false)
    else
      $("#create").attr("disabled", true)
      $(validator.errors).each ->
        $(".errors").append("<p>#{this}</p>")
      
class window.Validate
  constructor: (@string) ->
    @errors = []
    @validate()
  
  valid: ->
    @errors.length == 0

  validate: ->
    if isNaN(@string)
      @errors.push "UPC must be numbers only"
    if @string.length < 5
      @errors.push "UPC is less than 5 characters."
    if @string.length > 5
      @errors.push "UPC is longer than 5 characters."
