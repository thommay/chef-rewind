require 'chef/resource'
require 'chef/provider'

class Chef
  class Resource
    class RewindTest < Chef::Resource
      def initialize(name, run_context = nil)
        super
        @resource_name = :rewind_test
        @action = :create
        @allowed_actions.push :create
        @provider = Chef::Provider::RewindTest
      end

      def name(arg = nil)
        set_or_return(
          :name,
          arg,
          :kind_of => String,
          :regex => /[\w+.-]+/,
          :name_attribute => true,
          :required => true
        )
      end

      def content(arg = nil)
        set_or_return(
          :content,
          arg,
          :kind_of => String
        )
      end
    end
  end

  class Provider
    class RewindTest < Chef::Provider::LWRPBase
      use_inline_resources
      def load_current_resource
        @current_resource ||= Chef::Resource::RewindTest.new(@new_resource.name)
        @current_resource
      end

      def action_create
        name = new_resource.name
        cnt = new_resource.content

        dir = directory "/tmp/#{name}" do
          action :nothing
          recursive true
        end
        dir.run_action(:create)
        first_file = file "/tmp/#{name}/first" do
          content cnt
          action :nothing
        end
        first_file.run_action(:create)
        second_file = file "/tmp/#{name}/second" do
          content cnt
          action :nothing
        end
        second_file.run_action(:create)
      end
    end
  end
end
