require 'spec_helper'

describe "prayers/edit.html.erb" do
  before(:each) do
    @prayer = assign(:prayer, stub_model(Prayer,
      :request => "MyString"
    ))
  end

  it "renders the edit prayer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prayer_path(@prayer), :method => "post" do
      assert_select "input#prayer_request", :name => "prayer[request]"
    end
  end
end
