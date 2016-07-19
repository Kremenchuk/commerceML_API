class ApiMagentoController < ApplicationController
  def autorization
    result = RestClient.post "http://demo.beta.qpard.com/index.php/rest/V1/integration/admin/token", {"username":"qpard", "password":"qwerty_123456"}.to_json,
                             :content_type => :json, :accept => :json

    time_start = Time.now
    1000.times do |i|
      begin

        req = RestClient.put "http://demo.beta.qpard.com/index.php/rest/V1/products/10090-White-XL#{i}",
                              {
                                  "product":{
                                      "sku": "10090-White-XL#{i}",
                                      "name": "10090-White-XL#{i}",
                                      "attribute_set_id": 4,
                                      "price": i,
                                      "status": 1,
                                      "visibility": 1,
                                      "type_id": "simple" }
                              }.to_json,
                              {
                                  :Authorization => "Bearer #{result.to_s.gsub('"','')}",
                                  :content_type => :json,
                                  :accept => :json
                              }
      rescue => error
        a=2
      end




      # begin
      # req = RestClient.post "http://demo.beta.qpard.com/index.php/rest/V1/products",
      #                       {
      #                           "product":{
      #                               "sku": "10090-White-XL#{i}",
      #                               "name": "10090-White-XL#{i}",
      #                               "attribute_set_id": 4,
      #                               "price": 119,
      #                               "status": 1,
      #                               "visibility": 1,
      #                               "type_id": "simple" }
      #                       }.to_json,
      #                       {
      #                        :Authorization => "Bearer #{result.to_s.gsub('"','')}",
      #                        :content_type => :json,
      #                        :accept => :json
      #                       }
      # rescue => error
      #   a=2
      # end
    end
    time_end = Time.now
    result_time = time_end - time_start
    a=2

  end
end