-- =========================================================================
-- BANCO DE DADOS DETONAR E RECONSTRUIR TOTAL (RESET COMPLETO)
-- DESTAKCAR WORKSHOP SUITE
-- =========================================================================
-- Copie e cole todo este código diretamente no SQL Editor do seu Supabase 
-- (https://database.new) na nuvem para apagar tabelas anteriores, 
-- desativar RLS, recriar os índices de alta performance e redefinir o sistema.
-- =========================================================================

-- -------------------------------------------------------------------------
-- 1. APAGAR REGRAS, GATILHOS, FUNÇÕES E TODAS AS TABELAS DO COFRE (RESET)
-- -------------------------------------------------------------------------
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users CASCADE;
DROP FUNCTION IF EXISTS public.handle_new_user() CASCADE;

DROP TABLE IF EXISTS public.notificacoes_push CASCADE;
DROP TABLE IF EXISTS public.dispositivos CASCADE;
DROP TABLE IF EXISTS public.servicos CASCADE;
DROP TABLE IF EXISTS public.os_itens CASCADE;
DROP TABLE IF EXISTS public.ordens_servico CASCADE;
DROP TABLE IF EXISTS public.pecas CASCADE;
DROP TABLE IF EXISTS public.veiculos CASCADE;
DROP TABLE IF EXISTS public.clientes CASCADE;
DROP TABLE IF EXISTS public.usuarios CASCADE;

-- 2. HABILITAR EXTENSÃO DE GERAÇÃO DE UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ==========================================
-- 3. CRIAÇÃO DAS TABELAS ORIGINAL / ATUALIZADA
-- ==========================================

-- TABELA DE USUÁRIOS / COLABORADORES (Sincronizado via Auth)
CREATE TABLE public.usuarios (
    id UUID PRIMARY KEY, -- Idêntico ao ID da tabela auth.users do Supabase
    email VARCHAR(255) NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    funcao VARCHAR(50) DEFAULT 'Mecânico' CHECK (funcao IN ('Administrador', 'Supervisor', 'Mecânico')),
    senha VARCHAR(255),
    avatar_url TEXT,
    criado_em TIMESTAMPTZ DEFAULT NOW()
);

-- TABELA DE CLIENTES
CREATE TABLE public.clientes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(50),
    cpf_cnpj VARCHAR(50),
    endereco TEXT,
    criado_em TIMESTAMPTZ DEFAULT NOW()
);

-- TABELA DE VEÍCULOS
CREATE TABLE public.veiculos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cliente_id UUID REFERENCES public.clientes(id) ON DELETE CASCADE,
    placa VARCHAR(20) NOT NULL UNIQUE,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    ano INTEGER,
    cor VARCHAR(50),
    chassi VARCHAR(100),
    criado_em TIMESTAMPTZ DEFAULT NOW()
);

-- TABELA DE ESTOQUE DE PEÇAS
CREATE TABLE public.pecas (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR(255) NOT NULL,
    codigo VARCHAR(100) UNIQUE,
    quantidade INTEGER DEFAULT 0,
    preco_custo DECIMAL(10, 2) DEFAULT 0.00,
    preco_venda DECIMAL(10, 2) DEFAULT 0.00,
    categoria VARCHAR(100),
    limite_minimo INTEGER DEFAULT 5,
    criado_em TIMESTAMPTZ DEFAULT NOW()
);

-- TABELA DE ORDENS DE SERVIÇO (O.S.)
CREATE TABLE public.ordens_servico (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cliente_id UUID REFERENCES public.clientes(id) ON DELETE SET NULL,
    veiculo_id UUID REFERENCES public.veiculos(id) ON DELETE SET NULL,
    descricao TEXT,
    status VARCHAR(50) DEFAULT 'orcamento', -- 'orcamento', 'em_andamento', 'aguardando_pecas', 'concluido', 'cancelado'
    mao_de_obra_valor DECIMAL(10, 2) DEFAULT 0.00,
    total DECIMAL(10, 2) DEFAULT 0.00,
    checklist JSONB DEFAULT '{}'::jsonb,
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    finalizado_em TIMESTAMPTZ
);

-- TABELA DE PEÇAS E ITENS INTEGRANTES DE CADA O.S.
CREATE TABLE public.os_itens (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    os_id UUID REFERENCES public.ordens_servico(id) ON DELETE CASCADE,
    peca_id UUID REFERENCES public.pecas(id) ON DELETE SET NULL,
    quantidade INTEGER DEFAULT 1,
    preco_unitario DECIMAL(10, 2) DEFAULT 0.00,
    criado_em TIMESTAMPTZ DEFAULT NOW()
);

