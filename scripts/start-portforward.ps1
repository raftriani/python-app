# Script para inicializar port-forwards do cluster local
Write-Host "Iniciando port-forwards para cluster local..." -ForegroundColor Green

# Port-forward do nginx-ingress
Write-Host "Configurando nginx-ingress..." -ForegroundColor Yellow
Start-Process -FilePath "kubectl" -ArgumentList "port-forward -n ingress-nginx svc/ingress-nginx-controller 80:80 443:443" -WindowStyle Hidden

# Aguardar um pouco para o port-forward inicializar
Start-Sleep -Seconds 3

Write-Host "Port-forwards configurados!" -ForegroundColor Green
Write-Host "Você pode acessar:" -ForegroundColor Cyan
Write-Host "- ArgoCD: https://argocd.test.com" -ForegroundColor White
Write-Host "- Python App: http://python-app.test.com" -ForegroundColor White
Write-Host ""
Write-Host "Para parar os port-forwards, execute: Get-Process kubectl | Stop-Process" -ForegroundColor Red
