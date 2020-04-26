require 'spec_helper'

RSpec.describe TenPin do

  context "test print format" do
    let(:tenpin) { TenPin.new }
    it "text" do
      tenpin.show
    end

    it "advance ascii" do
      tenpin.printer = AdvanceGamePrinter.new
      tenpin.show
    end

    it "advance unicode" do
      tenpin.printer = AdvanceGamePrinter.new(nil,:unicode)
      tenpin.show
    end

  end

end