-- TABELA DE SERVIÇOS (LEGACY / SUPORTE PARA BACKUPS JSONB)
CREATE TABLE public.servicos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cliente_id UUID REFERENCES public.clientes(id) ON DELETE SET NULL,
    veiculo_id UUID REFERENCES public.veiculos(id) ON DELETE SET NULL,
    descricao TEXT,
    status VARCHAR(50) DEFAULT 'orcamento',
    mao_de_obra_valor DECIMAL(10, 2) DEFAULT 0.00,
    pecas_usadas JSONB DEFAULT '[]'::jsonb,
    total DECIMAL(10, 2) DEFAULT 0.00,
    checklist JSONB DEFAULT '{}'::jsonb,
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    finalizado_em TIMESTAMPTZ
);

-- TABELA DE DISPOSITIVOS REGISTRADOS (CONEXÕES DE NOTIFICAÇÃO)
CREATE TABLE public.dispositivos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    usuario_id UUID NOT NULL,
    nome_dispositivo VARCHAR(255) NOT NULL,
    token_push TEXT NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    ativo BOOLEAN DEFAULT TRUE
);

-- TABELA DE HISTÓRICO DE NOTIFICAÇÕES GERAIS E PUSH
CREATE TABLE public.notificacoes_push (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    usuario_id VARCHAR(255) NOT NULL, -- UUID de destino ou 'todos' para broadcasts
    titulo VARCHAR(255) NOT NULL,
    mensagem TEXT NOT NULL,
    lida BOOLEAN DEFAULT FALSE,
    tipo VARCHAR(50) NOT NULL,
    criado_em TIMESTAMPTZ DEFAULT NOW()
);

-- =========================================================================
-- 4. CRIAÇÃO DE ÍNDICES DE ALTA PERFORMANCE (BUSCA INSTANTÂNEA)
-- =========================================================================
CREATE INDEX idx_usuarios_email ON public.usuarios(email);
CREATE INDEX idx_clientes_nome ON public.clientes(nome);
CREATE INDEX idx_clientes_telefone ON public.clientes(telefone);
CREATE INDEX idx_veiculos_placa ON public.veiculos(placa);
CREATE INDEX idx_veiculos_cliente ON public.veiculos(cliente_id);
CREATE INDEX idx_pecas_codigo ON public.pecas(codigo);
CREATE INDEX idx_pecas_nome ON public.pecas(nome);
CREATE INDEX idx_ordens_servico_cliente ON public.ordens_servico(cliente_id);
CREATE INDEX idx_ordens_servico_veiculo ON public.ordens_servico(veiculo_id);
CREATE INDEX idx_ordens_servico_status ON public.ordens_servico(status);
CREATE INDEX idx_os_itens_os ON public.os_itens(os_id);
CREATE INDEX idx_os_itens_peca ON public.os_itens(peca_id);
CREATE INDEX idx_servicos_cliente ON public.servicos(cliente_id);
CREATE INDEX idx_servicos_veiculo ON public.servicos(veiculo_id);
CREATE INDEX idx_dispositivos_usuario ON public.dispositivos(usuario_id);
CREATE INDEX idx_notificacoes_usuario ON public.notificacoes_push(usuario_id);

-- =========================================================================
-- 5. DESATIVAR REGRAS DE SEGURANÇA (RLS) - PERMISSÕES E ACESSO PLENO
-- =========================================================================
-- Desativa o bloqueio automático de linhas para que o aplicativo web 
-- consiga realizar leituras, inserções, atualizações e exclusões sem barreiras.
ALTER TABLE public.usuarios DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.clientes DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.veiculos DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.pecas DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.ordens_servico DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.os_itens DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.servicos DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.dispositivos DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.notificacoes_push DISABLE ROW LEVEL SECURITY;

-- =========================================================================
-- 6. GATILHO COMPLETO DE SINCRONIZAÇÃO AUTOMÁTICA DE NOVOS COLABORADORES 
-- =========================================================================
-- Toda vez que um e-mail cadastrar-se na autenticação padrão (Auth.signUp),
-- este gatilho gera automaticamente seu registro associado na tabela "public.usuarios".
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.usuarios (id, email, nome, funcao)
    VALUES (
        new.id,
        new.email,
        coalesce(new.raw_user_meta_data->>'nome', split_part(new.email, '@', 1)),
        coalesce(new.raw_user_meta_data->>'funcao', 'Mecânico')
    )
    ON CONFLICT (id) DO UPDATE
    SET email = EXCLUDED.email,
        nome = COALESCE(EXCLUDED.nome, EXCLUDED.nome),
        funcao = COALESCE(EXCLUDED.funcao, EXCLUDED.funcao);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

