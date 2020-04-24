#!/usr/bin/python3
import os
import shutil
import argparse

VERBOSE = 0
DEBUG = 0
ITERATIONS = 7
BACKUP_FOLDER = "/home/ubuntu/backups/"
CONFIG = "/home/ubuntu/backup-policy.conf"

SCP_USER = "ubuntu@"

#################
# Parse arguments

parser = argparse.ArgumentParser(prog='pull_backup.py')
parser.add_argument('-v','--verbose',dest="verbose",help="Turn verbosity on",default=False,action="store_true")
parser.add_argument('-d','--debug',dest="debug",help="Turn debug info on",default=False,action="store_true")
parser.add_argument('-c','--config',dest="config",help="Where to find the backup policy file",metavar="FILE",default=CONFIG)
parser.add_argument('-i','--iterations',dest="iterations",type=int,help="How many iterations of the backup folders?",metavar="N",default=ITERATIONS)
parser.add_argument('-b',"--backup_directory",dest="backup_dir",help="Where to put the backup files",metavar="FOLDER",default=BACKUP_FOLDER)

arguments = parser.parse_args()

VERBOSE = arguments.verbose
DEBUG = arguments.debug
ITERATIONS = arguments.iterations
BACKUP_FOLDER = arguments.backup_dir
#caster til string
CONFIG = str(arguments.config)

##########

def verbose(text):
    if VERBOSE:
        print(text)

def debug(text):
    if DEBUG:
        print(text)

verbose("Verbose is enabled")
debug("Debug is enabled")

verbose("Opening config file: " + CONFIG)
with open(CONFIG) as config:
    for line in config:
        debug("Read line: " + line)
        configlist = line.split(":")
        pathlist = configlist[1].split(",")
        host = configlist[0]
        verbose("Host is: " + host)


	# 0. Kaller shellscript for å sjekke/starte serverne
	from subprocess import call
	rc = call("~/thegolddiggers/scripts/checkonline.sh")

        # 1. Check for backup folder
        host_backup_path = BACKUP_FOLDER + host
        if not os.path.isdir(host_backup_path):
            verbose("Creating host backup directory: " + host_backup_path)
            os.makedirs(host_backup_path)
        
        # 2. Remove oldest version (reverse rotation)
        if os.path.isdir(host_backup_path + "." + str(ITERATIONS)):
            verbose("Deleting oldest version of backup dir")
            shutil.rmtree(host_backup_path + "." + str(ITERATIONS))
        
        # 3. Move folders up one step
        # Starts at ITERATIONS-1 ; i > 0 ; i--
        for i in range((ITERATIONS - 1),0,-1):
            if os.path.isdir(host_backup_path + "." + str(i)):
                verbose("Moving " + host_backup_path + " from " + " to " + str(i + 1))
                shutil.move(host_backup_path + "." + str(i),host_backup_path + "." + str(i + 1))
                
        # 4. cp -al current folder. 
        verbose("Copying main folder with hard links")
        # -a prøver å beholde metadata om eier. -l lager hardlinks
        # kopi fra dagen før:
        os.system("cp -alr " + host_backup_path + " " + host_backup_path + ".1")
        # 5. sync current foler from remote server
        verbose("Synchronizing folders")
        for folder in pathlist:
        
            #vasker streng for usnynlige tegn feks \n
            folder = folder.rstrip()
            verbose("-> " + folder)
            if not os.path.isdir(host_backup_path + folder):
                os.makedirs(host_backup_path + folder)
                
            verbose_rsync = ""
            if VERBOSE:
                verbose_rsync = "v"
                
            command = "rsync -a" + verbose_rsync + " --delete " + SCP_USER + host + ":" + folder + " " + host_backup_path + folder
            debug("Running: " + command)
            os.system(command)
