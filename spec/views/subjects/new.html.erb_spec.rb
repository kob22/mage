require 'spec_helper'

describe "subjects/new" do
  before(:each) do
    assign(:subject, stub_model(Subject,
      :subject => "MyString"
    ).as_new_record)
  end

  it "renders new subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subjects_path, :method => "post" do
      assert_select "input#subject_subject", :name => "subject[subject]"
    end
  end
end
