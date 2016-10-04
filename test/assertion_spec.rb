# require "./test/spec_helper"
require './src/assertion'

describe "email" do
  it "should support email" do
    expected  = nil
    actual    = LookLike::Assertion.new("a@b.com").to "email"
    expect(actual).to eq(expected)
  end

  it "should support email" do
    expected  = "\"ab.com\" does not look like \"email\" (email)"
    actual    = LookLike::Assertion.new("ab.com").to "email"
    expect(actual).to eq(expected)
  end
end
