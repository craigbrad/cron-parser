class ArgumentValidator
  attr_reader :argument
  private :argument

  def self.validate(argument)
    new(argument).validate
  end

  def initialize(argument)
    @argument = argument
  end

  def validate
    if !argument.match?(validators)
      raise ArgumentError, "Invalid character found in argument"
    else
      true
    end
  end

  private

  def validators
    increment_validator = /\*\/\d+/
    range_validator = /\d+\-\d+/
    list_validator = /(\d+)(,*\d+)*/
    asterix_validator = /\*/
    digit_validator = /\d+/

    @validators ||= Regexp.union([
      increment_validator,
      range_validator,
      list_validator,
      asterix_validator,
      digit_validator
    ])
  end
end
