#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
newwol.py

Wake On Lan my Server and Decrypt disk.
"""
import os
import sys
import socket
import paramiko
from getpass import getpass
from optparse import OptionParser
from portscan import scan
from time import sleep
from subprocess import Popen, PIPE

## Variable
#
PROG_NAME = sys.argv[0]

KIDIC = {'host': 'localhost',
         'ip' : '192.168.1.123',
         'port': 12316,
         'user': 't1',
         'mac': '00:01:80:61:d8:47'}

RODIC = {'host': 'taka16.no-ip.info',
         'port': 12316,
         'user': 'root',
         'pingcheckcmd': 'ping -c 1 ' + KIDIC['ip'] + ' | grep "bytes from"',
         'wolcmd': '/usr/sbin/wol -i 192.168.1.255' +' '+ KIDIC['mac'],
         'max_ping': 30}

OPEN_PORT = [12317, 12318, 12319]
CLOSE_PORT = [12313, 12314, 12315]
WAIT_TIME = 40
DECRYPT_CMD = 'sudo cryptsetup luksOpen /dev/mapper/VG-data data_crypt'
MOUNT_CMD = 'sudo mount /dev/mapper/data_crypt /data'
PORTMAP = {}
PRINTFORMAT = '[ %-14s ]  %s'

if sys.platform == 'win32':
    DRIVE = os.path.abspath(__file__).split('\\')[0]
    KAGI = DRIVE+'\\Security\\Password\\kagi\\kagi.ppk'
    PAGEANT_PATH = DRIVE+'\\Internet\\putty\\PAGEANT.EXE'
    PAGEANT_KAGI_PATH = PAGEANT_PATH +' '+ KAGI
    PORT_FORWARD_CMD = [DRIVE+'\\Internet\\portforwarder\\PortForwarder.exe', '-N', 'tunnel']
    NETSTAT_CMD = ['netstat', '-an']
else:
    KAGI = os.path.expanduser('~/.ssh/kagi')
    NETSTAT_CMD = ['netstat', '-ltn']
    PORT_FORWARD_CMD = ['ssh', '-f', '-N', '-i', KAGI, '-p', str(RODIC['port']),
                        '-L', '12316:'+ KIDIC['ip'] +':'+ str(KIDIC['port']),
                        RODIC['user'] +'@'+ RODIC['host']]
##

def parsersetup():
    """Get options

    """
    usage = 'Usage: ' + PROG_NAME + '[options]'
    parser = OptionParser(usage)
    parser.add_option(
        '-v', '--verbose',
        action='store_true',
        default=False,
        dest='verbose',
        help='verbose mode')
    parser.add_option(
        "-y", "--yes",
        action="store_true",
        default=False,
        dest="yes",
        help="answer yes confirm")

    return parser

def check_and_open_port(host, port, verbose=False):
    """Check and open port.

    Check scan port. Send knock packet if not open port.
    Arguments:
    - `host`: hostname my server
    - `port`: rook's port for portforward. will open and close.
    - `portmap`: result scan to dictionary variable
    """
    print '***** Scanning Ports'
    print PRINTFORMAT % ('Scan Host', host)
    global PORTMAP
    # check rook port
    i = 0
    for i in range(1, 4):
        PORTMAP = scan2map(host, port, PORTMAP, verbose=verbose)
        if PORTMAP[port]:
            openmessage = 'OPENED!!'
            if 0 == i:
                openmessage = 'Already ' + openmessage
            print PRINTFORMAT % ('Port: '+str(port), openmessage)
            break
        else:
            print PRINTFORMAT % ('Port: '+str(port), 'Did not open')
            print PRINTFORMAT % ('Knock', 'Try open port!!')
            knocking(host, OPEN_PORT, verbose=verbose)
            sleep(1.5) # wait open port
    if 3 == i:
        sys.exit(PRINTFORMAT % ('ERROR', 'Could not open port!!'))

def scan2map(host, port, portmap, verbose=False):
    """Scan port. Then result to dictonary variable.

    Arguments:
    - `host`: hostname
    - `port`: scan port
    - `portmap`: dictionary
    """
    portmap[port] = scan(host, port, verbose=verbose)
    return portmap

def knocking(host, portlist, verbose=False):
    """Knock port.

    Send SYN packet from portlist for knocking port.
    Arguments:
    - `host`: hostname
    - `port`: scan port
    """
    for port in portlist:
        scan(host, port, verbose)
        if verbose:
            print PRINTFORMAT % ('Knocking', str(port))

def constraction_agent(verbose=False):
    """Constraction ssh key agent.

    If not have key or not exist agent process, Launch agent and set ssh key.
    On Windows and Linux.
    """
    print '\n***** SSH Agent'
    i = 0
    for i in range(2):
        agent = paramiko.Agent()
        if 0 == len(agent.get_keys()):
            print PRINTFORMAT % ('Check has keys', 'Not has keys!!')
            passwd = getpass('Enter private key password: ')
            if sys.platform == 'win32':
                if verbose:
                    print PRINTFORMAT % ('Exec', 'PAGEANT.EXE')
                if not __debug__: print PAGEANT_KAGI_PATH
                from pywinauto import application
                app = application.Application().start_(PAGEANT_KAGI_PATH)
                dialog = app[u'Pageant: Enter Passphrase']
                dialog.Edit1.SetText(passwd)
                dialog.Button1.Click()
            else:
                import pexpect
                ssh_add_cmd = 'ssh-add %s' % KAGI
                if verbose:
                    print PRINTFORMAT % ('Exec', '# ' + ssh_add_cmd)
                cmd = pexpect.spawn(ssh_add_cmd)
                sleep(1)
                cmd.sendline(passwd)
                # if not __debug__: print pret
                sleep(1)
                cmd.close()
            if not __debug__: print len(agent.get_keys())
        else:
            if 0 == i:
                print PRINTFORMAT % ('Check has keys', 'Already has keys.')
            else:
                print PRINTFORMAT % ('Check has keys', 'Has keys.')
            break
    if i >= 2:
        sys.exit(PRINTFORMAT % ('ERROR', 'Could not add a key.'))

def get_paramiko_instance():
    """Return paramiko instance.

    """
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    return ssh

def get_ssh_conection(ssh, host, port, user, agent=True):
    """Get ssh connection through paramiko.

    Get ssh connection through paramiko. And return instance.
    Arguments:
    - `ssh`: instance.
    - `host`: hostname of ssh connection.
    - `port`: ssh port.
    - `user`: ssh username.
    - `agent`: True or False use agent. Default "True".
    """
    try:
        ssh.connect(host, port=port, username=user, allow_agent=agent)
        print '\n***** SSH login %s(%s)' % (host, socket.gethostbyname(host))
        if not __debug__:
            print 'SSH connect:', user +'@'+ host +':'+ str(port)
    except socket.error:
        print 'Error Connection SSH', user +'@'+ host +':'+ str(port)
    return ssh

def wol(ssh, ipnum, verbose=False):
    """Wake On Lan.

    Arguments:
    - `ssh`: instance
    - `ipnum`: ki ip
    """
    if chk_ping(ssh, ipnum, verbose):
        print PRINTFORMAT % (ipnum , 'DOWN')
        wol_command(ssh, verbose) # Send WOL packet
    else:
        print PRINTFORMAT % (ipnum , 'ACTIVE')

def chk_ping(ssh, ipnum, verbose=False):
    """check responce from server by ping status

    ex.. ping -c 1 192.168.1.123 | grep "bytes form"
    Arguments:
    - `ssh`: instance
    - `ipnum`: ping ip
    """
    try:
        cmd = 'ping -w 1 -c 1 ' + ipnum + ' | grep "bytes from"'
        if verbose:
            print PRINTFORMAT % ('Exec', '# ' + cmd.split('|')[0])
        status = stdin = stdout = stderr = None
        stdin, stdout, stderr = ssh.exec_command(cmd)
        chan = stdout.channel
        status = chan.recv_exit_status()
        if not __debug__:
            print PRINTFORMAT % ('Exec', '# ' + cmd)
            print PRINTFORMAT % ('Exit status', status)
        return status
    except paramiko.SSHException:
        print PRINTFORMAT % ('ERROR', cmd)
        print 'EXIT CONNECTION'
        ssh.close()
        sys.exit(1)

def wol_command(ssh, verbose=False):
    """Wake On Lan command.

    """
    from sleep_progress import sleep_progress
    print PRINTFORMAT % ('Wake On Lan', 'Sending Packet...')
    if verbose:
        print PRINTFORMAT % ('Exec', RODIC['wolcmd'])
    ssh.exec_command(RODIC["wolcmd"])
    sleep_progress(WAIT_TIME, PRINTFORMAT % ('Waiting Wakeup', '%-2d secunds'))
    wait_ping(ssh, RODIC['max_ping'], verbose)

def wait_ping(ssh, maxping=15, verbose=False):
    """Wait ping responce from server for active.

    Arguments:
    - `ssh`: instance
    - `maxping`: execute time of ping
    """
    i = 0
    for i in range(1, maxping + 1):
        pingcount = 'Still DOWN ping {0}/{1}'.format(i, maxping)
        flushprint = '\r' + PRINTFORMAT % (KIDIC['ip'], pingcount)
        sys.stdout.write(flushprint)
        sys.stdout.flush()
        stdin = stdout = stderr = None
        stdin, stdout, stderr = ssh.exec_command(RODIC['pingcheckcmd'])
        channel = stdout.channel
        status = channel.recv_exit_status()
        if verbose or not __debug__:
            print RODIC['user'] +'@ro:# %s' % RODIC['pingcheckcmd']
            stdoutread = stdout.read().strip()
            stderread = stderr.read().strip()
            print 'status: %d \n\n%s\n%s' % (status, stdoutread, stderread)
        if 0 == status:
            sleep(5)
            flushprint = '\n' + PRINTFORMAT % (KIDIC['ip'], 'UP!!\n')
            sys.stdout.write(flushprint)
            sys.stdout.flush()
            break

    if i >= maxping:
        print '\n'
        ssh.close()
        sys.exit(PRINTFORMAT % ('ERROR', KIDIC['ip']+' no responce'))

def confirm(prompt=None):
    """Yes No prompt.

    """
    if prompt is None:
        prompt = 'Confirm'
    prompt = '%s "y" or "n": ' % (prompt)
    yes = ['y', 'Y', 'yes', 'YES']
    nop = ['n', 'N', 'no', 'NO']
    yesnop = yes + nop
    while True:
        ans = raw_input(prompt)
        if not ans or ans not in yesnop:
            print "Set input " + ", ".join(yesnop)
            continue
        if ans in yes:
            return True
        if ans in nop:
            return False

def decrypt(ssh, verbose):
    """Decrypt disk.


    """
    if check_cryptdisk(ssh, verbose):
        print PRINTFORMAT % ('Check Disk', 'NOT decrypted.')
        if not opt.yes:
            if not confirm('Decrypt disk?'):
                sys.exit(0)
        chan = ssh.get_transport().open_session()
        chan.get_pty()
        if not __debug__: print PRINTFORMAT % ('Exec', DECRYPT_CMD)
        chan.exec_command(DECRYPT_CMD)
        error_count = 0
        while True:
            sleep(2)
            recv = chan.recv(1024)
            sleep(1)
            if '[sudo] password for' in recv:
                sudopasswd = getpass(recv)
                chan.send(sudopasswd + '\n')
                continue
            elif 'sudo: 3 incorrect password attempts' in recv:
                sys.exit(PRINTFORMAT % ('ERROR', recv))
            elif 'Enter passphrase for' in recv:
                chan.send(getpass(recv) + '\n')
            elif 'No key available with this passphrase.' in recv:
                error_count += 1
                if 3 == error_count:
                    sys.exit(recv)
                chan.send(getpass(recv) + '\n')
            elif '\r\n' == recv:
                break

        if 0 == check_cryptdisk(ssh, verbose):
            print PRINTFORMAT % ('Cryptsetup', 'Decrypted OK !!')
            chan = ssh.get_transport().open_session()
            chan.get_pty()
            chan.exec_command(MOUNT_CMD)
            recv = chan.recv(1024)
            sleep(2)
            if '[sudo] password for' in recv:
                chan.send(sudopasswd + '\n')
                sleep(1)
                del sudopasswd
                print PRINTFORMAT % ('/data', 'Mounted !!')
        else:
            print PRINTFORMAT % ('ERROR', 'NOT Decrypted !!')
            print "recv: " +recv
    else:
        print PRINTFORMAT % ('Cryptseup', 'Aleady Decrypted!!')

def constract_portforward():
    """Constract portforwarder

    """
    print "\n***** PortForward"
    i = 0
    for i in range(2):
        if not checkportforward():
            if not __debug__: print PRINTFORMAT % ('Exec', PORT_FORWARD_CMD)
            Popen(PORT_FORWARD_CMD)
            sleep(5)
            print PRINTFORMAT % ('PortForwarder', 'Launched!!')
        else:
            print PRINTFORMAT % ('PortForwarder', 'Exists OK')
            break
    if i >= 2:
        sys.exit('Could not get portforwarding!!')

def checkportforward():
    """Check exist portforwarding.

    """
    netstat = Popen(NETSTAT_CMD, stdout=PIPE)
    if '127.0.0.1:12316' in netstat.stdout.read():
        return True
    else:
        return False

def check_cryptdisk(ssh, verbose=False):
    """Check disk decrypt.

    Arguments:
    - `ssh`: instance
    """
    cmd = 'test -b /dev/mapper/data_crypt'
    status = stdin = stdout = stderr = None
    if verbose:
        print PRINTFORMAT % ('Check Disk', cmd)
    stdin, stdout, stderr = ssh.exec_command(cmd)
    channel = stdout.channel
    status = channel.recv_exit_status()
    return status

def main():
    """Main Function.

    """

    # check and open port.
    check_and_open_port(RODIC['host'], RODIC['port'], verbose=opt.verbose)

    # check agent and constract.
    constraction_agent(opt.verbose)

    # get ssh instance and wol command
    ssh = get_paramiko_instance()
    ssh = get_ssh_conection(ssh, RODIC['host'], RODIC['port'], RODIC['user'])
    wol(ssh, KIDIC['ip'], opt.verbose)
    ssh.close()

    # decrypt disk
    constract_portforward()
    ssh = get_ssh_conection(ssh, KIDIC['host'], KIDIC['port'], KIDIC['user'])
    decrypt(ssh, opt.verbose)
    ssh.close()


if __name__ == '__main__':
    # get options
    global opt
    parser = parsersetup()
    (opt, args) = parser.parse_args()
    main()
