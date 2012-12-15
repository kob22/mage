require 'spec_helper'

describe "groups/index" do
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :subject_id => 1,
        :group => "Group",
        :day => "Day",
        :week => "Week"
      ),
      stub_model(Group,
        :subject_id => 1,
        :group => "Group",
        :day => "Day",
        :week => "Week"
      )
    ])
  end

  it "renders a list of groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Group".to_s, :count => 2
    assert_select "tr>td", :text => "Day".to_s, :count => 2
    assert_select "tr>td", :text => "Week".to_s, :count => 2
  end
end
