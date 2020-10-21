conky.config={
	alignment = 'middle_left',
	gap_x = 1990,
	gap_y = 0,
  background=true,
  border_inner_margin=10,
  border_outer_margin=5,
  border_width=4,
  default_bar_height=5,
  default_bar_width=80,
  default_color="585273",
  default_graph_height=25,
  default_graph_width=200,
  default_outline_color="585273",
  default_shade_color="ff00cc",
  double_buffer=true,
  draw_borders=true,
  draw_graph_borders=false,
  draw_outline=false,
  draw_shades=false,
  draw_shades=false,
  font="iosevka:size=11",
  maximum_width=500,
	minimum_height = 540,
  no_buffers=true,
  override_utf8_locale=true,
  own_window_class="Conky",
  own_window_hints="undecorated,below,skip_taskbar,skip_pager",
  own_window_transparent=false,
  own_window=true,
  own_window_type="override",
	own_window_colour = '1e1c31',
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
${color 62d196}${font scientifica:style=Bold:pixelsize=18}DOING ${stippled_hr 2}${font}
${color cbe3e7}${texecpi 60 flock /home/phoenix/.task task limit:10 rc.defaultwidth:80 rc._forcecolor:off rc.verbose:blank,affected doing | ansito - | sed -r 's/([^ ])#/\1\\#/g'}

${color f2b482}${font scientifica:style=Bold:pixelsize=18}TODO ${stippled_hr 2}${font}
${color cbe3e7}${texecpi 60 flock /home/phoenix/.task task limit:10 rc.defaultwidth:80 rc._forcecolor:off rc.verbose:affected,blank todo | ansito - | sed -r 's/([^ ])#/\1\\#/g'}

${color f02e6e}${font scientifica:style=Bold:pixelsize=18}BURNDOWN ${stippled_hr 2}${font}

${color cbe3e7}${font}${texecpi 180 flock /home/phoenix/.task task rc.defaultwidth:60 rc.verbose:affected,blank burndown.daily | head -n-2 | /home/phoenix/.config/conky/conky-bg-space-to-fg.sh | ansito - | sed -r 's/([^ ])#/\1\\#/g'}
### ${font Fira Code:style=Bold:size=8}${texecpi 120 flock /home/phoenix/.task task rc._forcecolor:on burndown.weekly | tail -n+2 | head -n-2 | /home/phoenix/.config/conky/conky-bg-space-to-fg.sh | ansito - | sed -r 's/([^ ])#/\1\\#/g'}${font}
### ${font scientifica:style=Bold:pixelsize=18}PROGRESS ${stippled_hr 2}${font}
### ${font}${texecpi 180 flock /home/phoenix/.task /home/phoenix/.config/regolith/conky/conky-task-progress.sh}${font}
${color a37acc}${font scientifica:style=Bold:pixelsize=18}PROGRESS ${stippled_hr 2}${font}
### ${font}${texecpi 180 flock /home/phoenix/.task task rc.defaultwidth:80 rc._forcecolor:on rc.verbose:affected,blank projects}${font}

${color cbe3e7}${font Fira Code:style=Bold:size=10}Project Remaining Avg Age Complete
${color cbe3e7}${font}${texecpi 180 flock /home/phoenix/.task task rc.defaultwidth:80 rc._forcecolor:off rc.verbose:affected,blank summary | ansito - | sed -r 's/([^ ])#/\1\\#/g'}
]]
