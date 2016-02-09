require "trailblazer/operation/dispatch"
# require "trailblazer/operation/representer"
# require "trailblazer/operation/responder"

Trailblazer::Operation.class_eval do
  include Trailblazer::Operation::Dispatch
end
