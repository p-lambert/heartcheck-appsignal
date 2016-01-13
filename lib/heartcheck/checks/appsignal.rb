module Heartcheck
  module Checks
    class Appsignal < Base
      def validate
        ::Appsignal::Transmitter
          .new('auth')
          .transmit({})
          .tap(&fail_unless_success)
      rescue => e
        append_error('could not authenticate with appsignal server.')
        append_error(e.message)
      end

      private

      def fail_unless_success
        lambda do |resp|
          fail("response from server: #{resp}") unless resp.to_s == '200'
        end
      end

      def custom_error(*messages)
        @errors.push(*messages)
      end
    end
  end
end
