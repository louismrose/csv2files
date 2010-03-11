## CSV 2 Files

Generates a directory containing a file for each row in a CSV file.

For example, the following CSV:

    Exam Number,Report,Code
    louis,50,25
    dimitar,50,50
    
Will generate the following directory structure:

    output/
      louis 
      dimitar

Where the first file contains:

    Report=50
    Code=25
    
And the second file contains:

    Report=50
    Code=50   

## Installation

Assuming that git and ruby are installed, CSV 2 Files can be installed by cloning this git repository:

    git clone git://github.com/louismrose/csv2files.git

If you're behind a firewall, you may need to use HTTP:

    git clone http://github.com/louismrose/csv2files.git

## Usage

From within the csv2files directory, CSV 2 Files is invoked using:

    ruby convert.rb
    
This assumes a CSV file called input.csv in the csv2files directory, and generates files to the output directory. Any existing files in the output directory are deleted.

### Headers

If the file header.txt exists in the csv2files directory, the contents of that file is included at the top of each generated file.

For example, the following input.csv:

    Exam Number,Report,Code
    louis,50,25

With the following header.txt:

    These marks are organically farmed.
    No students were harmed during this assessment.

Will produce a file, output/louis, containing:

    These marks are organically farmed.
    No students were harmed during this assessment.
    Report=50
    Code=25


Copyright &copy; 2010 [Louis Rose](http://www.cs.york.ac.uk/~louis), released under the MIT license