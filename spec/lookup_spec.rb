require 'norikra/udf_spec_helper'
include Norikra::UDFSpecHelper
require 'norikra/udf/lookup' # this is your UDF definition file

# for single row UDF
describe Norikra::UDF::LookupTsv do
  udf_function Norikra::UDF::LookupTsv
  TMP_TABLE_FILE = "/tmp/lookuptest.tsv"
  
  before do
    File.open(TMP_TABLE_FILE,"w"){  |f|
      f.puts "key1\thoge"
      f.puts "key2\tfoo"
    }
  end
  
  it 'Key found' do
    expect(fcall(:lookup_tsv, TMP_TABLE_FILE, "key1","notfound")).to eql("hoge")
  end

  it 'Key not found' do 
    expect(fcall(:lookup_tsv, TMP_TABLE_FILE, "key5","notfound")).to eql("notfound")
  end

  after do
    File.unlink(TMP_TABLE_FILE)
  end
end
