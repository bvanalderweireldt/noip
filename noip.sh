#!/bin/bash
#
# noip - Update your no-ip hostname ip using a shell script
#
# REQUIREMENTS: dig and curl.
#
# From perf-tools: https://github.com/b.vanalderweireldt/noip
# 
# COPYRIGHT: Copyright (c) 2014 Benoit Vanalderweireldt.
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#
#  (http://www.gnu.org/copyleft/gpl.html)
#
# 20-Nov-2014   Benoit Vanaladerweireldt   Created this.


LOGIN="yourlogin@domain.com"
PASSWORD="yourpassword"
HOSTNAME="yourhostname"
PUBLIC_IP=`curl -s http://ipecho.net/plain`
NOIP_IP=`dig -t A +short $HOSTNAME`

if [ $PUBLIC_IP !=  $NOIP_IP ]
        then
                echo -e "Your server has a new public IP : $PUBLIC_IP."
                echo -e "sending the request to update the ip for $HOSTNAME."

                UPDATE_IP=`curl -s -A "BashAutoUpdate/0.1 $LOGIN" --user "$LOGIN:$PASSWORD" "http://dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME&myip=$PUBLIC_IP"`
                if [[  $UPDATE_IP =~ ^good[[:space:]]([0-9]{1,3}\.){3}[0-9]{1,3} ]]
                        then
                                echo -e "Congratulation your ip have been updated correctly !"
                        else
                                echo -e "Something went wrong, your ip is still $NOIP_IP"
                fi
fi
