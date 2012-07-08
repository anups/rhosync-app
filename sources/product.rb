require 'json'
require 'rest_client'

class Product < SourceAdapter
  def initialize(source) 
    @base = 'http://rhostore.heroku.com/products'
    super(source)
  end
 
  def login
    # TODO: Login to your data source here if necessary
    #MyWebService.login(current_user.login)
  end
 
  def query(params=nil)
      rest_result = RestClient.get("#{@base}.json").body
      @result={}
      counter = 0
      if rest_result.code != 200
        raise SourceAdapterException.new("Error connecting!")
      end
      parsed = JSON.parse(rest_result)
      parsed.each do |item|
        @result[counter] = item["product"]
        counter += 1
      end if parsed
      # TODO: Query your backend data source and assign the records 
      # to a nested hash structure called @result. For example:
#       @result = { 
#         "1"=>{"name"=>"Acme", "industry"=>"Electronics"},
#         "2"=>{"name"=>"Best", "industry"=>"Software"}
#       }
      #Store.put_data(@result)
    #raise SourceAdapterException.new("Please provide some code to read records from the backend data source")
  end
 
  def sync
    # Manipulate @result before it is saved, or save it 
    # yourself using the Rhoconnect::Store interface.
    # By default, super is called below which simply saves @result
    super
  end
 
  def create(create_hash)
    # TODO: Create a new record in your backend data source
    #raise "Please provide some code to create a single record in the backend data source using the create_hash"
  end
 
  def update(update_hash)
    # TODO: Update an existing record in your backend data source
    #raise "Please provide some code to update a single record in the backend data source using the update_hash"
  end
 
  def delete(delete_hash)
    # TODO: write some code here if applicable
    # be sure to have a hash key and value for "object"
    # for now, we'll say that its OK to not have a delete operation
    # raise "Please provide some code to delete a single object in the backend application using the object_id"
  end
 
  def logoff
    # TODO: Logout from the data source if necessary
    #MyWebService.logoff(current_user.login)
  end
end