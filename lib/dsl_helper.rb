module DslHelper
  module ClassMethods
    def dsl_attr(*attrs)
      attrs.each do |attr|
        self.module_eval "
          def #{attr}(val)
            @#{attr} = val
          end

          def _#{attr}
            @#{attr}
          end

          def _#{attr}=(val)
            @#{attr} = val
          end
        "
      end
    end
  end
  
  def self.included(cls)
    cls.extend(ClassMethods)
  end
  
end