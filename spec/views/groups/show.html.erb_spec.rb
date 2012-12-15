require 'spec_helper'

describe "groups/show" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :subject_id => 1,
      :group => "Group",
      :day => "Day",
      :week => "Week"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Group/)
    rendered.should match(/Day/)
    rendered.should match(/Week/)
  end
end
