#!/bin/bash

cmd=${cmd:=libuseradd.sh}

LibNssMySQLCFG=/etc/libnss-mysql.cfg

function warning {
	echo "$@" 1>&2
}

if [ ! -e "$LibNssMySQLCFG" ]
then
	warning "$cmd : '$LibNssMySQLCFG' is missing.  Cannot find database."
	exit 1
fi

MySQLHost=$(grep host "$LibNssMySQLCFG" | awk '{print $2}')
MySQLDB=$(grep database "$LibNssMySQLCFG" | awk '{print $2}')

function sys {
	[ -n "${opt_n}${opt_v}" ] && echo "$@"
	[ -z "$opt_n" ] || "$@"
}

function cmdMySQL {
	mysql -NB -h "$MySQLHost" -e "$@" "$MySQLDB"
}

function verbCmdMySQL {
        [ -n "${opt_n}${opt_v}" ] && echo mysql -h "$MySQLHost" -e "$@" "$MySQLDB"
        [ -z "$opt_n" ] || cmdMySQL "$@"
}

#addUser_MySQL "$UName" "$EPW" "$Uid" "$Gid" "$GeCOS" "$HDir" "$SHELL"
function addUser_MySQL {
	local User="$1"
}

# setUserGeCOSMySQL "$User" "$opt_c"
function setUserGeCOSMySQL {
	local User="$1"
}

# setUserHDirMySQL "$User" "$opt_d"
function setUserHDirMySQL {
	local User="$1"
}

# setUserGidMySQL "$User" "$opt_g"
function setUserGidMySQL {
	local User="$1"
}

# setUserUNameMySQL "$User" "$opt_l"
function setUserUNameMySQL {
	local User="$1"
}

# setUserEPWMySQL "$User" "$opt_p"
function setUserEPWMySQL {
	local User="$1"
}

# setUserShellMySQL "$User" "$opt_s"
function setUserShellMySQL {
	local User="$1"
}

# setUserUidMySQL "$User" "$opt_u"
function setUserUidMySQL {
	local User="$1"
}

# setUserLastDayMySQL "$User" "$opt_d"
function setUserLastDayMySQL {
	local User="$1"
}

# setUserExpireDateMySQL "$User" "$opt_E"
function setUserExpireDateMySQL {
	local User="$1"
}
		
# setUserInactiveMySQL "$User" "$opt_I"
function setUserInactiveMySQL {
	local User="$1"
}

# getUserAgingMySQL "$User" "$opt_l"
function getUserAgingMySQL {
	local User="$1"
}

# setUserMinDaysMySQL "$User" "$opt_m"
function setUserMinDaysMySQL {
	local User="$1"
}

# setUserMaxDaysMySQL "$User" "$opt_M"
function setUserMaxDaysMySQL {
	local User="$1"
}

# setUserWarnDaysMySQL "$User" "$opt_W"
function setUserWarnDaysMySQL {
	local User="$1"
}

#addGroup_MySQL "$GName" "$Gid"
function addGroup_MySQL {
	local User="$1"
}

#rmUserMySQL "$User"
function rmUserMySQL {
	local User="$1"
}

#rmUserFromGroupsMySQL "$User" 
function rmUserFromGroupsMySQL {
	local User="$1"
}

#rmGroupMySQL "$User"
function rmGroupMySQL {
	local User="$1"
}

function getNextGid {
	local MaxGID=$(cmdMySQL "SELECT gid FROM groups ORDER BY gid DESC limit 1")

	if [ -z "$MaxGID" ]
	then
		warning "No gids in group table"
		return 1
	fi

	echo $(($MaxGID + 1))
}

function getNextUid {
	local MaxUID=$(cmdMySQL "SELECT uid FROM users ORDER BY uid DESC limit 1")

	if [ -z "$MaxUID" ]
	then
		warning "No uids in users table"
		return 1
	fi

	echo $(($MaxUID + 1))
}

function addUsersToGroup {
	local Group="$1"
}


