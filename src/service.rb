require_relative 'runner'

module LookLike
  class Service
    def self.execute(script)
      LookLike::Runner.new(script).execute
    end

  end
end
