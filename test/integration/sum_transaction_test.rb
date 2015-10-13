class SumTransactionTest < ActionDispatch::IntegrationTest

  test 'sumarization of transactions amount by parent id' do 
    get '/transactionservice/sum/2'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result["sum"],  13000.0
  end

  test 'no transaction means no summary' do 
    get '/transactionservice/sum/4'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result, { "Error" => "There is no transactions with parent_id: 4 neither transaction with id: 4" }
  end

end