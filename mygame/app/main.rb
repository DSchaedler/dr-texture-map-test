def tick args

  if args.state.tick_count == 0
    animation = args.gtk.get_pixels 'sprites/char/stretch_anim.png'

    puts animation

  end

end

def decimal_to_rgba n
  a = (n >> 24) & 0xff
  r = (n >> 16) & 0xff
  g = (n >> 8) & 0xff
  b = n & 0xff
end