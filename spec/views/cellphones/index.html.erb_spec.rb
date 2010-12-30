require 'spec_helper'

describe "cellphones/index.html.erb" do
  before(:each) do
    assign(:cellphones, [
      stub_model(Cellphone,
        :number => "Number",
        :active => false,
        :token => "Token",
        :user_id => 1
      ),
      stub_model(Cellphone,
        :number => "Number",
        :active => false,
        :token => "Token",
        :user_id => 1
      )
    ])
  end

  it "renders a list of cellphones" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Token".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
