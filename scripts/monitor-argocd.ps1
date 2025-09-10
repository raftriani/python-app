# Script para monitorar e reestabelecer port-forward do ArgoCD
Write-Host "Iniciando monitoramento do ArgoCD..." -ForegroundColor Green

while ($true) {
    # Verificar se o port-forward está ativo
    $portForwardProcess = Get-Process kubectl -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*port-forward*ingress-nginx*" }
    
    if (-not $portForwardProcess) {
        Write-Host "$(Get-Date): Port-forward caiu, reestabelecendo..." -ForegroundColor Yellow
        
        # Verificar se o cluster está acessível
        try {
            kubectl get nodes | Out-Null
            
            # Reestabelecer port-forward
            Start-Process -FilePath "kubectl" -ArgumentList "port-forward -n ingress-nginx svc/ingress-nginx-controller 80:80 443:443" -WindowStyle Hidden
            
            Write-Host "$(Get-Date): Port-forward reestabelecido!" -ForegroundColor Green
        }
        catch {
            Write-Host "$(Get-Date): Cluster não acessível: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    else {
        Write-Host "$(Get-Date): ArgoCD funcionando - Port-forward ativo" -ForegroundColor Cyan
    }
    
    # Aguardar 30 segundos antes da próxima verificação
    Start-Sleep -Seconds 30
}
