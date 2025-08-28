# Cluster Local - Guia de Configuração

Este projeto está configurado para rodar em um cluster Kubernetes local (kind/minikube/Docker Desktop).

## 🚀 Inicialização Rápida

### 1. Executar Port-Forwards
```powershell
.\scripts\start-portforward.ps1
```

### 2. Acessar Aplicações
- **ArgoCD**: https://argocd.test.com
- **Python App**: http://python-app.test.com

## 🔧 Configuração Manual

Se preferir configurar manualmente:

### Port-Forward do nginx-ingress:
```bash
kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 80:80 443:443
```

### Ou acessar via NodePort:
```bash
kubectl get svc -n ingress-nginx
```
Acesse usando as portas mapeadas (ex: https://argocd.test.com:32763)

## 📝 Credenciais

### ArgoCD
- **Usuário**: admin
- **Senha**: Execute `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

## 🛠️ Troubleshooting

### Problema: ERR_CONNECTION_REFUSED
**Causa**: Port-forwards não estão ativos
**Solução**: Execute o script `start-portforward.ps1`

### Problema: Pods não estão rodando
```bash
kubectl get pods -A
```

### Problema: Ingress não funciona
```bash
kubectl get ingress -A
kubectl get svc -n ingress-nginx
```
