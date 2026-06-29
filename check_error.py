import urllib.request, json

r = urllib.request.urlopen('https://api.github.com/repos/osyotv/python-kursi/actions/runs')
runs = json.loads(r.read().decode('utf-8'))['workflow_runs']
run = runs[0]
run_id = run['id']

r2 = urllib.request.urlopen(f'https://api.github.com/repos/osyotv/python-kursi/actions/runs/{run_id}/jobs')
jobs = json.loads(r2.read().decode('utf-8'))['jobs']
job = jobs[0]

print("Steps:")
for s in job['steps']:
    print(f"  {s['name']}: {s['conclusion']}")

# Get annotations (error messages)
r3 = urllib.request.urlopen(f'https://api.github.com/repos/osyotv/python-kursi/check-runs/{job["id"]}/annotations')
annotations = json.loads(r3.read().decode('utf-8'))
print("\nAnnotations (errors):")
for a in annotations:
    print(f"  {a.get('annotation_level')}: {a.get('message', '')[:500]}")
