require 'ripper'
require 'pp'

def write_header(title)
  puts
  80.times {print('-')}
  puts
  puts title
  80.times {print('-')}
  puts
end  

def parse(content)
  Ripper.sexp(content)
end

def tokenize(content)
  Ripper.lex(content)
end

def compile(content)
  RubyVM::InstructionSequence.compile(content).disasm
end

def pop_hood(f)
  content = File.read(f)
  tokenized_content = tokenize content
  parsed_content = parse content
  compiled_content = compile content
  write_header "TOKENIZATION"
  pp tokenized_content
  write_header "PARSING"
  pp parsed_content
  write_header "BYTECODE"
  puts compiled_content
end

ARGV.each do |a|
  write_header "File: #{a}"
  successp = pop_hood a
end


