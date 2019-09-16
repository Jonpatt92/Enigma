
module Calculable

  # Callable in Shift and Offset
  def create_date
    Date.today.strftime("%d%m%y")
  end

  # Callable in Shift and Key
  def random_key
    rand.to_s[2..6] #5 digit number as a string
  end

  # Callable in shift
  def calculate_offset(date)
    offset_value = date.to_i * date.to_i
    @date_shift = offset_value.to_s[-4..-1]
  end

  # Callable in Shift
  def find_key_shift(key)
    key_shift = {a: 0, b: 0, c: 0, d: 0}
    key = key.to_s
    if key.count("0123456789") == 5
      string_key = key.to_s
    elsif
     key = self.random_key
      string_key = key.to_s
    end

    key_shift[:a] = string_key[0..1]
    key_shift[:b] = string_key[1..2]
    key_shift[:c] = string_key[2..3]
    key_shift[:d] = string_key[3..4]

    key_shift
  end


  #Callable in Shift, returns {a:,b:,c:,d:} hash
  def calculate_shift(key_shift, date_shift, decrypt = false)
    this_key_shift = key_shift
    this_date_shift = date_shift
    this_key_shift.transform_values!(&:to_i)

    this_key_shift[:a] += this_date_shift[0].to_i
    this_key_shift[:b] += this_date_shift[1].to_i
    this_key_shift[:c] += this_date_shift[2].to_i
    this_key_shift[:d] += this_date_shift[3].to_i

    if decrypt
      neg_shift = Hash.new(0)
      this_key_shift.each do |k, v|
        neg_shift[k] = -1 * v
      end
      neg_shift
    else
      this_key_shift
    end
  end

end
  # Called in shift. Outputs encrypted or decrypted message based on 'absolute_shift'

  # def apply_shift(message, shift)

  # end








##Consider Implementing##
#http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
# module Calculable #ClassLevelInheritableAttributes
#   def self.included(base)
#     base.extend(ClassMethods)
#   end
#
#   module ClassMethods
#     def inheritable_attributes(*args)
#       @inheritable_attributes ||= [:inheritable_attributes]
#       @inheritable_attributes += args
#       args.each do |arg|
#         class_eval %(
#           class << self; attr_accessor :#{arg} end
#         )
#       end
#       @inheritable_attributes
#     end
#
#     def inherited(subclass)
#       @inheritable_attributes.each do |inheritable_attribute|
#         instance_var = "@#{inheritable_attribute}"
#         subclass.instance_variable_set(instance_var, instance_variable_get(instance_var))
#       end
#     end
#   end
# end
