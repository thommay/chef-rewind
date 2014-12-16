require 'minitest/spec'

describe_recipe 'rewind::default' do
  describe 'the first file' do
    it 'should get created' do
      file('/tmp/first_file').must_exist
    end

    it 'should be rewound' do
      file('/tmp/first_file').must_include 'a rewound file'
    end
  end

  it 'should create the second file' do
    file('/tmp/second_file').must_exist
  end

  it 'should not create the third file' do
    file('/tmp/third_file').wont_exist
  end
end
