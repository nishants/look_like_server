require "look_like"

module LookLike
  class Assertion
    def initialize(actual)
      @actual = actual
    end

    def to(expected)
      actual = @actual
      LookLike::Matchers.match(actual, expected) ? nil : LookLike::Matchers.error(actual, expected)
    end

  end
end
