class ShowTransactionTest < ActionDispatch::IntegrationTest

  test 'get types of transactions' do 
    get '/transactionservice/transaction/1'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result,  { "amount" => 6000.0, "type" => "cars" }
  end

end