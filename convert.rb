require 'csv_to_files.rb'
require 'fileutils'

class Convert
  def run
    FileUtils.rm_rf('output') if File.directory?('output')
    Dir.mkdir('output')
    CsvToFiles.new('input.csv', 'header.txt', 'output').run
  end
end

Convert.new.run