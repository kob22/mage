require 'spec_helper'

describe "lab_classes/edit" do
  before(:each) do
    @lab_class = assign(:lab_class, stub_model(LabClass,
      :subject => "MyString",
      :mark => "MyString",
      :note => "MyString",
      :group_id => "MyString"
    ))
  end

  it "renders the edit lab_class form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lab_classes_path(@lab_class), :method => "post" do
      assert_select "input#lab_class_subject", :name => "lab_class[subject]"
      assert_select "input#lab_class_mark", :name => "lab_class[mark]"
      assert_select "input#lab_class_note", :name => "lab_class[note]"
      assert_select "input#lab_class_group_id", :name => "lab_class[group_id]"
    end
  end
end
