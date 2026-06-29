import urllib.request, json
r = urllib.request.urlopen('https://api.github.com/repos/osyotv/python-kursi/actions/runs')
run = json.loads(r.read().decode('utf-8'))['workflow_runs'][0]
status = run['status']
conclusion = run['conclusion']
print(f"Status: {status}")
print(f"Conclusion: {conclusion}")
