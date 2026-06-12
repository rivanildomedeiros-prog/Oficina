<div align="center">
<img width="1200" height="475" alt="GHBanner" src="https://ai.google.dev/static/site-assets/images/share-ais-513315318.png" />
</div>

# Run and deploy your AI Studio app

This contains everything you need to run your app locally.

View your app in AI Studio: https://ai.studio/apps/b486d2d1-c10f-466f-9d15-5060226abe76

## Execução Local (Run Locally)

**Pré-requisitos:** Node.js instalado.

1. Instale as dependências:
   ```bash
   npm install
   ```
2. Defina as credenciais no arquivo `.env.local`:
   Crie ou edite o arquivo `.env.local` na raiz e configure:
   ```env
   NEXT_PUBLIC_SUPABASE_URL="sua-url-do-supabase"
   NEXT_PUBLIC_SUPABASE_ANON_KEY="sua-chave-anon-do-supabase"
   ```
3. Execute o aplicativo em modo de desenvolvimento:
   ```bash
   npm run dev
   ```

---

## Integração e Deploy no Vercel

O **DestakCar** é totalmente compatível e otimizado para deploy na plataforma **Vercel**. Siga as etapas abaixo para realizar a implantação:

### 1. Criar Repositório no GitHub
Como os arquivos estão em seu ambiente local, o primeiro passo é criar um repositório no seu GitHub e subir o código:
1. Crie um novo repositório (público ou privado) no [GitHub](https://github.com/new).
2. No seu terminal local, inicialize o git e suba o código:
   ```bash
   git init
   git add .
   git commit -m "feat: configuracoes para vercel"
   git branch -M main
   git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
   git push -u origin main
   ```

### 2. Conectar com a Vercel
1. Acesse o painel da [Vercel](https://vercel.com) e conecte com sua conta do GitHub.
2. Clique no botão **"Add New..."** e depois em **"Project"**.
3. Importe o repositório que você acabou de criar.

### 3. Configurar Variáveis de Ambiente
Antes de clicar em Deploy, expanda a seção **Environment Variables** e adicione as seguintes chaves que constam no arquivo `.env.example`:
- `NEXT_PUBLIC_SUPABASE_URL`: O endpoint URL do seu projeto Supabase.
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`: A chave anônima (anon key) do seu projeto Supabase.

*Dica: Essas credenciais também podem ser inseridas diretamente na interface do app em produção, que as salvará com segurança no LocalStorage do seu navegador.*

### 4. Publicar
1. Clique em **"Deploy"**.
2. Aguarde alguns minutos enquanto o Next.js é compilado e publicado na infraestrutura global da Vercel.
3. Pronto! A Vercel fornecerá um link público seguro (HTTPS) para acessar a aplicação.

### 5. Configurar Banco de Dados (Supabase)
Se o seu banco do Supabase for novo, certifique-se de executar o script de inicialização do banco:
1. Abra o arquivo [supabase_schema.sql](supabase_schema.sql) na raiz do projeto e copie o seu conteúdo.
2. No painel do seu projeto no Supabase, vá em **SQL Editor** -> **New Query**.
3. Cole o código SQL e clique em **Run** para criar todas as tabelas, índices e relações do sistema.

---

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new)
