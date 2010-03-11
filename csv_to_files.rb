require 'row_to_text.rb'

class CsvToFiles
  def initialize(csv_path, output_path)
    @csv_path    = csv_path
    @output_path = output_path
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
    header = "The POP-2 assignment carried up to 25 marks, which were allocated for the results of testing [10 marks] and the submitted report [15 marks]. Here is a video clip containing group feedback: http://www-course.cs.york.ac.uk/pop/Assessments/2009/Second/feedback-flash/pop2-2009-10-assessment-feedback.html 

    The tests used for marking are available here: 
    http://www-course.cs.york.ac.uk/pop/test.txt 
    The allocated test marks are also available online: 
    http://www-course.cs.york.ac.uk/pop/POP-2-2009-test-marks.html 

    Report feedback: for the meaning of each marking criterion please consult the marking guidelines: http://www-course.cs.york.ac.uk/pop/Assessments/2009/Second/marking-guidelines.txt - note that you could receive up to 1 mark under \"Further Design\" for a suitable feature of the design that was not mandatory, e.g., error handling.\n"
    
    File.open(@output_path + '/' + filename, 'w') {|f| f.write(header + body) }
  end
end