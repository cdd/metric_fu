require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe FlayGrapher do 
  before :each do
    @grapher = MetricFu::Grapher.new
  end
  
  it "should respond to labels" do
    @grapher.should respond_to(:labels)
  end
  
  describe "#initialize" do
    it "should initialise labels" do
      @grapher.labels.should == {}
    end
  end
  
  describe "#get_metrics" do
    before(:each) do
      @metrics = YAML::load(File.open(File.join(File.dirname(__FILE__), "..", "resources", "yml", "20090630.yml")))
      @date = "1/2"
    end
    
    it "should update labels with the date" do
      @grapher.labels.should_receive(:update).with({ 0 => "1/2" })
      @grapher.get_metrics(@metrics, @date)
    end
  end
end
