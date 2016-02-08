module Gemgem::Cell
  class Layout < Trailblazer::Cell
    include ActionView::Helpers::CsrfHelper

    self.view_paths = ["app/lib"]

    def show(content:)
      @content = content
      super()
    end

    def tyrant
      options[:tyrant]
    end

    def flash
      options[:flash]
    end

    attr_reader :content
  end
end
