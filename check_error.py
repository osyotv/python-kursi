import urllib.request
import json

r = urllib.request.urlopen('https://api.github.com/repos/osyotv/python-kursi/actions/runs')
runs = json.loads(r.read().decode('utf-8'))['workflow_runs']
run = runs[0]
print(f"Run: {run['name']} - {run['conclusion']}")

run_id = run['id']
r2 = urllib.request.urlopen(f'https://api.github.com/repos/osyotv/python-kursi/actions/runs/{run_id}/jobs')
jobs = json.loads(r2.read().decode('utf-8'))['jobs']

for s in jobs[0]['steps']:
    print(f"  {s['name']}: {s['conclusion']}")
