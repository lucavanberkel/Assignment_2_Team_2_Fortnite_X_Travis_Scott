import json

f = open('../../gen/data-preparation/temp/tweets_about_live_concert_in_videogame.json','r', encoding='utf-8')

con = f.readlines()

outfile = open('../../gen/data-preparation/temp/parsed-data.csv', 'w', encoding = 'utf-8')
outfile.write('tweet_count\tcreated_at\ttext\n')


cnt = 0
for line in con:
    if (len(line)<=5): continue

    cnt+=1
    obj = json.loads(line.replace('\n',''))

    text = obj.get('text')
    text = text.replace('\t', '').replace('\n', '')

    outfile.write(str(cnt)+'\t'+obj.get('created_at')+'\t'+text+'\n')


outfile1 = open('../../gen/data-preparation/temp/parsed-data-before.csv', 'w', encoding = 'utf-8')
outfile1.write('tweet_count\tcreated_at\ttext\n')


cnt = 0
for line in con:
    if (len(line)<=5): continue

    cnt+=1
    obj = json.loads(line.replace('\n',''))

    text = obj.get('text')
    text = text.replace('\t', '').replace('\n', '')

    outfile1.write(str(cnt)+'\t'+obj.get('created_at')+'\t'+text+'\n')
    if (cnt>406): break


outfile2 = open('../../gen/data-preparation/temp/parsed-data-during.csv', 'w', encoding = 'utf-8')
outfile2.write('tweet_count\tcreated_at\ttext\n')


count = 0
for line in con:
    if (len(line)<=5): continue

    count+=1
    if (count<406): continue
    obj = json.loads(line.replace('\n',''))

    text = obj.get('text')
    text = text.replace('\t', '').replace('\n', '')

    outfile2.write(str(count)+'\t'+obj.get('created_at')+'\t'+text+'\n')
    if (count>825): break
 
outfile3 = open('../../gen/data-preparation/temp/parsed-data-after.csv', 'w', encoding = 'utf-8')
outfile3.write('tweet_count\tcreated_at\ttext\n')


count = 0
for line in con:
    if (len(line)<=5): continue

    count+=1
    if (count<825): continue
    obj = json.loads(line.replace('\n',''))

    text = obj.get('text')
    text = text.replace('\t', '').replace('\n', '')

    outfile3.write(str(count)+'\t'+obj.get('created_at')+'\t'+text+'\n')

print('done.')
