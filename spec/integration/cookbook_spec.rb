require 'spec_helper'

describe 'sprout-terminal' do

  before :all do
    expect(`defaults read com.apple.Terminal 'Default Window Settings'`.strip).not_to eq('Pro')
    expect(system('soloist')).to be_true
  end

  it 'updates default profile' do
    expect(`defaults read com.apple.Terminal 'Default Window Settings'`.strip).to eq('Pro')
  end
end
