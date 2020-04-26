class BaseReportPrinter

  attr_accessor :data

  def initialize(data=nil)
    @data = data
  end

  def format
    raise 'Not Implemented'
  end

  def header
    raise 'Not Implemented'
  end

  def body
    raise 'Not Implemented'
  end

end