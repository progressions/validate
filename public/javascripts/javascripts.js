// Generated by CoffeeScript 1.6.1

$(function() {
  $("#code").focus();
  $("#code").typing({
    delay: 200,
    start: Input.validate,
    stop: Input.validate
  });
  $("#code").focus();
  return $("#upc").submit(function() {
    var upc, validator;
    upc = $("#code").val();
    validator = new Validate(upc);
    if (validator.valid()) {
      return true;
    } else {
      alert("Can't submit an invalid UPC");
      return false;
    }
  });
});

window.Input = (function() {

  function Input() {}

  Input.validate = function(event, elem) {
    var upc, validator;
    upc = $("#code").val();
    validator = new Validate(upc);
    $(".errors").html("");
    if (validator.valid()) {
      console.log("valid");
      return $("#create").attr("disabled", false);
    } else {
      $("#create").attr("disabled", true);
      return $(validator.errors).each(function() {
        return $(".errors").append("<p>" + this + "</p>");
      });
    }
  };

  return Input;

})();

window.Validate = (function() {

  function Validate(string) {
    this.string = string;
    this.errors = [];
    this.validate();
  }

  Validate.prototype.valid = function() {
    return this.errors.length === 0;
  };

  Validate.prototype.validate = function() {
    if (isNaN(this.string)) {
      this.errors.push("UPC must be numbers only");
    }
    if (this.string.length < 5) {
      this.errors.push("UPC is less than 5 characters.");
    }
    if (this.string.length > 5) {
      return this.errors.push("UPC is longer than 5 characters.");
    }
  };

  return Validate;

})();