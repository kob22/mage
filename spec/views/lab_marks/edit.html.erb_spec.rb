require 'spec_helper'

describe "lab_marks/edit" do
  before(:each) do
    @lab_mark = assign(:lab_mark, stub_model(LabMark,
      :mark => "MyString",
      :description => "MyString",
      :presence_id => 1
    ))
  end

  it "renders the edit lab_mark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lab_marks_path(@lab_mark), :method => "post" do
      assert_select "input#lab_mark_mark", :name => "lab_mark[mark]"
      assert_select "input#lab_mark_description", :name => "lab_mark[description]"
      assert_select "input#lab_mark_presence_id", :name => "lab_mark[presence_id]"
    end
  end
end
