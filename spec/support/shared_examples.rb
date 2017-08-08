RSpec.shared_examples 'has_valid_factory' do
  it 'has a valid factory' do
    expect(build(described_class.name.underscore)).to be_valid
  end
end
