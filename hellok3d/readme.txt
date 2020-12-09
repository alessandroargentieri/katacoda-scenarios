Your Interactive Bash Terminal.
$
$ k3d cluster create mycluster -p "8082:30080@agent[0]" --agents 2
INFO[0001] Created network 'k3d-mycluster'
INFO[0001] Created volume 'k3d-mycluster-images'
INFO[0002] Creating node 'k3d-mycluster-server-0'
INFO[0003] Pulling image 'docker.io/rancher/k3s:v1.19.4-k3s1'
INFO[0072] Creating node 'k3d-mycluster-agent-0'
INFO[0075] Creating node 'k3d-mycluster-agent-1'
INFO[0077] Creating LoadBalancer 'k3d-mycluster-serverlb'
INFO[0078] Pulling image 'docker.io/rancher/k3d-proxy:v3.4.0'
INFO[0090] (Optional) Trying to get IP of the docker host and inject it into the cluster as 'host.k3d.internal' for easy access
INFO[0107] Successfully added host record to /etc/hosts in 4/4 nodes and to the CoreDNS ConfigMap
INFO[0107] Cluster 'mycluster' created successfully!
INFO[0108] You can now use it like this:
kubectl cluster-info
$ kubectl create deployment nginx --image=nginx
deployment.apps/nginx created
$ cat > nodeport << EOF
> apiVersion: v1
> kind: Service
> metadata:
>   labels:
>     app: nginx
>   name: nginx
> spec:
>   ports:
>   - name: 80-80
>     nodePort: 30080
>     port: 80
>     protocol: TCP
>     targetPort: 80
>   selector:
>     app: nginx
>   type: NodePort
> EOF
$ kubectl apply -f nodeport
service/nginx created
$
$ curl localhost:8082/
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

then to step2 you can reach the UI of nginx!!!!
(https://k3d.io/usage/guides/exposing_services/)
