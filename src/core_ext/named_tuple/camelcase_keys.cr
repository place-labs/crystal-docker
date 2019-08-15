require "../hash/deep_transform_values"

struct NamedTuple
  # Deep transform a NamedTuple using underscore based key names to a nested Hash with CamelCase
  # equivalents.
  def camelcase_keys
    to_h.transform_keys(&.to_s.camelcase).deep_transform_values do |value|
      case value
      when NamedTuple
        value.camelcase_keys
      else
        value
      end
    end
  end
end
