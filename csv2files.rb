require 'lib/csv_transformer.rb'
require 'fileutils'

class Csv2Files
  def run
    FileUtils.rm_rf('output') if File.directory?('output')
    Dir.mkdir('output')
    CsvTransformer.new('input.csv', 'header.txt', 'output').transform
  end
end

Csv2Files.new.run