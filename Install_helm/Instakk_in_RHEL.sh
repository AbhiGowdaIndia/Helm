curl https://baltocdn.com/helm/signing.asc | sudo rpm --import -
cat <<EOF | sudo tee /etc/yum.repos.d/helm.repo
[helm]
name=Helm Repo
baseurl=https://baltocdn.com/helm/stable/rpm
enabled=1
gpgcheck=1
gpgkey=https://baltocdn.com/helm/signing.asc
EOF

sudo yum install helm