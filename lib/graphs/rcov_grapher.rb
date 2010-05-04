module MetricFu
  
  class RcovGrapher < Grapher
    
    attr_accessor :rcov_percent
    
    def initialize
      super
      @rcov_percent = []
    end
    
    def get_metrics(metrics, date)
      super
      @rcov_percent.push(metrics[:rcov][:global_percent_run])
    end
    
  end
  
end
