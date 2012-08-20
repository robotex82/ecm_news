module MarkupHelper
  def mu(object, method)
    handler = object.send(method)
    erb_string = ::ERB.new(object[method.to_sym].to_s).result
    return handler.class.new(erb_string)
  end  
end
