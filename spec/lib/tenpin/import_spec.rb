require 'spec_helper'

RSpec.describe FileImport do

  context "test" do
    it "print" do
      file = File.join(File.dirname(__FILE__), '../../../lib/tenpin_data.txt')

      #FileImport.new(file).read

      TenPin.new.show
    end

  end

end