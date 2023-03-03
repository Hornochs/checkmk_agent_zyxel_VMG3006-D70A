# checkmk_agent_zyxel_VMG3006-D70A
Check_MK Agent for VDSL 2 Modem

Still in Progress. After activating the Developer Mode and SSH I was able to put the files on the Modem. Problem is, /etc/ isn't persistent after a reboot which means xinetd won't answer correctly. I'm trying to find a way :) 

Check_Mk_Agent is provided by https://github.com/macaty/check_mk

But I added some lines of code to run local checks on this Agent
