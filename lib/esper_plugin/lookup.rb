require 'java'
java_package 'jp.gr.java_conf.ogibayashi.norikra.udf'

class Lookup  
  FILE_UPDATE_CHECK_INTERVAL = 60
  @@lookup_table = Hash.new
  @@next_update_check = nil
  
  def self.read_tsv(path)
    info "Lookup#read_tsv Loading file : #{path}"
    @@next_update_check = Time.now + FILE_UPDATE_CHECK_INTERVAL
    data = File.open(path).readlines.map do |line|
      line.chomp.split("\t")
    end
    Hash[data]
  end

  def self.lookup_tsv(path,key,default_value)
    unless @@lookup_table[path]
      @@lookup_table[path] = self.read_tsv(path)
    end
    if Time.now > @@next_update_check
      # Check if file was updated in last FILE_UPDATE_CHECK_INTERVAL sec.
      if File::Stat.new(path).mtime > (@@next_update_check - FILE_UPDATE_CHECK_INTERVAL)
        @@lookup_table[path] = self.read_tsv(path)
      else
        @@next_update_check = Time.now + FILE_UPDATE_CHECK_INTERVAL
      end
    end
    @@lookup_table[path][key] || default_value
  end
end
