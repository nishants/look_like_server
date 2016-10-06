require_relative 'assertion'

module LookLike
  class Runner
    @@SCRIPT_PATH = "./config/script.rb"

    def initialize(script)
      @script = script
      @report = []
    end

    def expect actual
      LookLike::Assertion.new(actual, @report)
    end

    def look_like expected
      expected
    end

    def execute
      begin
        __proc = Proc.new {}
        eval(@script, __proc.binding)
      rescue Exception => se
        return [se.message]
      end
      @report
    end

  end
end
