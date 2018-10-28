class Application

  def call(env)
   resp = Rack::Response.new
   req = Rack::Request.new(env)

   if req.path.match(/items/)

     item_name = req.path.split("/items/").last
     item = @@items.find{|i| i.name == item_name} # trying to find item by its name

       if item # if item exists
         resp.write item.price # return the price
         resp.status = 200

       else
         resp.write "Item not found" # otherwise write that its not found if user still in /items/ route
         resp.status = 400
       end

  else
    resp.write "Route not found" # this pops up if a use is NOT on the /items/ route
     resp.status = 404
   end

   resp.finish
 end

end # end of Application class
