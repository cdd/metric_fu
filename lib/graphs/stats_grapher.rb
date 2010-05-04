
module MetricFu
  
  class StatsGrapher < Grapher
    
    attr_accessor :loc_counts, :lot_counts
    
    def initialize
      super
      self.loc_counts = []
      self.lot_counts = []
    end
    
    def get_metrics(metrics, date)
      super
      self.loc_counts.push(metrics[:stats][:codeLOC].to_i)
      self.lot_counts.push(metrics[:stats][:testLOC].to_i)
    end
    
  end
  
end
