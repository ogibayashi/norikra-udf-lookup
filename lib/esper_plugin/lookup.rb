require 'java'
java_package 'jp.gr.java_conf.ogibayashi.norikra.udf'

class Lookup  
  @@lookup_table = Hash.new

  def self.read_tsv(path)
    data = File.open(path).readlines.map do |line|
      line.chomp.split("\t")
    end
    Hash[data]
  end

  def self.lookup_tsv(path,key,default_value)
    unless @@lookup_table[path]
      @@lookup_table[path] = self.read_tsv(path)
    end
    @@lookup_table[path][key] || default_value
  end
end
