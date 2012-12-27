require 'spec_helper'

describe "lab_marks/show" do
  before(:each) do
    @lab_mark = assign(:lab_mark, stub_model(LabMark,
      :mark => "Mark",
      :description => "Description",
      :presence_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mark/)
    rendered.should match(/Description/)
    rendered.should match(/1/)
  end
end
