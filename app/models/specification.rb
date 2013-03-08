class Specification < ActiveRecord::Base
  serialize :parameters
  RadixList = [ ["Binary(2)", 2], ["Ternary(3)", 3], ["Quaternary(4)", 4], ["Quinary (5)", 5], ["Senary (6)", 6], ["Septenary (7)", 7]]
  AvailableFunctions = QuFunction::Generators.available_functions.map{|klass| [klass.name, klass.to_s]}
  def self.find_or_initialize_by_parameters(params)
    instance = find_or_initialize_by_name_and_radix_and_variables_and_completed(params[:name], params[:radix], params[:variables], params[:completed])
    instance.parameters = params
    instance.generate
  end

  def generator_class
    name.constantize
  end

  def generate
    return self if content.present?
    options = {:complete => completed}
    self.signature, self.content = QuFunction::Specification.generate(name, parameters[:radix], parameters[:variables], options)
    self
  end

  def human_name
    AvailableFunctions.detect {|x| x.last == name}.first
  end

  def human_radix
    RadixList.detect {|x| x.last == radix }.first
  end
end
