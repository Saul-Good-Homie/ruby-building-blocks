require './lib/caesar_cipher.rb'


describe "#caesar_cipher" do
    it "shifts letters 3 places to the right" do
        expect(caesar_cipher("abc", 3)).to eql("def")
    end

    it "shifts letters 3 places to the left" do
        expect(caesar_cipher("abc", -3)).to eql("xyz")
    end

    it "wraps around letter 'z'" do
        expect(caesar_cipher("xyz", 3)).to eql("abc")
    end

    it "returns both uppercase & lowercase" do
        expect(caesar_cipher("AbC",3)).to eql("DeF")
    end

    it "returns punctuation" do
        expect(caesar_cipher("!ABC?",3)).to eql("!DEF?")
    end

    it "handles large integers" do
        expect(caesar_cipher("ABC",34)).to eql("IJK")
    end


end