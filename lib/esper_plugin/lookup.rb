require 'java'
java_package 'com.linecorp.norikra.udf'

class Lookup  # FQDN: org.example.yourcompany.norikra.udf.MyUDF1
  @@lookup_table = nil
  
  def self.read_tsv(path)
    data = File.open(path).readlines.map do |line|
      line.chomp.split("\t")
    end
    Hash[data]
  end

  def self.lookup(path,key,default_value)
    unless @@lookup_table
      @@lookup_table = self.read_tsv(path)
    end
    @@lookup_table[key] || default_value
  end
end
