require 'spec_helper'

describe "lab_marks/index" do
  before(:each) do
    assign(:lab_marks, [
      stub_model(LabMark,
        :mark => "Mark",
        :description => "Description",
        :presence_id => 1
      ),
      stub_model(LabMark,
        :mark => "Mark",
        :description => "Description",
        :presence_id => 1
      )
    ])
  end

  it "renders a list of lab_marks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mark".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
