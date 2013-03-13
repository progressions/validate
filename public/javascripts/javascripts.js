// Generated by CoffeeScript 1.6.1

$(function() {
  $("#code").focus();
  UPC.validate();
  $("#code").typing({
    delay: 200,
    start: UPC.validate,
    stop: UPC.validate
  });
  $("#code").focus();
  return $("#upc").submit(UPC.submit);
});

window.UPC = (function() {

  UPC.validate = function() {
    var code, upc;
    code = $("#code").val();
    return upc = new UPC(code);
  };

  UPC.response = function(response) {
    if (response["valid"]) {
      $(".errors").html("<p>Valid</p>");
      return $("#create").attr("disabled", false);
    } else {
      $(".errors").html("");
      $("#create").attr("disabled", true);
      return $(response["errors"]).each(function() {
        return $(".errors").append("<p>" + this + "</p>");
      });
    }
  };

  UPC.submit = function() {
    if ($("#create").attr("disabled") === "disabled") {
      alert("Cannot submit invalid UPC");
      return false;
    } else {
      return true;
    }
  };

  function UPC(code) {
    this.code = code;
    $.ajax("/validate", {
      "type": "GET",
      "data": {
        "code": this.code
      }
    }).done(UPC.response);
  }

  return UPC;

})();
