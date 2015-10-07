class CreatingTransactionTest < ActionDispatch::IntegrationTest

  test 'create transaction' do 
    put '/transactionservice/transaction/1',
      { "amount" => 5000, "type" => "cars", "parent_id" => 2 }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    result = JSON.parse(response.body)
    assert_equal result['status'], "OK"
  end

end