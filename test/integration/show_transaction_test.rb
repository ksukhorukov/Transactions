class ShowTransactionTest < ActionDispatch::IntegrationTest

  test 'show particular transaction' do 
    get '/transactionservice/transaction/1'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result,  { "amount" => 6000.0, "type" => "cars"}
  end

  test 'handling unexisting transactions gracefully' do 
    get '/transactionservice/transaction/12345'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result,  { "Error" =>  "There is no such transaction"}
  end

end