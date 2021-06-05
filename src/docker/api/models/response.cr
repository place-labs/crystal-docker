require "json"

module Docker::Api::Models
  # :nodoc:
  abstract struct Response
    include JSON::Serializable

    macro extended
      macro finished
        # Initializer based off {{@type.id}} properties
        def initialize(
        {% for arg in @type.instance_vars %}
          @{{arg.name}} : {{arg.type}}{% if arg.has_default_value? %} = {{arg.default_value.id}}{% end %},
        {% end %}
        )
        end
      end
    end
  end
end
