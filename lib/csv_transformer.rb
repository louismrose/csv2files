require 'lib/csv_file.rb'
require 'lib/row_transformer.rb'

class CsvTransformer
  def initialize(csv_path, header_path, output_path)
    @csv_path    = csv_path
    @output_path = output_path
    
    @heading = File.exists?(header_path) ? File.open(header_path, "r").read : ''
  end
  
  def transform 
    read_csv
    create_row_transformer
    transform_each_row
  end
  
private

  def read_csv
    @csv = CSVFile.new(@csv_path)
  end
  
  def create_row_transformer
    @row_to_text = RowTransformer.new(@csv.column_names[1..-1])
  end
  
  def transform_each_row
    @csv.per_row do |values|
      write_file(values.first, @row_to_text.transform(values[1..-1]))
    end
  end
  
  def write_file(filename, body)
    File.open(@output_path + '/' + filename, 'w') {|f| f.write(@heading + body) }
  end
end