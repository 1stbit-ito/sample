require 'rails_helper'

RSpec.describe Borrowing, :type => :model do
#  it "isn't valid without user_id" do
#    borrowing = Borrowing.new
#    borrowing.user_id = nil
#    expect(borrowing).not_to be_valid
#  end

  it "isn't valid without book_id" do
    borrowing = Borrowing.new
    borrowing.book_id = nil
    expect(borrowing).not_to be_valid
  end

  it "is invalid without a book_id" do
    borrowing = Borrowing.new(book_id: nil)
    borrowing.valid?
    expect(borrowing.errors[:book_id]).to include("can't be blank")

  end

  it "will be deleted when user deleted"

end
