module Ecm
  module News
    EXCEPTIONS = %w[ BaseControllerNotDefinedError ]
    EXCEPTIONS.each { |exception| const_set(exception, Class.new(StandardError)) }
  end
end
