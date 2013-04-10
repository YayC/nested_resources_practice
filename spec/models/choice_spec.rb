require 'spec_helper'

describe Choice do
  it { should validate_presence_of(:content) }
  it { should belong_to(:question)}
end
