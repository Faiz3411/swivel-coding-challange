RSpec.describe Vertical, type: :model do
  it "creates a vertical with categories and courses" do
    vertical = create(:vertical)
    expect(vertical.categories.count).to eq(3)
    expect(vertical.categories.first).not_to be_nil
    expect(vertical.categories.first.courses.count).to eq(3)
  end
end
