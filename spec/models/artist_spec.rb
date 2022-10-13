require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
    @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 664, play_count: 99)
    @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 99)
  end
  describe 'instance methods' do
    describe '#average_song_length' do
      # before :each do
      #   @prince = Artist.create!(name: 'Prince')
      #   @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
      #   @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 664, play_count: 99)
      #   @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 99)
      # end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(503.33)
      end
    end

    describe '#songs' do
      it 'returns all of the associated song objects' do
        # First, Comment out the has_many :songs Association from the Artist model
        # Then, make this test pass WITHOUT using Associations
        expect(@prince.songs).to eq([@purple, @beret, @other_song])
      end
    end

    describe '#song_count' do
      it 'counts the number of songs' do
        # Make this test pass WITH Associations
        expect(@prince.song_count).to eq(3)
      end
    end

    describe '#wrote_song?' do
      # Write two versions of this method
      # Version 1 - Make these tests pass WITH Association
      # Version 2 - Make these tests pass WITHOUT Association

      it 'returns true if the song is associated with the artist' do
        expect(@prince.wrote_song?(@purple)).to be(true)
      end

      it 'returns false if the song is not associated with the artist' do
        diff_artist = Artist.create!(name: 'Different Artist')
        diff_song = diff_artist.songs.create!(title: "Different Song", length: 0, play_count: 0)
        expect(@prince.wrote_song?(diff_song)).to be(false)
      end

    end
  end

end