import telnetlib

host = 'na-robot.ddns.net'
port = 8050

def attach(ue, cell):
    conn = telnetlib.Telnet(host, port)
    conn.write(b'attach ue=' + str(ue).encode() + b' cell=' + str(cell).encode())
    response = conn.read_all().decode()
    conn.close()
    return response

def detach(ue):
    conn = telnetlib.Telnet(host, port)
    conn.write(b'detach ue=' + str(ue).encode())
    response = conn.read_all().decode()
    conn.close()
    return response

def trf_data_start(ue, mbps, bearer, trf_id):
    conn = telnetlib.Telnet(host, port)
    conn.write(b'trf_data_start ue=' + str(ue).encode() + b' mbps=' + str(mbps).encode() + b' bearer=' + str(bearer).encode() + b' trf_id=' + str(trf_id).encode())
    response = conn.read_all().decode()
    conn.close()
    return response

def trf_data_stop(ue, bearer, trf_id):
    conn = telnetlib.Telnet(host, port)
    conn.write(b'trf_data_stop ue=' + str(ue).encode() + b' bearer=' + str(bearer).encode() + b' trf_id=' + str(trf_id).encode())
    response = conn.read_all().decode()
    conn.close()
    return response

def show_traffic(ue, bearer, trf_id):
    conn = telnetlib.Telnet(host, port)
    conn.write(b'show_traffic ue=' + str(ue).encode() + b' bearer=' + str(bearer).encode() + b' trf_id=' + str(trf_id).encode())
    response = conn.read_all().decode()
    conn.close()
    return response