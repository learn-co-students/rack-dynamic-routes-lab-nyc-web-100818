class Application
    
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

    if req.path.match(/items/)
      each_item = req.path.split("/items/").last
      @@items.find do |item|
        if item.name == each_item
        resp.write "#{item.price}\n"
    else
        resp.write "Item not found"
        resp.status = 400
        end
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
       resp.finish

    end
end
# Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
# If a user requests /items/<Item Name> it should return the price of that item
# IF a user requests an item that you don't have, then return a 400 and an error message


