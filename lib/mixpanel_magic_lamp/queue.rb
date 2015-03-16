require 'json'

module MixpanelMagicLamp

  class Queue < Array

    def push(request, opts = {})
      item = {
        request: request,
        format: opts.delete(:format),
        status: nil,
        response: nil,
        data: nil }

      self << item and return item
    end

    def process!
      self.each do |request|
        request[:status] = request[:request].response.code
        if request[:status] < 200 or request[:status] > 299
          request[:response] = JSON.parse(request[:request].response.body)
        else
          formatter = MixpanelMagicLamp::Formatter.new(request[:request])
          request[:data] = formatter.convert format: request[:format]
        end
      end

      self
    end

  end

end
