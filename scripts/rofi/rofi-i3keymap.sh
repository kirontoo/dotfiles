##!/bin/bash

declare -A keys

eval "$(i3-msg -t get_config | awk '

  BEGIN {foundkeys=0}

  {

    if($1=="mode") {ismode=1}
    if($1=="}")    {ismode=0}

    gsub(/["]/,"\\\"",$0)

    original=$0

    for(k in variables){
      gsub("[$]"k,variables[k],$0)
    }

    if($1=="bindsym" && ismode!=1){

      gsub("[$]","\\$",original)

      if($0!~"exec"){msg="i3-msg "}
      else {msg=""}

      gsub(/bindsym|--release|exec|--no-startup-id/,"",$0)
      
      gsub("+","",$1)

      sub("Mod4","#",$1)
      sub("Mod1","!",$1)
      sub("Control","^",$1)
      sub("Shift","+",$1)

      bindsym=$1
      $1=""
      sub(/^[[:space:]]*/,"",$0)
      cmd=$0
      realcmd=msg cmd

      print "keys[" foundkeys "-bindsym]=\"" bindsym "\""
      print "keys[" foundkeys "-cmd]=\"" cmd "\""
      print "keys[" foundkeys "-realcmd]=\"" realcmd "\""
      print "keys[" foundkeys "-original]=\"" original "\""

      foundkeys++
    }

    if($1=="set"){
      sub("[$]","",$2)
      uservar=$2
      $1=$2=""
      sub(/^[[:space:]]*/,"",$0)
      userval=$0
      variables[uservar]=userval
    }
    
  }

  END {print "foundkeys=" foundkeys}

')"

selected="$({
  for ((i=0;i<foundkeys;i++)); do
    echo "${keys[${i}-bindsym]}" "${keys[${i}-cmd]}"
  done
} | rofi -theme simple-menu -width 40 -dmenu -format i -mesg "#=Win, !=Alt, +=Shift, ^=Ctrl")"

[[ -z $selected ]] && exit 1

eval "${keys[${selected}-realcmd]}"!/bin/bash