-- Instancia o gatilho pós-registro
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- =========================================================================
-- 7. INSERÇÃO RESTRITA DE DADOS INICIAIS (SEED) E COOPERAÇÃO
-- =========================================================================
INSERT INTO public.clientes (id, nome, email, telefone, cpf_cnpj, endereco) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'João Silva', 'joao.silva@gmail.com', '(11) 98765-4321', '123.456.789-00', 'Av. Paulista, 1000 - Bela Vista, São Paulo - SP'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Maria Oliveira', 'maria.oliveira@outlook.com', '(21) 99888-7766', '987.654.321-11', 'Rua das Flores, 45 - Botafogo, Rio de Janeiro - RJ'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Carlos Souza', 'carlos.souza@yahoo.com.br', '(31) 97777-6655', '111.222.333-44', 'Av. Amazonas, 2500 - Centro, Belo Horizonte - MG')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.veiculos (cliente_id, placa, modelo, marca, ano, cor, chassi) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'BRA2E19', 'Civic', 'Honda', 2018, 'Cinza', '9BH123456789012'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'RIO1A23', 'Onix', 'Chevrolet', 2020, 'Branco', '9BG987654321098'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'BHZ9X88', 'Compass', 'Jeep', 2021, 'Preto', '9BD111222333444')
ON CONFLICT (placa) DO NOTHING;

INSERT INTO public.pecas (nome, codigo, quantidade, preco_custo, preco_venda, categoria, limite_minimo) VALUES
('Pastilha de Freio Dianteira', 'PF-CIV18', 12, 85.00, 145.00, 'Freios', 5),
('Filtro de Óleo', 'FO-UNI', 25, 18.00, 38.00, 'Filtros', 10),
('Óleo Sintético 5W30 (1L)', 'OL-5W30', 40, 28.00, 52.00, 'Lubrificantes', 15),
('Amortecedor Dianteiro', 'AM-DIR', 4, 220.00, 390.00, 'Suspensão', 3),
('Correia Dentada', 'CD-GM', 8, 45.00, 89.00, 'Motor', 4)
ON CONFLICT (codigo) DO NOTHING;

-- =========================================================================
-- 8. EXTENSÃO: CONTROLE DE FLUXO POR MECÂNICO & VIEWS DO DASHBOARD
-- =========================================================================

-- Adição do campo de Mecânico Responsável nas tabelas caso não existam
ALTER TABLE public.servicos ADD COLUMN IF NOT EXISTS mecanico_id UUID REFERENCES public.usuarios(id) ON DELETE SET NULL;
ALTER TABLE public.ordens_servico ADD COLUMN IF NOT EXISTS mecanico_id UUID REFERENCES public.usuarios(id) ON DELETE SET NULL;

-- Índices de performance para a vinculação do mecânico
CREATE INDEX IF NOT EXISTS idx_servicos_mecanico ON public.servicos(mecanico_id);
CREATE INDEX IF NOT EXISTS idx_ordens_servico_mecanico ON public.ordens_servico(mecanico_id);

-- Desativar RLS para garantir que as novas colunas e views possam ser lidas livremente
ALTER TABLE public.servicos DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.ordens_servico DISABLE ROW LEVEL SECURITY;

-- -------------------------------------------------------------------------
-- VIEWS DE SEGMENTAÇÃO POR STATUS (Simplificação e Performance no Dashboard)
-- -------------------------------------------------------------------------

-- 1. View de Orçamentos
CREATE OR REPLACE VIEW public.v_servicos_orcamentos AS
SELECT s.*, 
       c.nome AS cliente_nome, 
       v.placa AS veiculo_placa, 
       v.modelo AS veiculo_modelo,
       u.nome AS mecanico_nome
FROM public.ordens_servico s
LEFT JOIN public.clientes c ON s.cliente_id = c.id
LEFT JOIN public.veiculos v ON s.veiculo_id = v.id
LEFT JOIN public.usuarios u ON s.mecanico_id = u.id
WHERE s.status = 'orcamento';

-- 2. View de Serviços Em Andamento
CREATE OR REPLACE VIEW public.v_servicos_em_andamento AS
SELECT s.*, 
       c.nome AS cliente_nome, 
       v.placa AS veiculo_placa, 
       v.modelo AS veiculo_modelo,
       u.nome AS mecanico_nome
FROM public.ordens_servico s
LEFT JOIN public.clientes c ON s.cliente_id = c.id
LEFT JOIN public.veiculos v ON s.veiculo_id = v.id
LEFT JOIN public.usuarios u ON s.mecanico_id = u.id
WHERE s.status = 'em_andamento';

