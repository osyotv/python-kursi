import urllib.request, json

r = urllib.request.urlopen('https://api.github.com/repos/osyotv/python-kursi/actions/runs')
runs = json.loads(r.read().decode('utf-8'))['workflow_runs']
run = runs[0]
run_id = run['id']

r2 = urllib.request.urlopen(f'https://api.github.com/repos/osyotv/python-kursi/actions/runs/{run_id}/jobs')
jobs = json.loads(r2.read().decode('utf-8'))['jobs']
job_id = jobs[0]['id']

# Try to get raw logs (requires auth but let's try)
print(f"Job URL: https://github.com/osyotv/python-kursi/actions/runs/{run_id}/job/{job_id}")
print(f"Run ID: {run_id}")
print(f"Job ID: {job_id}")

# Try to get log download URL
try:
    r3 = urllib.request.urlopen(f'https://api.github.com/repos/osyotv/python-kursi/actions/runs/{run_id}/logs')
    print(f"Logs URL: {r3.geturl()}")
except Exception as e:
    print(f"Cannot get logs (needs auth): {e}")
