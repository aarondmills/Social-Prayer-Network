require 'spec_helper'

describe "prayers/index.html.erb" do
  before(:each) do
    assign(:prayers, [
      stub_model(Prayer,
        :request => "Request"
      ),
      stub_model(Prayer,
        :request => "Request"
      )
    ])
  end

  it "renders a list of prayers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Request".to_s, :count => 2
  end
end
