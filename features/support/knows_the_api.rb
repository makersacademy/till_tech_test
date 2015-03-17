module KnowsTheApi

 def make_api_request_with_payment_of_value value
   put '/api/order/1', { payment: value }  
   expect_status 200
 end

 def receipt_json 
   get '/api/order/1'
 end

end

