import urllib.request
import json
import time
import zipfile
import io
import os

print('Waiting for GitHub Action to finish...')
success = False

while True:
    try:
        req = urllib.request.Request('https://api.github.com/repos/osyotv/python-kursi/actions/runs')
        req.add_header('Accept', 'application/vnd.github.v3+json')
        r = urllib.request.urlopen(req)
        runs = json.loads(r.read().decode('utf-8'))['workflow_runs']
        run = runs[0]
        
        if run['status'] == 'completed':
            if run['conclusion'] == 'success':
                success = True
                print('Build succeeded!')
            else:
                print('Build failed on GitHub Actions!')
            break
        print(f"Status: {run['status']}, waiting 15 seconds...")
    except Exception as e:
        print(f"Error checking status: {e}")
    time.sleep(15)

if success:
    print('Downloading from nightly.link...')
    try:
        req = urllib.request.Request('https://nightly.link/osyotv/python-kursi/workflows/build/main/app-release.zip')
        req.add_header('User-Agent', 'Mozilla/5.0')
        zdata = urllib.request.urlopen(req).read()
        z = zipfile.ZipFile(io.BytesIO(zdata))
        desk = os.path.join(os.environ['USERPROFILE'], 'Desktop')
        z.extractall(desk)
        print(f'Done! Extracted APK to {desk}')
        
        # rename app-release.apk to python-kursi.apk
        old_path = os.path.join(desk, 'app-release.apk')
        new_path = os.path.join(desk, 'python-kursi.apk')
        if os.path.exists(old_path):
            if os.path.exists(new_path):
                os.remove(new_path)
            os.rename(old_path, new_path)
            print(f"Renamed to {new_path}")
            
    except Exception as e:
        print(f"Error downloading: {e}")
