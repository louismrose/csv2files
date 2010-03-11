require 'fileutils'
require 'csv_to_files.rb'

class TestHelper
  def initialize(base_dir, csv)
    @base_dir   = base_dir
    @output_dir = "#{base_dir}/output"
    
    clean_directories
    convert_csv(csv)
  end
  
  def output_filenames
    Dir.entries(@output_dir) - ['.', '..']
  end
  
  def contents_of_output_file_called(filename)
    File.open("#{@output_dir}/#{filename}", "r").read
  end
  
  def delete_directories
    FileUtils.rm_rf(@base_dir) if File.directory?(@base_dir)
  end

private
  def clean_directories
    delete_directories
    Dir.mkdir(@base_dir)
    Dir.mkdir(@output_dir)
  end
  
  def convert_csv(csv)
    File.open('simple/input.csv', 'w') {|f| f.write(csv) }
    CsvToFiles.new('simple/input.csv', @output_dir).run
  end
end