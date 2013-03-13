class UPC
  attr_accessor :errors

  def initialize(code)
    @code = code
    @errors = []
    @valid = false

    validate
  end

  def validate
    if @code.length == 5
      @valid = true
    elsif @code.length < 5
      @valid = false
      @errors << "UPC is less than 5 characters long."
    elsif @code.length > 5
      @valid = false
      @errors << "UPC is more than 5 characters long."
    end

    if @code !~ /^\d+$/
      @valid = false
      @errors << "UPC must be a number."
    end
  end

  def valid?
    @valid
  end

  def to_json
    {
      code: @code,
      valid: @valid,
      errors: @errors
    }.to_json
  end
end
