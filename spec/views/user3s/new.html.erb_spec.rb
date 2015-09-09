require 'rails_helper'

RSpec.describe "user3s/new", :type => :view do
  before(:each) do
    assign(:user3, User3.new(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new user3 form" do
    render

    assert_select "form[action=?][method=?]", user3s_path, "post" do

      assert_select "input#user3_name[name=?]", "user3[name]"

      assert_select "input#user3_email[name=?]", "user3[email]"
    end
  end
end
