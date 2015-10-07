class GettingTypesTest < ActionDispatch::IntegrationTest

  test 'get types of transactions' do 
    get '/transactionservice/types/cars'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result, [1,2]
  end

end