module MetricFu
  
  class RoodiGrapher < Grapher
    
    attr_accessor :roodi_count
    
    def initialize
      super
      @roodi_count = []
    end
    
    def get_metrics(metrics, date)
      super
      @roodi_count.push(metrics[:roodi][:problems].size)
    end
    
  end
  
end
