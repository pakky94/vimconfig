import eyed3, logging, os, subprocess
from mutagen.flac import FLAC
from eyed3.utils.console import ProgressBar
from multiprocessing import Pool
import tqdm
# from queue import Queue
# from threading import Thread

path = "Smartphone Sync/"

outpath = "/media/data/Music/Smartphone Sync/"
playlist_file = "/home/pakky/Smartphone Sync.xspf"
lame_args = "-h -V 3"
num_threads = 3

eyed3.utils.log.setLevel(logging.ERROR)

items = []

# q = Queue()

with open(playlist_file, 'r') as f:
    for l in f:
        if "<location>" in l:
            new = l.split('>')[1].split('<')[0]
            new = new.replace("&amp;", "&")
            # print(new)
            items.append(new)
            # q.put(new)


def do_conversion(f):
    # item = q.get()
    # try:
    #     item = items.pop()
    # except Exception as e:
    #     item = None
    # while item is not None:
    # f = item
    if os.path.exists(f):
        # print(f)
        target_file = f.split("/")[-1]
        tags = FLAC(f)
        album_artits = ""
        if "albumartist" in tags:
            album_artits = tags["albumartist"][0]
        else:
            album_artits = tags["artist"][0]
        if album_artits != "" and "artist" in tags:
            album = tags["album"][0]
            album = album.replace('*', ' ')
            album_artits = album_artits.replace('*', ' ')
            if not os.path.exists(outpath + album_artits):
                try:
                    os.makedirs(outpath + album_artits)
                except Exception as e:
                    pass
            if not os.path.exists(outpath + album_artits + "/" + album):
                try:
                    os.makedirs(outpath + album_artits + "/" + album)
                except Exception as e:
                    pass
            out_file = outpath + album_artits + "/" + album + "/" + target_file.replace(".flac", ".mp3")
            # print(out_file)
            if not os.path.exists(out_file):
                # os.system('flac -cd -F "' + f + '" | lame ' + lame_args + ' - "' + out_file + '"')
                os.system('ffmpeg -loglevel panic -vn -n -i "' + f +
                          '" -c:a libmp3lame -q:a 3 -ar 44100 ' +
                          '-map_metadata 0 -id3v2_version 3 -write_id3v1 1 "' +
                          out_file + '"')
                # os.system('ffmpeg -i "' + f + '" -a 160k')
            else:
                print("skipping " + out_file)
    # item = q.get()
        # try:
        #     item = items.pop()
        # except Exception as e:
        #     item = None

if __name__ == "__main__":
    pool = Pool(processes=num_threads)
    for _ in tqdm.tqdm(pool.imap_unordered(do_conversion, items), total=len(items)):
        pass
    pool.close()
    pool.join()

# with ProgressBar(len(items)) as bar:
#     for i in range(num_threads):
#         worker = Thread(target=do_conversion, args=(bar, q))
#         worker.setDaemon(True)
#         worker.start()

# q.join()

count = 0
# for f in os.listdir(path):
# items = os.listdir(path)
def linear():
    with ProgressBar(len(items)) as bar:
        for f in items:
            bar.update()
            if os.path.exists(f):
                target_file = f.split("/")[-1]
                tags = FLAC(f)
                album_artits = ""
                if "albumartist" in tags:
                    album_artits = tags["albumartist"][0]
                else:
                    album_artits = tags["artist"][0]
                if album_artits != "" and "artist" in tags:
                    album = tags["album"][0]
                    if not os.path.exists(outpath + album_artits):
                        os.makedirs(outpath + album_artits)
                    if not os.path.exists(outpath + album_artits + "/" + album):
                        os.makedirs(outpath + album_artits + "/" + album)
                    out_file = outpath + album_artits + "/" + album + "/" + target_file.replace(".flac", ".mp3")
                    # print(out_file)
                    if not os.path.exists(out_file):
                        os.system('flac -cd -F "' + f + '" | lame -b 160 - "' + out_file + '"')
                    else:
                        print("skipping " + out_file)

                # subprocess.run(["lame"] + lame_args + [f, outpath])
                count += 1
            else:
                print("err:  " + f)

print(count)
