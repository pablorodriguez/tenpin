require 'spec_helper'

RSpec.describe FileImport do

  context "test" do
    it "print" do
      tp = TenPin.new( )
      tp.show

      tp.printer = AdvanceGamePrinter.new
      tp.show

      tp.printer = AdvanceGamePrinter.new(nil,:unicode)
      tp.show

    end

  end

end