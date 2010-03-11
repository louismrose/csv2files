class RowToText
  def initialize(*headings)
    @headings = *headings
  end
  
  def transform(values)
    transformed = ""
        
    @headings.zip(values).each do |pair|
      transformed += "#{pair.first.strip}=#{pair.last.strip}\n"
    end
    
    transformed
  end
end