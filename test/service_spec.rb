require './src/service'

describe LookLike::Service do
  it "should execute matchers and [] if no errors" do
    expected  = []
    script    = 'expect("one@two.xyz").to look_like("email")'
    actual    = LookLike::Service.execute(script)
    expect(actual).to eq(expected)
  end

  it "should execute matchers and return assertion messages" do
    expected  = ["\"one.two.xyz\" does not look like \"email\" (email)", "\"one.two.com\" does not look like \"email\" (email)"]
    script    = 'expect("one.two.xyz").to look_like("email"); expect("one.two.com").to look_like("email"); expect("one@two.xyz").to look_like("email")'
    actual    = LookLike::Service.execute(script)
    expect(actual).to eq(expected)
  end

end
