# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):

ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural /(r|n|d|l)$/i, '\1es'
  inflect.singular /(r|n|d|l)es$/i, '\1'
end
