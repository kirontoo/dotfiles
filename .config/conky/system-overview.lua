conky.config = {
    alignment = 'middle_left',
    background = true,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = 'ffffff',
    default_outline_color = 'ffffff',
    default_shade_color = 'ff00cc',
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = true,
    use_xft = true,
    font = 'Anonymous Pro Minus:size=9',
    gap_x = 32,
    gap_y = 24,
    minimum_height = 540,
    minimum_width = 380,
    maximum_width = 380,
    net_avg_samples = 2,
    no_buffers = true,
    double_buffer = true,
    out_to_console = false,
    out_to_stderr = false,
    extra_newline = false,
    own_window = true,
    own_window_transparent = true,
    own_window_class = 'Conky',
    own_window_type = 'override',
    own_window_hints = 'undecorated,below,skip_pager,skip_taskbar',
    stippled_borders = 0,
    update_interval = 3.0,
    uppercase = false,
    use_spacer = 'none',
    show_graph_scale = false,
    show_graph_range = false,
    own_window_argb_visual = true,
    own_window_argb_value = 0
}

conky.text = [[

${font Wargames-Regular:size=16}${color ccff00}PWR$font ${battery_percent BAT1}% ${battery_bar 8 BAT1}$color

### SYSTEM ###
${font Wargames-Regular:size=16}${color 00ffcc}SYS ${stippled_hr 2}$color$font
   HOST${alignr}${color 00ffcc}"$nodename" Satellite L745$color
   OS${alignr}${color 00ffcc}Linus Mint 19.1 Tessa$color
   KERNEL${alignr}${color 00ffcc}$sysname $kernel$color
   ARCHITECTURE${alignr}${color 00ffcc}$machine$color
   UPTIME${alignr}${color 00ffcc}$uptime_short$color

### CPU ###
${font Wargames-Regular:size=16}${color ff00cc}CPU ${stippled_hr 2}$color$font
   INTEL i7-8700K${alignr}4 (8) @ 4.0GHz

   CORE 1 @ ${freq 1}MHz${alignc -36}${hwmon 0 temp 1}°C${alignr}${cpu cpu1}% (${cpu cpu3}%)
   CORE 2 @ ${freq 2}MHz${alignc -36}${hwmon 0 temp 2}°C${alignr}${cpu cpu2}% (${cpu cpu4}%)
   CORE 3 @ ${freq 3}MHz${alignc -36}${hwmon 1 temp 3}°C${alignr}${cpu cpu3}% (${cpu cpu5}%)
   CORE 4 @ ${freq 4}MHz${alignc -36}${hwmon 1 temp 4}°C${alignr}${cpu cpu4}% (${cpu cpu6}%)
   LOGICAL   1  ${color ff00cc}${cpubar cpu1 8,120}$color${alignr}(3) ${color ff00cc}${cpubar cpu3 8,120}$color
   LOGICAL   2  ${color ff00cc}${cpubar cpu2 8,120}$color${alignr}(4) ${color ff00cc}${cpubar cpu4 8,120}$color

   PROCESSES${alignc -12}${running_processes} / ${processes}$color${alignr}${cpu}%
   ${color ff00cc}${cpugraph cpu0 24 ff00cc}$color

   ${color ff00cc}CPU       MEM       Disk      PID       Name$color
 ${top cpu 1}    ${top mem 1}    ${top io_perc 3}     ${top pid 1}      ${top name 1}
 ${top cpu 2}    ${top mem 2}    ${top io_perc 3}     ${top pid 2}      ${top name 2}
 ${top cpu 3}    ${top mem 3}    ${top io_perc 3}     ${top pid 3}      ${top name 3}

### MEMORY ###
${font Wargames-Regular:size=16}${color 4cff00}MEM ${stippled_hr 2}$color$font
   SO-DIMM DDR4${alignr}6GB @ 1600MHz

   RAM ${alignc}${mem} / ${memmax}${alignr}$memperc%
   ${color 4cff00}${membar 8}$color
   SWAP ${alignc}${swap} / ${swapmax}${alignr}$swapperc%
   ${color 4cff00}${swapbar 8}$color

   ${color 4cff00}MEM       CPU       Disk      PID       Name$color
 ${top_mem mem 1}    ${top_mem cpu 1}    ${top_mem io_perc 1}     ${top_mem pid 1}      ${top_mem name 1}
 ${top_mem mem 2}    ${top_mem cpu 2}    ${top_mem io_perc 2}     ${top_mem pid 2}      ${top_mem name 2}
 ${top_mem mem 3}    ${top_mem cpu 3}    ${top_mem io_perc 3}     ${top_mem pid 3}      ${top_mem name 3}

### STORAGE ###
${font Wargames-Regular:size=16}${color ff3300}HDD ${stippled_hr 2}$color$font
   ${exec hddtemp /dev/sda}${alignr}750GB @ 5400 RPM

   / (${fs_type /})${alignc}${fs_used /} / ${fs_size /}${alignr}${fs_used_perc /}%
   ${color ff3300}${fs_bar 8 /}$color
   /home (${fs_type /home})${alignc}${fs_used /home} / ${fs_size /home}${alignr}${fs_used_perc /home}%
   ${color ff3300}${fs_bar 6 /home}$color

   READ       ${color ff3300}${diskiograph_read /dev/sda 24,120 300001 ff3300}$color${alignr}WRITE ${color ff3300}${diskiograph_write /dev/sda 24,120 300001 ff3300}$color
              ${diskio_read}/s${alignr}${diskio_write}/s

### NETWORK ###
${font Wargames-Regular:size=16}${color 3300ff}NET ${stippled_hr 2}$color$font
   ${wireless_essid wlp4s0}${alignr}WLAN @ 5.0GHz

   DOWNLOAD   ${color 3300ff}${downspeedgraph wlp4s0 24,120 300001 3300ff}$color${alignr}UPLOAD ${color 3300ff}${upspeedgraph wlp4s0 24,120 300001 3300ff}$color
              ${downspeed wlp4s0}/s (${totaldown wlp4s0})${alignr}${upspeed wlp4s0}/s (${totalup wlp2s0})
]]
