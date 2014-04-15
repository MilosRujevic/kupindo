class Kupindo
  module Base
    def self.included target
      target.extend(ClassMethods)
    end

    attr_accessor :raw

    def initialize raw
      @raw = raw
    end

    module ClassMethods
      def load_from hash
        item = self.new(hash)
        (@string_attrs || []).each do |attr|
          if val = hash[attr.to_s]
            item.send("#{attr}=", val)
          end
        end
        (@int_attrs || []).each do |attr|
          if val = hash[attr.to_s]
            item.send("#{attr}=", val.to_i)
          end
        end
        (@time_attrs || []).each do |attr|
          if val = hash[attr.to_s]
            item.send("#{attr}=", DateTime.parse(val))
          end
        end

        item
      end

      def string_attrs *attrs
        @string_attrs ||= []
        @string_attrs += attrs
        attr_accessor *attrs
      end

      def int_attrs *attrs
        @int_attrs ||= []
        @int_attrs += attrs
        attr_accessor *attrs
      end

      def time_attrs *attrs
        @time_attrs ||= []
        @time_attrs += attrs
        attr_accessor *attrs
      end
    end
  end
end
