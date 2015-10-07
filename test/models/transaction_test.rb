require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "cannot commit transaction without an amount" do
    transaction = Transaction.new 
    assert_not transaction.save
   end

   test "canno commit transaction without the type" do 
     transaction = Transaction.new
     assert_not transaction.save
   end

   test "transaction can only be commited with an amount and type" do 
      transaction = Transaction.new
      transaction.amount = 3000.0
      transaction.type = "salary"
      assert transaction.save
   end
end
