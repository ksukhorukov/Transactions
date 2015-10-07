class SumTransactionTest < ActionDispatch::IntegrationTest

  test 'sumarization of transactions amount by parent id' do 
    get '/transactionservice/sum/2'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result["sum"],  14000.0
  end

  test 'no transaction means no summary' do 
    get '/transactionservice/sum/4'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result["sum"],  0.0
  end

end