module MetricFu

  def self.graph
    @graph ||= Graph.new
  end

  class Graph
    
    attr_accessor :clazz
    
    def initialize
      self.clazz = []
    end
    
    def add(graph_type, graph_engine)
      grapher_name = graph_type.to_s.capitalize + graph_engine.to_s.capitalize + "Grapher"
      self.clazz.push MetricFu.const_get(grapher_name).new
    end
    
    
    def generate
      return if self.clazz.empty?
      puts "Generating graphs"
      graphed_reports.each { |report| process_report(report) }
      self.clazz.each { |grapher| grapher.graph! }
    end
    
    private
    def process_report(report)
      puts "Processing #{report}"
      date = date_for(report)
      metrics = YAML::load(File.open(report))
      self.clazz.each { |grapher| grapher.get_metrics(metrics, date) }
    end
    
    def date_for(report)
      date = File.basename(report, ".yml") # yyyy/mm/dd
      "#{date[4..5].to_i}/#{date[6..7].to_i}"
    end
    
    def graphed_reports
      reports = Dir[File.join(MetricFu.data_directory, '*.yml')].sort
      from = reports.size-MetricFu.graph_period < 0 ? 0 : reports.size-MetricFu.graph_period
      reports[from..-1]
    end
  end
end