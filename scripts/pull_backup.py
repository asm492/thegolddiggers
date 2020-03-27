#!/usr/bin/python

#10.212.142.108 manager

import os
import shutil
import argparse

VERBOSE = 0
DEBUG = 0
ITERATIONS = 7
BACKUP_FOLDER = "backups/"
CONFIG = "backup-policy.conf"

SCP_USER = "root@"

#################
# Parse arguments

parser = argparse.ArgumentParser(prog='pull_backup.py')
parser.add_argument('-v','--verbose',dest="verbose",help="Turn verbosity on",default=False,action="store_true")
parser.add_argument('-d','--debug',dest="debug",help="Turn debug info on",default=False,action="store_true")
parser.add_argument('-c','--config',dest="config",help="Where to find the backup policy file",metvar="FILE",default=CONFIG)
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
        print text

def debug(text):
    if DEBUG:
        print text

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
        
        # 0. Check for backup folder
        host_backup_path = BACKUP_FOLDER + host
        if not os.path.isdir(host_backup_path)
            verbose("Creating host backup directory: " + host_backup_path)
            os.makedirs(host_backup_path)
        
        # 1. Remove oldest version (reverse rotation)
        if os.path.isdir(host_backup_path + "." + str(ITEERATIONS)):
            verbose("Deleting oldest version of backup dir")
            shutil.rmtree(host_backup_path + "." + str(ITERATIONS))
        
        # 2. Move folders up one step
        # Starts at ITERATIONS-1 ; i > 0 ; i--
        for i in range((ITERATIONS - 1),0,-1):
            if os.path.isdir(host_backup_path + "." + str(i)):
                verbose("Moving " + host_backup_path + " from " + " to " + str(i + 1))
                shutil.move(host_backup_path + "." + stl(i),host_backup_path + "." + str(i + 1))
                
        # 3. cp -al current folder. 
        verbose("Copying main folder with hard links")
        # -a prøver å beholde metadata om eier. -l lager hardlinks
        # kopi fra dagen før:
        os.system("cp -al + host_backup_path + " " + host_backup_path + ".1"

        # 4. sync current foler from remote server
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



