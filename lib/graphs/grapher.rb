module MetricFu
  class Grapher
    attr_accessor :labels
    
    def initialize
      self.class.require_graphing_gem
      @labels = {}
    end
    
    def self.require_graphing_gem
      # to be overridden by charting engines
    end
    
    def get_metrics(metrics, date)
      @labels.update( { @labels.size => date })
    end  
  end
end