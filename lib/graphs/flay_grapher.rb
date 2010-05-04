module MetricFu
  
  class FlayGrapher < Grapher
    
    attr_accessor :flay_score
    
    def initialize
      super
      @flay_score = []
    end
    
    def get_metrics(metrics, date)
      super
      @flay_score.push(metrics[:flay][:total_score].to_i)
    end
    
  end
  
end
