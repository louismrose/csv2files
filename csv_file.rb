class CSVFile
  def initialize(filename)
    @lines = File.open(filename, "r").readlines
  end
  
  def column_names
    header_line.split(',')
  end
  
  def per_row(&block)
    data_lines.each do |line|
      yield line.split(',')
    end
  end
  
private
  
  def header_line
    @lines.first
  end
  
  def data_lines
    @lines[1..-1]
  end
end