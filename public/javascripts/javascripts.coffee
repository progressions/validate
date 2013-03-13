$ ->
  $("#code").focus()
  UPC.validate()

  $("#code").typing
    delay: 200
    start: UPC.validate
    stop: UPC.validate

  $("#code").focus()

  $("#upc").submit(UPC.submit)
    

class window.UPC
  @validate: ->
    code = $("#code").val()
    upc = new UPC(code)
  
  @response: (response) ->
    if response["valid"]
      $(".errors").html("<p>Valid</p>")
      $("#create").attr("disabled", false)
    else
      $(".errors").html("")
      $("#create").attr("disabled", true)

      $(response["errors"]).each ->
        $(".errors").append("<p>#{this}</p>")

  @submit: ->
    if $("#create").attr("disabled") == "disabled"
      alert "Cannot submit invalid UPC"
      false
    else
      true

  constructor: (@code) ->
    $.ajax("/validate",
      "type": "GET"
      "data":
        "code": @code
    ).done(UPC.response)
      

