# Input is a string
# Prints, not returns, one of three things:
# The contents of the input if it's a directory
# The file name if it's a file
# Otherwise, an error message
def ls(filename)
  if File.directory?(filename)
    puts(Dir['./' + filename + '/*'])
  elsif File.file?(filename)
    puts(filename)
  else 
    puts("error")
  end
end

# Input is a string
# Print, not returns, the size of the file if it's a file
# Otherwise prints the size of each item in the directory
def showSizes(filename)
  if File.exists?(filename)
    puts(File.stat(filename).size)
  elsif File.directory?(filename)
    puts(Dir.entries(filename).select {|f| !File.directory? f}.size)
  end
end
#  input = File.open(donor, 'r') 
#  output = File.open(recipient, 'w')
#  output += input

# Inputs are strings
# Writes the contents of donor file to recipient file
# Remember to close files after opening them
def copy(donor, recipient)
  input = File.open(donor, 'r') {|f| f.read() }
  output = File.open(recipient, 'w') {|f| f.write(input) }
end

# Input is a string
# Prints, not returns, three things:
# The number of lines in the file
# The number of words in the file
# The number of characters in the file
# Compare your output to the output of the "wc" UNIX command
# Hint: this is more a string problem than a file problem
# Remember that a newline character is automatically appended to files
def wc(filename)
  input = File.open(filename, 'r') {|f| f.read() }
  puts("%d lines" % [input.each_line.count])
  puts("%d words" % [input.split(' ').count])
  puts("%d chars" % [input.split('').count])
end
