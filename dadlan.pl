#!perl

use strict;
use warnings;

my $bf1942 = "bf1942.bat";
my $bf2 = "bf2.bat";
my $ut2004 = '"C:\Program Files (x86)\Steam\steamapps\common\Unreal Tournament 2004\System\UT2004.exe"';
my $quake3 = '"C:\Games\Quake III Arena\ioquake3.x86.exe"';
my $quake2 = 'C:\Games\Quake2\quake2.exe';
my $wc3 = '"C:\Program Files (x86)\Warcraft III\war3.exe"';
my $wc3lc = '"C:\Program Files (x86)\Warcraft III\lancraft.exe"';
my $cncrenegade = '"C:\Program Files (x86)\Steam\steamapps\common\Command & Conquer Renegade\Renegade.exe"';

system('cls');
system('color 2');

open (FILE, '<', "asciilogo.txt") or die "could not open the log file\n";
print <FILE>;
close (FILE);

sub wireguardtest {
	my $wgresult=system('ping -n 1 10.0.0.102 > NUL 2>&1');
	if($wgresult == 0) {
		printf "\nWireguard is up\n\n";
		sleep 3;
	}else{
		system('color 4');
		printf "\nWireguard is down\n\n";
		sleep 3;
		system('color 2');
		mainmenu();
	}
}

sub mainmenu {
	system('cls');
	open (FILE, '<', "asciilogo.txt") or die "could not open the log file\n";
	print <FILE>;
	close (FILE);
	print "\nType number of your choice below:\n";
	
	print "  1. Test WireGuard\n";
	print "  2. Games\n";
	print "  3. Discord\n";
	print "  4. Exit\n";
	
	my $mmchoice = <>;
	##print $mmchoice;

	if ( $mmchoice == 1) {
		print "Testing WireGuard...";
		wireguardtest();
		mainmenu();
		}
	elsif ( $mmchoice == 2) {
		print "Games List";
		gamesmenu();
		}
	elsif ( $mmchoice == 3) {
		print loaddiscord();
		mainmenu();
		}
	elsif ( $mmchoice == 4) {
		print "Exiting...";
		##echo "\033[39m\n";   ##  <----- Fix this
		system('color');
		exit;
	}
}

sub gamesmenu {
	system('cls');
	open (FILE, '<', "asciilogo.txt") or die "could not open the log file\n";
	print <FILE>;
	close (FILE);
	print "\nType number of your choice below:\n";
	
	print "  1. Battlefield 1942\n";
	print "  2. Battlefield 2\n";
	print "  3. UT2004\n";
	print "  4. Quake 3\n";
	print "  5. Quake 2\n";
	print "  6. Warcraft 3\n";
	print "  7. Warcraft 3 (Host with LANCRAFT)\n";
	print "  8. C&C Renegades\n";
	print "  9. Main Menu\n";
	
	my $gmchoice = <>;
	##print $gmchoice;
	
	if ( $gmchoice == 1) {
		print "Battlefield 1942 loading...\n";
		system ("$bf1942");
		sleep 1;
		gamesmenu();
		}
	elsif ( $gmchoice == 2) {
		print "Battlefield 2 loading...\n";
		system ("$bf2");
		sleep 1;
		gamesmenu();
		}
	elsif ( $gmchoice == 3) {
		print "UT2004 loading...\n";
		system ("$ut2004");
		sleep 1;
		gamesmenu();
		}
	elsif ( $gmchoice == 4) {
		print "Quake 3 loading...\n";
		system ("$quake3");
		sleep 1;
		gamesmenu();
		}
	elsif ( $gmchoice == 5) {
		print "Quake 2 loading...\n";
		system ("$quake2");
		sleep 1;
		gamesmenu();
		}
	elsif ( $gmchoice == 6) {
		print "Warcraft 3 loading...\n";
		system ("$wc3");
		sleep 1;
		gamesmenu();
		}
	elsif ( $gmchoice == 7) {
		print "Warcraft 3 - LANCRAFT loading...\n";
		system ("$wc3lc");
		sleep 1;
		gamesmenu();
		}
	elsif ( $gmchoice == 8) {
		print "C&C Renegades loading...\n";
		system ("$cncrenegade");
		sleep 1;
		gamesmenu();
		}
	elsif ( $gmchoice == 9) {
		print "Main menu loading...\n";
		sleep 1;
		mainmenu();
	}
}

sub loaddiscord {
	##my $discordcheck = system('powershell -command "& {tasklist | findstr \"Discord.exe\"|select-object -first 1 | ForEach-Object {$elements = $_ -split \' \';$elements[0]}}"');
	
	##if ($discordcheck ne 'Discord.exe') {
		print "Loading discord...\n";
		system ("%USERPROFILE%\\appdata\\local\\Discord\\Update.exe --processStart Discord.exe");
		sleep 10;
	}
##	elsif ($discordcheck eq 'Discord.exe') {
##		print "Discord is already running...";
	##print $discordcheck;
##	sleep 7;
	##}
	mainmenu();
##	}
##}

wireguardtest();
mainmenu();

