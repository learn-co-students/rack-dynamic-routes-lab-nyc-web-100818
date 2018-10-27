class Application
 
  @@items = [Item.new(:name, :price)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      #turn: /items/<item_name>/ into <item_name>
      item_name = req.path.split("/items/").last

      #return item price if found in @@item([])
      if item = @@items.find {|i| i.name == item_name}
        resp.write item.price
      else
        resp.write "Item not found" #else Item error
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end 
end