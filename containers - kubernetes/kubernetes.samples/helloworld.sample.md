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

Another sample
```yaml
# nginx-hello-world.yaml

# Configmap for the hello world sample
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-index-html
  namespace: temp
data:
  index.html: |
    <!DOCTYPE html>
    <html>
    <head>
    <title>Hello World</title>
    </head>
    <body>
    <h1>Hello World</h1>
    <p>Service proudly exposed by your favorite cluster</p>
    </body>
    </html>
---

# Creates and manages the Nginx pod, replicaset:1, port:80
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world-nginx
  namespace: temp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello-world
  template:
    metadata:
      annotations:
        checksum/config: "v4"
      labels:
        app: hello-world
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
        # This 'resources' block is required by the quota
        resources:
          requests:
            memory: "64Mi"
            cpu: "100m"
          limits:
            memory: "128Mi"
            cpu: "250m"
        # This volumeMount tells the container where to place the custom index.html
        volumeMounts:
        - name: nginx-index
          mountPath: /usr/share/nginx/html
      # This volume uses the ConfigMap as its source
      volumes:
      - name: nginx-index
        configMap:
          name: nginx-index-html
---

# Exposing Deployment on a stable IP address inside the cluster, port: 80
apiVersion: v1
kind: Service
metadata:
  name: hello-world-service
  namespace: temp
spec:
  selector:
    app: hello-world
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```
