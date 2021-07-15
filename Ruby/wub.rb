test_string = "WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB"
second_test = "WUBAWUBBWUBCWUB"

def song_decoder(song)
    song.gsub!("WUB", " ")
    song = song.squeeze(" ")
    decoded = song.strip
    return decoded 
end

puts song_decoder(second_test)


def jazzy_decoder(song)
    song.gsub("WUB", " ").squeeze(" ").strip
end

puts jazzy_decoder(test_string)
