require 'rails_helper'

RSpec.describe "user3s/edit", :type => :view do
  before(:each) do
    @user3 = assign(:user3, User3.create!(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit user3 form" do
    render

    assert_select "form[action=?][method=?]", user3_path(@user3), "post" do

      assert_select "input#user3_name[name=?]", "user3[name]"

      assert_select "input#user3_email[name=?]", "user3[email]"
    end
  end
end
