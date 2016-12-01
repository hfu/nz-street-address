require 'csv'

def show(types)
  types.keys.sort{|a, b| types[a] <=> types[b]}.reverse.each {|k|
    print "#{k}\t#{types[k]}\n"
  }
end

types = Hash.new {|h, k| h[k] = 0}
count = 0
CSV.foreach('cache/nz-street-address.csv') {|r|
  count += 1
  next if count == 1
  types[r[3]] += 1
  show types if count % 10000 == 0
}
show types
