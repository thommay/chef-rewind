chef_gem 'chef-rewind' do
  source "/opt/pkg/chef-rewind-#{node['rewind']['ver']}.gem"
end

require 'chef/rewind'
include_recipe 'rewind::base'

rewind "file[/tmp/first_file]" do
  content "a rewound file"
end

unwind 'file[/tmp/third_file]'
