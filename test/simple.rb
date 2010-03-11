require 'test/unit'
require 'fileutils'

class Simple < Test::Unit::TestCase
  
  @@output_path = 'simple'
  
  def setup
    FileUtils.rm_rf(@@output_path) if File.directory?(@@output_path)
    Dir.mkdir(@@output_path)
    
    csv = "Exam Number,Report,Code
louis,10,5
dimitar,10,10"
    
    File.open('simple/input.csv', 'w') {|f| f.write(csv) }
    
    CsvToFiles.new('simple/input.csv', @@output_path).run
  end
  
  def teardown
    FileUtils.rm_rf(@@output_path) if File.directory?(@@output_path)
  end
  
  def test_that_two_files_are_generated
    assert_equal 2, Dir.entries(@@output_path) - ['.', '..']
  end

end