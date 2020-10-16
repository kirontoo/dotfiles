conky.config={
	alignment = 'middle_right',
	gap_x = 2010,
	gap_y = 0,
  background=true,
  border_inner_margin=5,
  border_outer_margin=0,
  border_width=2,
  default_bar_height=5,
  default_bar_width=80,
  default_color="ffffff",
  default_graph_height=25,
  default_graph_width=200,
  default_outline_color="ffffff",
  default_shade_color="ff00cc",
  double_buffer=true,
  draw_borders=false,
  draw_graph_borders=false,
  draw_outline=false,
  -- draw_shades=true,
  draw_shades=false,
  font="Fira Code:size=10",
  maximum_width=500,
  minimum_width=500,
  no_buffers=true,
  override_utf8_locale=true,
  own_window_class="Conky",
  own_window_hints="undecorated,below,skip_taskbar,skip_pager",
  own_window_transparent=true,
  own_window=true,
  own_window_type="override",
  stippled_borders=0,
  text_buffer_size=6144,
  total_run_times=0,
  update_interval=1,
  uppercase=false,
  use_spacer="none",
  use_xft=true,
  xftalpha=0.8,
};

conky.text=[[
${font Wargames-Regular:style=Bold:pixelsize=16}DOING ${stippled_hr 2}${font}
${texecpi 60 flock /home/phoenix/.task task limit:10 rc.defaultwidth:80 rc._forcecolor:on rc.verbose:affected,blank doing | ansito - | sed -r 's/([^ ])#/\1\\#/g'}

${font Wargames-Regular:style=Bold:pixelsize=16}TODO ${stippled_hr 2}${font}
${texecpi 60 flock /home/phoenix/.task task limit:10 rc.defaultwidth:80 rc._forcecolor:on rc.verbose:affected,blank todo | ansito - | sed -r 's/([^ ])#/\1\\#/g'}

${font Wargames-Regular:style=Bold:pixelsize=16}BURNDOWN ${stippled_hr 2}${font}

${font}${texecpi 180 flock /home/phoenix/.task task rc.defaultwidth:60 rc.verbose:affected,blank burndown.daily | head -n-2 | /home/phoenix/.config/regolith/conky/conky-bg-space-to-fg.sh | ansito - | sed -r 's/([^ ])#/\1\\#/g'}
### ${font Fira Code:style=Bold:size=8}${texecpi 120 flock /home/phoenix/.task task rc._forcecolor:on burndown.weekly | tail -n+2 | head -n-2 | /home/phoenix/.config/regolith/conky/conky-bg-space-to-fg.sh | ansito - | sed -r 's/([^ ])#/\1\\#/g'}${font}

### ${font Wargames-Regular:style=Bold:pixelsize=16}PROGRESS ${stippled_hr 2}${font}
### ${font}${texecpi 180 flock /home/phoenix/.task /home/phoenix/.config/regolith/conky/conky-task-progress.sh}${font}

${font Wargames-Regular:style=Bold:pixelsize=16}PROGRESS ${stippled_hr 2}${font}
### ${font}${texecpi 180 flock /home/phoenix/.task task rc.defaultwidth:80 rc._forcecolor:on rc.verbose:affected,blank projects}${font}

${font Fira Code:style=Bold:size=10}Project Remaining Avg Age Complete
${font}${texecpi 180 flock /home/phoenix/.task task rc.defaultwidth:80 rc._forcecolor:on rc.verbose:affected,blank summary | ansito - | sed -r 's/([^ ])#/\1\\#/g'}

]]
