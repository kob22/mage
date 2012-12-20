require 'spec_helper'

describe "lab_classes/index" do
  before(:each) do
    assign(:lab_classes, [
      stub_model(LabClass,
        :subject => "Subject",
        :mark => "Mark",
        :note => "Note",
        :group_id => "Group"
      ),
      stub_model(LabClass,
        :subject => "Subject",
        :mark => "Mark",
        :note => "Note",
        :group_id => "Group"
      )
    ])
  end

  it "renders a list of lab_classes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "Mark".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
    assert_select "tr>td", :text => "Group".to_s, :count => 2
  end
end
