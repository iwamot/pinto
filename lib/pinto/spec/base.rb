require 'pinto_beans/spec/base'

module Pinto
  module Spec
    class Base < PintoBeans::Spec::Base
      def service_unavailable_begin
        p 'service_unavailable_begin'
      end

      def service_unavailable_end
        p 'service_unavailable_end'
      end

      def service_unavailable_header(group)
        error_header(group)
      end

      def service_unavailable_body(group)
        group.it 'should return "503 Service Unavailable" as entity body' do
          @response.body.should == '503 Service Unavailable'
        end
      end

      def method_not_allowed_header(group)
        error_header(group)
      end

      def method_not_allowed_body(group)
        group.it 'should return "405 Method Not Allowed" as entity body' do
          @response.body.should == '405 Method Not Allowed'
        end
      end

      def precondition_failed_header(group)
        error_header(group)
      end

      def precondition_failed_body(group)
        group.it 'should return "412 Method Not Allowed" as entity body' do
          @response.body.should == '412 Method Not Allowed'
        end
      end

      def error_header(group)
        group.it 'should return "en" as Content-Language' do
          @response.header['Content-Language'].should == 'en'
        end

        group.it 'should return "application/xhtml+xml; charset=UTF-8" as Content-Type' do
          @response.header['Content-Type'].should ==
                'application/xhtml+xml; charset=UTF-8'
        end
      end
    end
  end
end
