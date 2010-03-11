require 'test/unit'
require 'fileutils'

require 'csv_to_files.rb'

class Simple < Test::Unit::TestCase
  
  @@test_path   = 'simple'
  @@output_path = 'simple/output'
  
  def setup
    FileUtils.rm_rf(@@test_path) if File.directory?(@@test_path)
    Dir.mkdir(@@test_path)
    Dir.mkdir(@@output_path)
    
    csv = "Exam Number,Report,Code\nlouis,10,5\ndimitar,10,10"
    
    File.open('simple/input.csv', 'w') {|f| f.write(csv) }
    
    CsvToFiles.new('simple/input.csv', @@output_path).run
  end
  
  def teardown
    FileUtils.rm_rf(@@test_path) if File.directory?(@@test_path)
  end
  
  def test_that_two_files_are_generated
    assert_equal 2, Simple.output_filenames.size
  end
  
  def test_that_files_with_correct_names_are_generated
    assert_equal ['dimitar', 'louis'], Simple.output_filenames.sort
  end

  def test_that_files_have_correct_contents
    assert_equal "Report=10\nCode=5\n",  File.open("#{@@output_path}/louis",   "r").read
    assert_equal "Report=10\nCode=10\n", File.open("#{@@output_path}/dimitar", "r").read
  end

private
  def self.output_filenames
    Dir.entries(@@output_path) - ['.', '..']
  end
end