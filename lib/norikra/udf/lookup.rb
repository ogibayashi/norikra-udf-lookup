require 'java'
require 'norikra/udf'


module Norikra
  module UDF

    class Lookup < Norikra::UDF::SingleRow
      # class method
      def self.init
        require 'norikra-udf-lookup.jar'
      end

      # instance method
      def definition
        # function_name, Java Class Name (fqdn),    static function name
        ["lookup", "jp.gr.java_conf.ogibayashi.norikra.udf.Lookup", "lookup"]
      end
    end

  end
end
