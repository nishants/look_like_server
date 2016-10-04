require './src/service'

describe LookLike::Service do
  it "should execute matchers and return result" do
    expected  = nil
    script    = 'expect("one@two.xyz").to look_like("email")'
    actual    = LookLike::Service.execute(script)
    expect(actual).to eq([])
  end

end
