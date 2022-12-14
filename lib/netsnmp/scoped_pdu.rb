# frozen_string_literal: true

module NETSNMP
  class ScopedPDU < PDU
    using ASNExtensions

    attr_reader :engine_id, :security_level, :auth_param

    def initialize(type:, auth_param: "", security_level: 3, engine_id: nil, context: nil, **options)
      @auth_param = auth_param
      @security_level = security_level
      @engine_id = engine_id
      @context = context
      super(type: type, version: 3, community: nil, **options)
    end

    private

    def encode_headers_asn
      [
        OpenSSL::ASN1::OctetString.new(@engine_id || "").with_label(:engine_id),
        OpenSSL::ASN1::OctetString.new(@context || "").with_label(:context)
      ]
    end
  end
end
