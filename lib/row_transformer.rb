class RowTransformer
  def initialize(*headings)
    @headings = *headings
  end
  
  def transform(values)
    pairs = @headings.zip(values)
    pairs.inject('') { |result, pair| result + "#{pair.first.to_s.strip}=#{pair.last.to_s.strip}\n" }
  end
end