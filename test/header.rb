require 'test/unit'
require 'test/helper/test_helper.rb'

class Header < Test::Unit::TestCase
  
  def setup
    @header = "These marks are organically farmed.\nNo students were harmed during this assessment.\n"
    
    @helper = TestHelper.new('header')
    
    @helper.write_header(@header)
    @helper.convert("Exam Number,Report,Code\nlouis,10,5\ndimitar,10,10")
  end
  
  def teardown
    @helper.delete_directories
  end
  
  def test_that_two_files_are_generated
    assert_equal 2, @helper.output_filenames.size
  end
  
  def test_that_files_with_correct_names_are_generated
    assert_equal ['dimitar', 'louis'], @helper.output_filenames.sort
  end

  def test_that_files_have_correct_contents_including_header
    assert_equal "#{@header}Report=10\nCode=5\n",  @helper.contents_of_output_file_called('louis')
    assert_equal "#{@header}Report=10\nCode=10\n", @helper.contents_of_output_file_called('dimitar')
  end
end