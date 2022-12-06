require "wongi-engine"

class RulesEngine
  def initialize
    raise 'Singleton class cannot be initialized'
  end

  def self.instance
    @instance ||= Wongi::Engine.create
  end
end
