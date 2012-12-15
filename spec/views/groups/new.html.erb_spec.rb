require 'spec_helper'

describe "groups/new" do
  before(:each) do
    assign(:group, stub_model(Group,
      :subject_id => 1,
      :group => "MyString",
      :day => "MyString",
      :week => "MyString"
    ).as_new_record)
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => groups_path, :method => "post" do
      assert_select "input#group_subject_id", :name => "group[subject_id]"
      assert_select "input#group_group", :name => "group[group]"
      assert_select "input#group_day", :name => "group[day]"
      assert_select "input#group_week", :name => "group[week]"
    end
  end
end
