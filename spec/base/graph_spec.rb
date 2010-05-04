require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe MetricFu do
  
  describe "responding to #graph" do
    it "should return an instance of Graph" do
      MetricFu.graph.should be_a(Graph)
    end
  end
end

describe MetricFu::Graph do
  
  before(:each) do
    @graph = MetricFu::Graph.new
  end
  
  describe "responding to #add with gchart enabled" do
    it 'should instantiate a grapher and push it to clazz' do
      @graph.clazz.should_receive(:push).with(an_instance_of(RcovGchartGrapher))
      @graph.add("rcov", 'gchart')
    end
  end
  
  describe "#date_for(report)" do
    it "should return the right month/day date for the given report file name" do
      @graph.send(:date_for, "tmp/metric_fu/_data/20100502.yml").should == "5/2"
      @graph.send(:date_for, "tmp/metric_fu/_data/20081101.yml").should == "11/1"
      @graph.send(:date_for, "tmp/metric_fu/_data/20081231.yml").should == "12/31"
    end
  end
end
