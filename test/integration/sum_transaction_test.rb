class SumTransactionTest < ActionDispatch::IntegrationTest

  test 'get types of transactions' do 
    get '/transactionservice/sum/2'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result["sum"],  13000.0
  end

end