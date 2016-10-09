require 'pry'
class Api::V1::CoursesController < Api::V1::ReqTreeController

  after_filter do
    # TODO: Figure out this shit

    new_json_response = JSON.parse(response.body)
    meta = {
             items: [
               {id: 1, name: 'Test'},
               {id: 2, name: 'Test 2'},
               {id: 3, name: 'Test'},
               {id: 4, name: 'Test'},
               {id: 5, name: 'Test 2'},
               {id: 6, name: 'Test 2'},
               {id: 7, name: 'Test 2'},
             ],
             meta: {
               total_pages: 10
             }
           }
    # new_json_response['meta'] = meta
    new_json_response['meta'] = {'total_pages' => 10}
    new_json_response_string = new_json_response.to_json
    response.body = new_json_response_string
  end

end
