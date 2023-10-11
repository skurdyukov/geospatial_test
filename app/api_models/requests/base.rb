module Requests
  class Base < Hashie::Trash
    include Hashie::Extensions::Dash::Coercion
    include Hashie::Extensions::Dash::IndifferentAccess
    include Hashie::Extensions::IgnoreUndeclared
  end
end
