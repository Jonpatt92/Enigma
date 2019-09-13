
module Calculable

  #Make calculable(or randomable) method, callable in Shift and Offset
  def create_date
    Date.today.strftime("%d%m%y")
  end

  #Make calculable(or randomable) method, callable in Shift and Key
  def random_key
    5.times.map { rand(0..9) }.join #5 digit number as a string
  end

  #Make calculable method, callable in shift
  def calculate_offset(date)
    offset_value = @date.to_i * @date.to_i
    @offset_value = offset_value.to_s[-4..-1]
  end

  #Make calculable method, callable in Shift
  def find_key_shift(key)
    key_shift = {a: 0, b: 0, c: 0, d: 0}
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

  #Make calculable method, callable in Shift, returns {a:,b:,c:,d:} hash
  def calculate_shift(false)
    #if true, run backwards to decrypt
    #@shift = combine @date_shift & @key_shift
  end


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