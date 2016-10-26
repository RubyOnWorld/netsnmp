module NETSNMP
  module Encryption
    class None

      attr_reader :salt
      def initialize(*)
        @salt = ""
      end

      def encrypt(pdu)
        pdu
      end
      def decrypt(stream, *)
        stream
      end
    end
  end
end
