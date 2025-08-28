# Configuração de Personal Access Token para CI/CD

Se o workflow ainda falhar com permissões, você precisará criar um Personal Access Token (PAT):

## 1. Criar PAT no GitHub:
1. Vá para: https://github.com/settings/tokens/new
2. Nome: `python-app-cicd`
3. Expiration: `90 days` (ou conforme preferir)
4. Scopes necessários:
   - ✅ `repo` (Full control of private repositories)
   - ✅ `workflow` (Update GitHub Action workflows)

## 2. Adicionar como Secret:
1. Vá para: https://github.com/raftriani/python-app/settings/secrets/actions
2. Clique em "New repository secret"
3. Nome: `PAT_TOKEN`
4. Valor: [cole o token gerado]

## 3. Atualizar o workflow:
Substitua `${{ secrets.GITHUB_TOKEN }}` por `${{ secrets.PAT_TOKEN }}` no checkout step.

```yaml
- name: Checkout code
  uses: actions/checkout@v4
  with:
    token: ${{ secrets.PAT_TOKEN }}
```
