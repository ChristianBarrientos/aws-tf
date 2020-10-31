#Configurar credenciales de bucket en .../examples/cloud-credentials
#Configurar token api en .../examples/01-velero-secret.patch.yaml
cd /tmp/velero-plugin
velero install \
  --provider velero.io/aws \
  --bucket backup-test-cluster-capresca   \
  --plugins velero/velero-plugin-for-aws:v1.0.0,digitalocean/velero-plugin:v1.0.0 \
  --backup-location-config s3Url=https://nyc3.digitaloceanspaces.com,region=nyc3 \
  --use-volume-snapshots=false \
  --secret-file=/tmp/velero-plugin-1.0.0/examples/cloud-credentials 
 
#Ver deployment
kubectl logs deployment/velero -n velero
kubectl get deployment/velero --namespace velero

#Crear instantanea
velero snapshot-location create default --provider digitalocean.com/velero
#Agregar token api, parcheando el archivo
kubectl patch secret/cloud-credentials -p "$(cat examples/01-velero-secret.patch.yaml)" --namespace velero
kubectl patch deployment/velero -p "$(cat examples/02-velero-deployment.patch.yaml)" --namespace velero
#Ver EStado
kubectl get deployment/velero --namespace velero

##Realizar copia de seguridad
velero backup create webpages-backup --include-namespaces default #--selector app=webpages-capresca
velero backup create webpages-backup2 --selector app=webpages-capresca
#Ver copia realizada 
velero backup describe webpages-backup2
velero backup logs webpages-backup2
velero backup describe webpages-backup2 --details


#Debug
kubectl get pods --all-namespaces
kubectl --namespace velero logs id-pod
velero backup describe webpages-backup
#Eliminar namespace
kubectl delete namespaces velero

##Output
velero backup logs webpages-backup2 |grep error
time="2020-02-19T14:06:22Z" level=error msg="Storage.CreateSnapshot returned error: POST https://api.digitalocean.com/v2/volumes/77f723fe-518b-11ea-807f-0a58ac1468d2/snapshots: 429 (request \"40212578-45d4-4fad-a5f2-5384285736b7\") failed to create snapshot: this operation is rate-limited - one request per 10m0s" backup=velero/webpages-backup2 cmd=/plugins/velero-digitalocean logSource="/go/src/github.com/digitalocean/velero-plugin/velero-digitalocean/volume_snapshotter.go:139" pluginName=velero-digitalocean
time="2020-02-19T14:06:22Z" level=info msg="1 errors encountered backup up item" backup=velero/webpages-backup2 group=v1 logSource="pkg/backup/resource_backupper.go:284" name=capresca-wp-mysql-pvc namespace= resource=persistentvolumeclaims
time="2020-02-19T14:06:22Z" level=error msg="Error backing up item" backup=velero/webpages-backup2 error="error taking snapshot of volume: rpc error: code = Aborted desc = plugin panicked: runtime error: invalid memory address or nil pointer dereference" group=v1 logSource="pkg/backup/resource_backupper.go:288" name=capresca-wp-mysql-pvc namespace= resource=persistentvolumeclaims
time="2020-02-19T14:06:23Z" level=info msg="1 errors encountered backup up item" backup=velero/webpages-backup2 group=v1 logSource="pkg/backup/resource_backupper.go:284" name=capresca-wp-pvc namespace= resource=persistentvolumeclaims
time="2020-02-19T14:06:23Z" level=error msg="Error backing up item" backup=velero/webpages-backup2 error="error taking snapshot of volume: rpc error: code = Aborted desc = plugin panicked: runtime error: invalid memory address or nil pointer dereference" group=v1 logSource="pkg/backup/resource_backupper.go:288" name=capresca-wp-pvc namespace= resource=persistentvolumeclaims
time="2020-02-19T14:06:23Z" level=error msg="Storage.CreateSnapshot returned error: POST https://api.digitalocean.com/v2/volumes/78330904-518b-11ea-b67b-0a58ac146583/snapshots: 429 (request \"29bd198b-43fc-4992-8541-ec4b7e0dafac\") failed to create snapshot: this operation is rate-limited - one request per 10m0s" backup=velero/webpages-backup2 cmd=/plugins/velero-digitalocean logSource="/go/src/github.com/digitalocean/velero-plugin/velero-digitalocean/volume_snapshotter.go:139" pluginName=velero-digitalocean
time="2020-02-19T14:06:23Z" level=error msg="Storage.CreateSnapshot returned error: POST https://api.digitalocean.com/v2/volumes/94381c68-5244-11ea-b67b-0a58ac146583/snapshots: 429 (request \"2843308d-217f-49c1-8cc8-d85d11461c22\") failed to create snapshot: this operation is rate-limited - one request per 10m0s" backup=velero/webpages-backup2 cmd=/plugins/velero-digitalocean logSource="/go/src/github.com/digitalocean/velero-plugin/velero-digitalocean/volume_snapshotter.go:139" pluginName=velero-digitalocean
time="2020-02-19T14:06:23Z" level=info msg="1 errors encountered backup up item" backup=velero/webpages-backup2 group=v1 logSource="pkg/backup/resource_backupper.go:284" name=clubemprendedor-wp-mysql-pvc namespace= resource=persistentvolumeclaims
time="2020-02-19T14:06:23Z" level=error msg="Error backing up item" backup=velero/webpages-backup2 error="error taking snapshot of volume: rpc error: code = Aborted desc = plugin panicked: runtime error: invalid memory address or nil pointer dereference" group=v1 logSource="pkg/backup/resource_backupper.go:288" name=clubemprendedor-wp-mysql-pvc namespace= resource=persistentvolumeclaims
time="2020-02-19T14:06:24Z" level=info msg="1 errors encountered backup up item" backup=velero/webpages-backup2 group=v1 logSource="pkg/backup/resource_backupper.go:284" name=clubemprendedor-wp-pvc namespace= resource=persistentvolumeclaims
time="2020-02-19T14:06:24Z" level=error msg="Error backing up item" backup=velero/webpages-backup2 error="error taking snapshot of volume: rpc error: code = Aborted desc = plugin panicked: runtime error: invalid memory address or nil pointer dereference" group=v1 logSource="pkg/backup/resource_backupper.go:288" name=clubemprendedor-wp-pvc namespace= resource=persistentvolumeclaims
time="2020-02-19T14:06:24Z" level=error msg="Storage.CreateSnapshot returned error: POST https://api.digitalocean.com/v2/volumes/9470a808-5244-11ea-b67b-0a58ac146583/snapshots: 429 (request \"5b41f6cc-49ba-4748-9839-63e3ddea6838\") failed to create snapshot: this operation is rate-limited - one request per 10m0s" backup=velero/webpages-backup2 cmd=/plugins/velero-digitalocean logSource="/go/src/github.com/digitalocean/velero-plugin/velero-digitalocean/volume_snapshotter.go:139" pluginName=velero-digitalocean