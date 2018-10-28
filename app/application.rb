class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

    if req.path.match(/items/)
        sel_item = req.path.split("/items/").last
        @@items.find do |i|
          if i.name == sel_item
            resp.write i.price
          else
            resp.status = 400
            resp.write "Item not found"
        end
      end
    else
        resp.status = 404
        resp.write "Route not found"
    end

  resp.finish
  end
end
