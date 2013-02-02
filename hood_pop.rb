require 'ripper'
require 'pp'

def write_to_file(file, data)
  # 40.times print '-'
  pp data
  # 40.times print '-'
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
  write_to_file("a", tokenized_content)
  write_to_file("a", parsed_content)
  write_to_file("a", compiled_content)
end

ARGV.each do |a|
  print "Popping hood of #{a}... "
  successp = pop_hood a
  puts (successp) ? 'done!' : 'had a problem!'
end