-- 3. View de Serviços Aguardando Peças
CREATE OR REPLACE VIEW public.v_servicos_aguardando_pecas AS
SELECT s.*, 
       c.nome AS cliente_nome, 
       v.placa AS veiculo_placa, 
       v.modelo AS veiculo_modelo,
       u.nome AS mecanico_nome
FROM public.ordens_servico s
LEFT JOIN public.clientes c ON s.cliente_id = c.id
LEFT JOIN public.veiculos v ON s.veiculo_id = v.id
LEFT JOIN public.usuarios u ON s.mecanico_id = u.id
WHERE s.status = 'aguardando_pecas';

-- 4. View de Serviços Concluídos / Faturados
CREATE OR REPLACE VIEW public.v_servicos_concluidos AS
SELECT s.*, 
       c.nome AS cliente_nome, 
       v.placa AS veiculo_placa, 
       v.modelo AS veiculo_modelo,
       u.nome AS mecanico_nome
FROM public.ordens_servico s
LEFT JOIN public.clientes c ON s.cliente_id = c.id
LEFT JOIN public.veiculos v ON s.veiculo_id = v.id
LEFT JOIN public.usuarios u ON s.mecanico_id = u.id
WHERE s.status = 'concluido';

-- 5. View de Serviços Cancelados
CREATE OR REPLACE VIEW public.v_servicos_cancelados AS
SELECT s.*, 
       c.nome AS cliente_nome, 
       v.placa AS veiculo_placa, 
       v.modelo AS veiculo_modelo,
       u.nome AS mecanico_nome
FROM public.ordens_servico s
LEFT JOIN public.clientes c ON s.cliente_id = c.id
LEFT JOIN public.veiculos v ON s.veiculo_id = v.id
LEFT JOIN public.usuarios u ON s.mecanico_id = u.id
WHERE s.status = 'cancelado';

-- -------------------------------------------------------------------------
-- VIEW DE CONSOLIDAÇÃO FINANCEIRA POR STATUS (Dashboard somas corretas)
-- -------------------------------------------------------------------------
CREATE OR REPLACE VIEW public.v_dashboard_somas_por_status AS
SELECT 
    status,
    COUNT(id) AS total_ordens,
    COALESCE(SUM(mao_de_obra_valor), 0) AS total_mao_de_obra,
    COALESCE(SUM(total - mao_de_obra_valor), 0) AS total_pecas,
    COALESCE(SUM(total), 0) AS faturamento_total
FROM public.ordens_servico
GROUP BY status;

-- -------------------------------------------------------------------------
-- VIEWS DE FILTRAGEM AUTOMÁTICA POR MECÂNICO CONSTANTE (MELHORIA DE SEGMENTAÇÃO)
-- -------------------------------------------------------------------------

-- Mostra os serviços atribuídos ao mecânico ativo, ou todos se for Supervisor/Admin
CREATE OR REPLACE VIEW public.v_meus_servicos AS
SELECT s.*,
       c.nome AS cliente_nome, 
       v.placa AS veiculo_placa, 
       v.modelo AS veiculo_modelo,
       u.nome AS mecanico_nome
FROM public.ordens_servico s
LEFT JOIN public.clientes c ON s.cliente_id = c.id
LEFT JOIN public.veiculos v ON s.veiculo_id = v.id
LEFT JOIN public.usuarios u ON s.mecanico_id = u.id
WHERE s.mecanico_id = auth.uid() 
   OR s.mecanico_id IS NULL
   OR (
       SELECT COALESCE(funcao, 'Mecânico') 
       FROM public.usuarios 
       WHERE id = auth.uid()
   ) IN ('Administrador', 'Supervisor');

-- Mostra os veículos que possuem ordens de serviço ativas atribuídas ao mecânico atual, 
-- ou todos os veículos se o usuário for Supervisor ou Administrador
CREATE OR REPLACE VIEW public.v_meus_veiculos AS
SELECT DISTINCT v.*, c.nome AS cliente_nome
FROM public.veiculos v
LEFT JOIN public.clientes c ON v.cliente_id = c.id
LEFT JOIN public.ordens_servico s ON s.veiculo_id = v.id
WHERE s.mecanico_id = auth.uid()
   OR (
       SELECT COALESCE(funcao, 'Mecânico') 
       FROM public.usuarios 
       WHERE id = auth.uid()
   ) IN ('Administrador', 'Supervisor');

-- =========================================================================
-- BANCO DE DADOS ATUALIZADO COM SUCESSO!
-- =========================================================================
