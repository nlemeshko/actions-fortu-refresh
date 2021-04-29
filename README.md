# Refresh app v2 for Rancher

# Info:

Sometimes after push to helm repo, Ranсher doesn't see the change right away. Need time fot it.
This module pull json from repo and wait when chart found.

# Requements

- token
- chart
- version

# Example

```sh
- name: Refresh token
  uses: nlemeshko/actions-fortu-refresh@v1.2
  with:
    chart: "testchart"
    version: "0.0.1"
    token: "https://token:f5dds@rancher.com"
```

### [Nicky Lemeshko](https://mdsn.tk) (c) 2021