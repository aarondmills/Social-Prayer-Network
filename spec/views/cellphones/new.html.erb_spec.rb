require 'spec_helper'

describe "cellphones/new.html.erb" do
  before(:each) do
    assign(:cellphone, stub_model(Cellphone,
      :number => "MyString",
      :active => false,
      :token => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new cellphone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cellphones_path, :method => "post" do
      assert_select "input#cellphone_number", :name => "cellphone[number]"
      assert_select "input#cellphone_active", :name => "cellphone[active]"
      assert_select "input#cellphone_token", :name => "cellphone[token]"
      assert_select "input#cellphone_user_id", :name => "cellphone[user_id]"
    end
  end
end
