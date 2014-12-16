chef_gem 'chef-rewind' do
  source "/opt/pkg/chef-rewind-#{node['rewind']['ver']}.gem"
end

require 'chef/rewind'
include_recipe 'rewind::base'

rewind_test "my_lwrp" do
  content 'some content goes here'
end

file '/tmp/third_file' do
  owner 'vagrant'
end

rewind "file[/tmp/first_file]" do
  content "a rewound file"
end

rewind 'file[/tmp/my_lwrp/second]' do
  content "on the re-re-wind"
end

unwind 'file[/tmp/third_file]'
