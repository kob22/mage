require 'spec_helper'

describe "lab_classes/show" do
  before(:each) do
    @lab_class = assign(:lab_class, stub_model(LabClass,
      :subject => "Subject",
      :mark => "Mark",
      :note => "Note",
      :group_id => "Group"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    rendered.should match(/Mark/)
    rendered.should match(/Note/)
    rendered.should match(/Group/)
  end
end
