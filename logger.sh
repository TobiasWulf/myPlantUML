#!/bin/bash

SCRIPT_LOG=logs/run.log
touch $SCRIPT_LOG

function SCRIPTENTRY(){
 timeAndDate=`date +"%Y-%m-%d %H:%M:%S"`
 script_name=`basename "$0"`
 script_name="${script_name%.*}"
 echo "[$timeAndDate] [DEBUG]  > $script_name $FUNCNAME"
 echo "[$timeAndDate] [DEBUG]  > $script_name $FUNCNAME" >> $SCRIPT_LOG
}

function SCRIPTEXIT(){
 timeAndDate=`date +"%Y-%m-%d %H:%M:%S"`
 script_name=`basename "$0"`
 script_name="${script_name%.*}"
 echo "[$timeAndDate] [DEBUG]  < $script_name $FUNCNAME"
 echo "[$timeAndDate] [DEBUG]  < $script_name $FUNCNAME" >> $SCRIPT_LOG
}

function ENTRY(){
 local cfn="${FUNCNAME[1]}"
 timeAndDate=`date +"%Y-%m-%d %H:%M:%S"`
 echo "[$timeAndDate] [DEBUG]  > $cfn $FUNCNAME"
 echo "[$timeAndDate] [DEBUG]  > $cfn $FUNCNAME" >> $SCRIPT_LOG
}

function EXIT(){
 local cfn="${FUNCNAME[1]}"
 timeAndDate=`date +"%Y-%m-%d %H:%M:%S"`
 echo "[$timeAndDate] [DEBUG]  < $cfn $FUNCNAME"
 echo "[$timeAndDate] [DEBUG]  < $cfn $FUNCNAME" >> $SCRIPT_LOG
}


function INFO(){
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
    timeAndDate=`date +"%Y-%m-%d %H:%M:%S"`
    echo "[$timeAndDate] [INFO]  $msg"
    echo "[$timeAndDate] [INFO]  $msg" >> $SCRIPT_LOG
}


function DEBUG(){
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
    timeAndDate=`date +"%Y-%m-%d %H:%M:%S"`
    echo "[$timeAndDate] [DEBUG]  $msg"
    echo "[$timeAndDate] [DEBUG]  $msg" >> $SCRIPT_LOG
}

function ERROR(){
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
    timeAndDate=`date +"%Y-%m-%d %H:%M:%S"`
    echo "[$timeAndDate] [ERROR]  $msg"
    echo "[$timeAndDate] [ERROR]  $msg" >> $SCRIPT_LOG
}
