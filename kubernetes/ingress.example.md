NGINX Ingress controller working example
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: hello-http-ingress
  namespace: ben
spec:
  rules:
  - host: publicname.cluster.lan
    http:
      paths:
      - backend:
          service:
            name: hello-http-service
            port:
              number: 7070
        path: /
        pathType: Prefix
```
