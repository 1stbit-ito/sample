require 'rails_helper'

RSpec.describe "user2s/edit", :type => :view do
  before(:each) do
    @user2 = assign(:user2, User2.create!(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit user2 form" do
    render

    assert_select "form[action=?][method=?]", user2_path(@user2), "post" do

      assert_select "input#user2_name[name=?]", "user2[name]"

      assert_select "input#user2_email[name=?]", "user2[email]"
    end
  end
end
