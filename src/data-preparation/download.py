import requests
import os

print('Downloading raw data... please wait.')

data = requests.get('https://uvt-public.s3.eu-central-1.amazonaws.com/data/rsm2020/team12_live-concert-in-videogame.zip')

print('Writing raw data to file')

os.makedirs('../../data', exist_ok=True)

f = open('../../data/fortniteconcert.zip', 'wb')

f.write(data.content)

f.close()

print('Done.')