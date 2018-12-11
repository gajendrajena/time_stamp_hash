require_relative './../time_stamp_hash'

RSpec.describe TimeStampHash do

    before do
      @d = TimeStampHash.new
    end

  describe 'set' do
    context 'should set key and value w.r.t. a time stamp' do

      it 'should set key 1 to value 1 at time 0' do
        expect(@d.set(1, 1, 0)).to eq(1)
        expect(@d).to eq({1=>{0=>1}})
      end

      it 'should set key 1 to value 2 at time 2' do
        expect(@d.set(1, 2, 2)).to eq(2)
        expect(@d).to eq({1=>{2=>2}})
      end
    end

    it 'should get an exception with message when key is nil' do
      begin
        @d.set(nil, 1, 0)
      rescue KeyError => e
        puts e.message
        expect(e.message).to eq("key should not be nil")
      end
    end

    it 'should get an exception with message when times_tamp is nil' do
      begin
        @d.set(1, nil, 0)
      rescue KeyError => e
        puts e.message
        expect(e.message).to eq("time_stamp should not be nil")
      end
    end

  end

  describe 'get' do

    it 'should get value w.r.t. a time stamp for a key' do
      @d.set(1, 1, 0)
      expect(@d.get(1, 0)).to eq(1)
    end

    it 'should get nil if the key is not present' do
      expect(@d.get(1, 0)).to eq(nil)
    end

    it 'should get nil if the time_stamp is not present' do
      expect(@d.get(1, 0)).to eq(nil)
    end

  end


end

