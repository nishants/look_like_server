module LookLike
  class Service
    @@SCRIPT_PATH = "./config/script.rb"

    def mausas
      []
    end
    def self.execute(script)
      begin
        __proc = Proc.new {}
        return eval(File.read(@@SCRIPT_PATH), __proc.binding)
      rescue Exception => se
        return se.message
      end

    end

  end
end
