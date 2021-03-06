#!/usr/bin/env python
# wol.py

import socket
import struct

def wake_on_lan(macaddress):
    """ Switches on remote computers using WOL. """

    # Check macaddress format and try to compensate.
    if len(macaddress) == 12:
        pass
    elif len(macaddress) == 12 + 5:
        sep = macaddress[2]
        macaddress = macaddress.replace(sep, '')
    else:
        raise ValueError('Incorrect MAC address format')
 
    # Pad the synchronization stream.
    data = ''.join(['FFFFFFFFFFFF', macaddress * 20])
    send_data = '' 

    # Split up the hex values and pack.
    for i in range(0, len(data), 2):
        send_data = ''.join([send_data,
                             struct.pack('B', int(data[i: i + 2], 16))])

    # Broadcast it to the LAN.
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    sock.sendto(send_data, ('<broadcast>', 7))
    

if __name__ == '__main__':
    wake_on_lan( '20:CF:30:4F:F3:D0' ) # badboy
    wake_on_lan( '00:16:cb:f6:55:86' )
    wake_on_lan( '00:0A:95:CB:8E:66' )
    wake_on_lan( '00:01:29:D7:B4:D4' ) # mediapc
    wake_on_lan( '00:40:F4:CE:5D:4E' )
    wake_on_lan( '00:11:24:89:79:52' )
    wake_on_lan( '00:16:CB:C8:E7:52' )
    # Use macaddresses with any seperators.
    wake_on_lan('0F:0F:DF:0F:BF:EF')
    wake_on_lan('0F-0F-DF-0F-BF-EF')
    # or without any seperators.
    wake_on_lan('0F0FDF0FBFEF')
