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

  describe 'in the lwrp' do
    describe '/tmp/my_lwrp/first' do
      it 'should get created' do
        file('/tmp/my_lwrp/first').must_exist
      end
      it 'should not be rewound' do
        file('/tmp/my_lwrp/first').must_include 'some content goes here'
      end
    end

    describe '/tmp/my_lwrp/second' do
      it 'should get created' do
        file('/tmp/my_lwrp/first').must_exist
      end
      it 'should be rewound' do
        file('/tmp/my_lwrp/first').must_include 'on the re-re-wind'
      end
    end

  end
end
