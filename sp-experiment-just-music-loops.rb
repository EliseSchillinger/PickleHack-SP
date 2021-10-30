  notes = (scale :c1, :minor_pentatonic, num_octaves: 2).shuffle
  
  #sync cues to sync loops
  live_loop :test_two_bass,sync: :test_one do
    sync :test_one
    100.times do
      #sample :bass_trance_c, amp: 0.5
      sample :bd_haus, cutoff: 80, amp: 3
      sleep 0.5
      
      
    end
  end
  
  live_loop :test_one do
    #sample :loop_amen, rate: 0.70,amp: 3
    use_synth :prophet
    with_fx :distortion do
      with_fx :reverb, room: 1, amp: 2 do
        n = synth :prophet, cutoff: 80, release: 10, note: notes.tick, cutoff_slide: 1, amp: 0.30
        control n, cutoff: 70
        35.times do
          sleep 0.1
          control n, note: notes.choose
        end
      end
    end
    sleep 2.5
  end
  
  