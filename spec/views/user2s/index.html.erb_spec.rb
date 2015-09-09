require 'rails_helper'

RSpec.describe "user2s/index", :type => :view do
  before(:each) do
    assign(:user2s, [
      User2.create!(
        :name => "Name",
        :email => "Email"
      ),
      User2.create!(
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of user2s" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
