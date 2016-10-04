require "look_like"

module LookLike
  class Assertion
    def initialize(actual, report)
      @actual = actual
      @report = report
    end

    def to(expected)
      actual = @actual
      result = LookLike::Matchers.match(actual, expected) ? nil : LookLike::Matchers.error(actual, expected)
      unless result.nil?
        @report.push(result)
      end
      result
    end
  end
end
