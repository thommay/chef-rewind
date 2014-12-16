file "/tmp/first_file" do
  content 'a pristine file'
end

file '/tmp/second_file' do
  content 'a file that should exist'
end

file '/tmp/third_file' do
  content 'i should not exist'
end
