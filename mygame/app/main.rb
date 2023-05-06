def tick args
  args.render_target(:render).clear_before_render = false

  if args.state.tick_count == 0
    $animation = args.gtk.get_pixels 'sprites/char/stretch_anim.png'
    $map = args.gtk.get_pixels 'sprites/char/map.png'
    $texture = args.gtk.get_pixels 'sprites/char/texture.png'

    $animation.pixels.each_with_index do |pixel, i|
      next if pixel == 0

      map_index = $map.pixels.index(pixel)

      next if map_index == nil

      v = (map_index / $map.w).to_i
      h = map_index % $map.w
      
      output_x = (i / $animation.w).to_i
      output_y = i % $animation.w

      args.render_target(:render).sprites << {x: output_x, y: output_y, w: 1, h: 1, source_x: v, source_y: h, source_w: 1, source_h: 1, path: 'sprites/char/texture.png'}
    end
  end

  args.outputs.sprites << {x: 0, y: 0, w: $animation.w, h: $animation.h, path: :render}

end

def decimal_to_rgba n
  a = (n >> 24) & 0xff
  b = (n >> 16) & 0xff
  g = (n >> 8) & 0xff
  r = n & 0xff
end
