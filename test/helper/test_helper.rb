require 'fileutils'
require 'lib/csv_to_files.rb'

class TestHelper
  def initialize(base_dir)
    @base_dir   = base_dir
    @output_dir = "#{base_dir}/output"
    
    clean_directories
  end
  
  def write_header(header)
    write_file('header.txt', header)
  end
  
  def convert(csv)
    write_file('input.csv', csv)
    
    CsvToFiles.new("#{@base_dir}/input.csv", "#{@base_dir}/header.txt", @output_dir).run
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
  
  def write_file(filename, contents)
    File.open("#{@base_dir}/#{filename}", 'w') {|f| f.write(contents) }
  end
end