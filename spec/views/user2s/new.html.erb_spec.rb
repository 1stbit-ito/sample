require 'rails_helper'

RSpec.describe "user2s/new", :type => :view do
  before(:each) do
    assign(:user2, User2.new(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new user2 form" do
    render

    assert_select "form[action=?][method=?]", user2s_path, "post" do

      assert_select "input#user2_name[name=?]", "user2[name]"

      assert_select "input#user2_email[name=?]", "user2[email]"
    end
  end
end
