class Array
  def stable_uniq
    out = []
    seen = {}
    each do |item|
      if !seen[item]
        out << item
        seen[item] = true
      end
    end
    out
  end
end

jars = []

classes = File.read(ARGV[0]).split("\n").reject {|line| line =~ /^#/ }

while line = STDIN.gets
  if line =~ /Loading (\S+) from (.*)\]/
    classes << $1
    jars << $2
  end
end

classes.stable_uniq.each do |klass|
  puts klass
end
STDERR.puts(jars.stable_uniq.join(":"))