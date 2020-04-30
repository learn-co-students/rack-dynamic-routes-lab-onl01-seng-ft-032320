class Application
    #@@items = [Item.new("Figs", 2.25),Item.new("Banana", 0.52)]
    @@items = []
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
    
        if req.path.match(/items/)
            #binding.pry
            item = req.path.split("/items/").last
            item_obj = @@items.find{|i| i.name == item}
            if item_obj
                resp.write "#{item_obj.price}"
                resp.status = 200
            else 
                resp.write "Item not found"
                resp.status = 400
            end 
            
        else 
            resp.write "Route not found"
            resp.status = 404
        end 
        resp.finish
    end

end