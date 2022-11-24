require 'cat_facts'

RSpec.describe CatFacts do
  it 'returns a random fact about cats' do
    fake_requester = double :dbl_requester
    expect(fake_requester).to receive(:get).with(URI("https://catfact.ninja/fact")).
    and_return('{"fact":"At 4 weeks, it is important to play with kittens so that they do not develope a fear of people.","length":95}')
    cat_facts = CatFacts.new(fake_requester)
    expect(cat_facts.provide).to eq "Cat fact: At 4 weeks, it is important to play with kittens so that they do not develope a fear of people."
  end
end