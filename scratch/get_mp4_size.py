import urllib.request
import struct

def get_mp4_dimensions(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req) as response:
        data = response.read()
    
    idx = data.find(b'tkhd')
    if idx == -1:
        return None
    
    version = data[idx + 4]
    if version == 0:
        w_offset = idx + 80
    else:
        w_offset = idx + 92
        
    width_fp = struct.unpack('>I', data[w_offset:w_offset+4])[0]
    height_fp = struct.unpack('>I', data[w_offset+4:w_offset+8])[0]
    
    width = width_fp >> 16
    height = height_fp >> 16
    return width, height

url = 'https://ai-videogenerator.sfo3.cdn.digitaloceanspaces.com/files/videos/709be36f7bdb.mp4'
try:
    dims = get_mp4_dimensions(url)
    print(f'Dimensions: {dims}')
except Exception as e:
    print(f'Error: {e}')
