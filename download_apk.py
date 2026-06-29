import urllib.request, zipfile, io, os

DESKTOP = os.path.expanduser("~\\Desktop")
run_id = "28379885890"
nightly_url = f"https://nightly.link/osyotv/python-kursi/actions/runs/{run_id}/app-release.zip"

print(f"Downloading APK from nightly.link...")
print(f"URL: {nightly_url}")

try:
    resp = urllib.request.urlopen(nightly_url)
    data = resp.read()
    print(f"Downloaded {len(data)} bytes")
    
    zip_data = io.BytesIO(data)
    with zipfile.ZipFile(zip_data) as z:
        print(f"Files in zip: {z.namelist()}")
        z.extractall(DESKTOP)
    
    apk_path = os.path.join(DESKTOP, "app-release.apk")
    new_path = os.path.join(DESKTOP, "python-kursi.apk")
    if os.path.exists(new_path):
        os.remove(new_path)
    if os.path.exists(apk_path):
        os.rename(apk_path, new_path)
        size_mb = os.path.getsize(new_path) / (1024*1024)
        print(f"\nSUCCESS! APK saved to Desktop!")
        print(f"File: {new_path}")
        print(f"Size: {size_mb:.1f} MB")
    else:
        print("APK file not found in zip!")
        for f in os.listdir(DESKTOP):
            if f.endswith('.apk'):
                print(f"  Found: {f}")
except Exception as e:
    print(f"Error: {e}")
    print(f"\nManual download: https://github.com/osyotv/python-kursi/actions/runs/{run_id}")
    print("  -> Pastga scrolling qilib 'Artifacts' bo'limidagi 'app-release' tugmasini bosing")
