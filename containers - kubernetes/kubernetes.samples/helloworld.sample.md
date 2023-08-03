Full example for an helloworld program

```yaml
# Namespace creation
# >   kubectl delete namespace ben
apiVersion: v1
kind: Namespace
metadata:
  name: ben

---
# Deployment creation
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world-http                  # deployment name
  labels:
    run: hello-http                       # startup label
  namespace: ben
spec:
  replicas: 2
  selector:
    matchLabels:
      run: hello-http
  strategy: {}
  template:
    metadata:
      labels:
        run: hello-http                   # definition of the pod name to start
    spec:
      containers:
      - image: andreabenini/hello.tests   # Image Name
        name: hello-python-test           # Pod Name
        resources: {}
        ports:
        - containerPort: 7070

---
# Service
apiVersion: v1
kind: Service
metadata:
  name: hello-http-service
  namespace: ben
  labels:
    run: hello-http
spec:
  selector:
    run: hello-http
  ports:
  - protocol: TCP
    port: 7070
    targetPort: 7070

---
# Ingress
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: hello-http-ingress
  namespace: ben
spec:
  rules:
    - host: publicname.my.host      # host: [optional], http: [mandatory]
      http:
        paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: hello-http-service
              port: 
                number: 7070
```
