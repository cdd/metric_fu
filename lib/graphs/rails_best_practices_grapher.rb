module MetricFu
  
  class RailsBestPracticesGrapher < Grapher
    
    attr_accessor :rails_best_practices_count
    
    def initialize
      super
      @rails_best_practices_count = []
    end
    
    def get_metrics(metrics, date)
      super
      if metrics[:rails_best_practices] && metrics[:rails_best_practices][:problems]
        size = metrics[:rails_best_practices][:problems].size
      else
        size = 0
      end
      @rails_best_practices_count.push(size)
    end
    
  end
  
end
