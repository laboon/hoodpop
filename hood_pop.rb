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
  write_header "TOKENIZATION"
  pp (tokenize content)
  write_header "PARSED - ABSTRACT SYNTAX TREE"
  pp (parse content)
  write_header "BYTECODE"
  puts (compile content)
end

ARGV.each do |a|
  write_header "File: #{a}"
  pop_hood a
end


