struct UUID
  def to_canonical_extjson(builder : JSON::Builder)
    builder.object {
      builder.string("$binary")
      builder.object {
        builder.string("base64")
        builder.string(Base64.strict_encode(self.bytes))
        builder.string("subType")
        builder.string(0x04.to_s(16).rjust(2, '0'))
      }
    }
  end
end
