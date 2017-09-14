require 'travis/yml'

class Travis::Api::App
  class Middleware
    class Yml
      attr_reader :app

      def initialize(app)
        @app = app
      end

      def call(env)

        begin
          response = @app.call(env)
          request_ended_at = Time.now
          request_time = request_ended_at - request_started_at

          yml(env, response, request_time)

          response
        rescue StandardError => e
          request_ended_at = Time.now
          request_time = request_ended_at - request_started_at

          yml(env, [500, {}, nil], request_time, e)

          raise e
        end
      end

      private def yml(env, response, request_time, e = nil)
        status, headers, body = response


      end

    end
  end
end
