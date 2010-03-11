require 'row_to_text.rb'

class CsvToFiles
  def initialize(csv_path, header_path, output_path)
    @csv_path    = csv_path
    @output_path = output_path
    
    @heading = File.exists?(header_path) ? File.open(header_path, "r").read : ''
  end
  
  def run 
    lines = File.open(@csv_path, "r").readlines
    
    headings = lines.first.split(',')[1..-1]
    row_to_text = RowToText.new(headings)
    
    lines[1..-1].each do |line|
      values = line.split(',')[1..-1]
      transformed = row_to_text.transform(values)
      write_file(line.split(',')[0], transformed)
    end
  end
  
  def write_file(filename, body)
    File.open(@output_path + '/' + filename, 'w') {|f| f.write(@heading + body) }
  end
end