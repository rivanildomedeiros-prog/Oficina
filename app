@tailwind base;
@tailwind components;
@tailwind utilities;

@media print {
  /* Hide the main UI container, sidebar, custom navbar, footer and any other non-printable components */
  body * {
    visibility: hidden;
  }

  /* Make sure only the desired print containers are visible */
  #print_invoice_box,
  #print_invoice_box * {
    visibility: visible;
  }

  /* Ensure print_invoice_box gets placed absolute, completely overriding CSS margins/paddings from standard display */
  #print_invoice_box {
    position: absolute !important;
    left: 0 !important;
    top: 0 !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    border: none !important;
    box-shadow: none !important;
    background: white !important;
    color: black !important;
  }

  /* Remove any backdrop blur, overlay background dark color or surrounding scroll behaviors of modals */
  div.fixed.inset-0,
  div.backdrop-blur-xs {
    background: transparent !important;
    backdrop-filter: none !important;
    -webkit-backdrop-filter: none !important;
    position: absolute !important;
    inset: 0 !important;
    padding: 0 !important;
    overflow: visible !important;
  }

  /* Remove all interactive controls and action buttons during print */
  .print\:hidden,
  button,
  nav,
  header {
    display: none !important;
    height: 0 !important;
    overflow: hidden !important;
  }

  /* Configure print page options */
  @page {
    size: portrait;
    margin: 1.5cm !important;
  }

  /* Optimization of Client & Vehicle information box to be centered and standout */
  #print_invoice_box .grid-cols-2 {
    display: grid !important;
    grid-template-columns: 1fr 1fr !important;
    gap: 1.5rem !important;
    text-align: center !important;
  }

  #print_invoice_box .grid-cols-2 > div {
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: center !important;
    text-align: center !important;
    background-color: #f8fafc !important; /* Soft light gray print background */
    border: 1px solid #cbd5e1 !important; /* Elegant thin border for paper readability */
    padding: 1.25rem !important;
    border-radius: 0.75rem !important;
    -webkit-print-color-adjust: exact !important;
    print-color-adjust: exact !important;
  }

  /* Clean up general table styling on print */
  table {
    border-collapse: collapse !important;
    width: 100% !important;
  }

  th {
    background-color: #f1f5f9 !important;
    color: #0f172a !important;
    border-bottom: 2px solid #cbd5e1 !important;
    -webkit-print-color-adjust: exact !important;
    print-color-adjust: exact !important;
  }

  td, th {
    padding: 0.5rem 0.75rem !important;
  }

  /* Force background rendering adjustments */
  body {
    -webkit-print-color-adjust: exact !important;
    print-color-adjust: exact !important;
    background: white !important;
    color: black !important;
  }
}

/* =========================================================================
   DARK MODE SYSTEM - DESTAKCAR PREMIUM THEME
   ========================================================================= */

.dark {
  color-scheme: dark;
}

.dark body {
  background-color: #0b0f19 !important;
  color: #e2e8f0 !important;
}

/* Base structural overrides */
.dark #main_app_layout {
  background-color: #090d16 !important;
}

.dark #primary_header {
  background-color: #0f172a !important;
  border-color: #1e293b !important;
}

.dark #primary_header h1 {
  color: #ffffff !important;
}

/* Cards & Modals */
.dark .bg-white {
  background-color: #0f172a !important;
}

.dark .shadow-sm, .dark .shadow-md, .dark .shadow-lg, .dark .shadow-2xl {
  box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.4) !important;
}

/* Borders */
.dark .border,
.dark .border-b,
.dark .border-t,
.dark .border-l,
.dark .border-r,
.dark .border-slate-200,
.dark .border-slate-100,
.dark .border-slate-200\/80,
.dark .border-slate-200\/75 {
  border-color: #1e293b !important;
}

/* Typography general */
.dark h1, .dark h2, .dark h3, .dark h4 {
  color: #f8fafc !important;
}

.dark p, .dark label, .dark .text-slate-600, .dark .text-slate-500, .dark .text-slate-700 {
  color: #94a3b8 !important;
}

.dark .text-slate-800, .dark .text-slate-900 {
  color: #cbd5e1 !important;
}

.dark .text-slate-400 {
  color: #64748b !important;
}

/* Sidebar navigation */
.dark aside nav {
  background-color: #0f172a !important;
  border-color: #1e293b !important;
}

.dark aside nav button {
  color: #94a3b8 !important;
}

.dark aside nav button:hover {
  background-color: rgba(30, 41, 59, 0.5) !important;
  color: #ffffff !important;
}

.dark aside nav button.bg-indigo-50 {
  background-color: rgba(79, 70, 229, 0.15) !important;
  color: #a5b4fc !important;
  border-color: #6366f1 !important;
}

/* Inputs & Form Fields */
.dark input, 
.dark select, 
.dark textarea {
  background-color: #1e293b !important;
  color: #f8fafc !important;
  border-color: #334155 !important;
}

.dark input:focus, 
.dark select:focus, 
.dark textarea:focus {
  border-color: #6366f1 !important;
  outline: none !important;
}

.dark input::placeholder {
  color: #475569 !important;
}

.dark input:disabled,
.dark select:disabled {
  background-color: #0f172a !important;
  color: #475569 !important;
}

/* Lists & Tables */
.dark table {
  background-color: #0f172a !important;
}

.dark th {
  background-color: #1e293b !important;
  color: #cbd5e1 !important;
  border-color: #334155 !important;
}

.dark tr:hover {
  background-color: rgba(30, 41, 59, 0.4) !important;
}

.dark .bg-slate-50 {
  background-color: #090d16 !important;
}

.dark .bg-slate-50\/55:hover {
  background-color: rgba(30, 41, 59, 0.6) !important;
}

/* Modal specific elements */
.dark .fixed.inset-0 {
  background-color: rgba(2, 6, 23, 0.7) !important;
}

.dark #print_invoice_box {
  background-color: #0f172a !important;
  border-color: #1e293b !important;
}

.dark .bg-slate-50.border.border-slate-100 {
  background-color: rgba(30, 41, 59, 0.4) !important;
  border-color: #1e293b !important;
}

.dark .bg-indigo-50\/15 {
  background-color: rgba(99, 102, 241, 0.05) !important;
  border-color: rgba(99, 102, 241, 0.2) !important;
}

.dark .bg-indigo-50 {
  background-color: rgba(99, 102, 241, 0.1) !important;
}

/* Dashboard KPIs cards specifically */
.dark #kpi_grid > div {
  background-color: #0f172a !important;
  border-color: #1e293b !important;
}

.dark #kpi_grid > div:hover {
  border-color: #334155 !important;
}

/* Chart block styling */
.dark .recharts-cartesian-grid-horizontal line {
  stroke: #1e293b !important;
}

.dark .recharts-text {
  fill: #94a3b8 !important;
}

/* Custom dropdowns and inline statuses */
.dark [id^="status_selector_wrapper_"] {
  background-color: #0f172a !important;
  border-color: #1e293b !important;
}

/* Login screen illustration card specifics */
.dark #auth_portal_wrapper {
  background-color: #0f172a !important;
  border-color: #1e293b !important;
}

.dark #auth_portal_wrapper input {
  background-color: #1e293b !important;
  border-color: #334155 !important;
}

.dark #auth_portal_wrapper label {
  color: #cbd5e1 !important;
}

.dark #auth_portal_wrapper p {
  color: #94a3b8 !important;
}

.dark #auth_portal_wrapper span {
  color: #cbd5e1 !important;
}

.dark #auth_portal_wrapper .bg-white {
  background-color: #0f172a !important;
}

.dark #auth_portal_wrapper .border-slate-105,
.dark #auth_portal_wrapper .border-t {
  border-color: #1e293b !important;
}



import type {Metadata} from 'next';
import { Inter, JetBrains_Mono } from 'next/font/google';
import './globals.css'; // Global styles

const inter = Inter({
  subsets: ['latin'],
  variable: '--font-sans',
  display: 'swap',
});

const jetbrainsMono = JetBrains_Mono({
  subsets: ['latin'],
  variable: '--font-mono',
  display: 'swap',
});

export const metadata: Metadata = {
  title: 'DestakCar | Workshop Suite',
  description: 'Sistema completo de gestão para oficina mecânica',
  manifest: '/manifest.json',
  icons: {
    icon: [
      { url: '/icon.svg', type: 'image/svg+xml' }
    ],
    shortcut: '/icon.svg',
    apple: [
      { url: '/icon.svg', type: 'image/svg+xml' }
    ]
  }
};

export default function RootLayout({children}: {children: React.ReactNode}) {
  return (
    <html lang="pt-BR" className={`${inter.variable} ${jetbrainsMono.variable}`}>
      <body className="font-sans antialiased bg-slate-50 text-slate-800 min-h-screen" suppressHydrationWarning>
        {children}
      </body>
    </html>
  );
}

'use client';

import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { 
  Wrench, 
  Users, 
  Car, 
  ClipboardList, 
  Package, 
  Settings, 
  Plus, 
  Search, 
  TrendingUp, 
  AlertTriangle, 
  CheckCircle2, 
  Clock, 
  FileText, 
  ChevronRight, 
  Trash2, 
  Edit3, 
  DollarSign, 
  UserPlus, 
  Info, 
  Database, 
  Lock,
  Copy, 
  X, 
  RefreshCw,
  Printer,
  SlidersHorizontal,
  Smartphone,
  BarChart3,
  FileSpreadsheet,
  Bell,
  MessageSquare,
  Share2,
  Check,
  Upload,
  Camera,
  Shield,
  Crown,
  Eye,
  CheckCheck,
  BellRing,
  Trash,
  Filter,
  Terminal,
  User,
  LogOut,
  ChevronDown,
  Sun,
  Moon
} from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';
import {
  ResponsiveContainer,
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend
} from 'recharts';
import { 
  Cliente, 
  Veiculo, 
  Peca, 
  Servico, 
  PecaUsada,
  fetchClientes, 
  fetchVeiculos, 
  fetchPecas, 
  fetchServicos, 
  createCliente, 
  updateCliente, 
  deleteCliente,
  createVeiculo, 
  updateVeiculo, 
  deleteVeiculo,
  createPeca, 
  updatePeca, 
  deletePeca,
  createServico, 
  updateServico, 
  deleteServico,
  getDashboardStats, 
  DashboardStats,
  getDatabaseMode,
  getSupabaseCredentials,
  getSupabaseClient,
  clearAllLocalDatabase,
  Usuario,
  signUpUser,
  signInUser,
  signOutUser,
  getCurrentUser,
  resetPasswordForEmail,
  updateUserPassword,
  updateUserProfile,
  fetchUsuarios,
  updateUsuarioFuncao,
  Dispositivo,
  NotificacaoPush,
  fetchDispositivos,
  registerDispositivo,
  deleteDispositivo,
  fetchNotificacoesPush,
  markNotificacoesLidas,
  clearNotificacoesPush,
  dispatchAutomatedPush,
  testDatabaseLatency
} from '../lib/database';
import { formatCPFOrCNPJ, getCpfCnpjValidation } from '../lib/validation';
import { downloadPDFOrdemServico } from '../lib/pdf-generator';

const WORKSHOP_SCHEMA_SQL = `-- =========================================================================
-- CONFIGURAÇÃO DE MIGRAÇÃO RÁPIDA (Se você já possui as tabelas criadas):
-- Caso seu banco de dados já possua dados e você queira apenas adicionar as 
-- novas colunas/recursos do sistema, execute as seguintes linhas:
--
-- ALTER TABLE public.usuarios ADD COLUMN IF NOT EXISTS senha VARCHAR(255);
-- ALTER TABLE public.usuarios ADD COLUMN IF NOT EXISTS avatar_url TEXT;
-- ALTER TABLE public.ordens_servico ADD COLUMN IF NOT EXISTS checklist JSONB DEFAULT '{}'::jsonb;
-- ALTER TABLE public.servicos ADD COLUMN IF NOT EXISTS checklist JSONB DEFAULT '{}'::jsonb;
-- =========================================================================

-- SCHEMA DE BANCO DE DADOS COMPLETO - DESTAKCAR WORKSHOP SUITE
-- Copie e execute este script no SQL Editor do Supabase (https://database.new)
-- =========================================================================

-- 1. Habilitar uuid-ossp
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. Tabela de Usuários / Perfis (Sincronizado via Trigger)
CREATE TABLE IF NOT EXISTS public.usuarios (
    id UUID PRIMARY KEY, -- ID do auth.users do Supabase
    email VARCHAR(255) NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    funcao VARCHAR(50) DEFAULT 'Mecânico' CHECK (funcao IN ('Administrador', 'Supervisor', 'Mecânico')),
    senha VARCHAR(255),
    avatar_url TEXT,
    criado_em TIMESTAMPTZ DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_usuarios_email ON public.usuarios(email);

-- 3. Tabela de Clientes
CREATE TABLE IF NOT EXISTS public.clientes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(50),
    cpf_cnpj VARCHAR(50),
    endereco TEXT,
    criado_em TIMESTAMPTZ DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_clientes_nome ON public.clientes(nome);
CREATE INDEX IF NOT EXISTS idx_clientes_telefone ON public.clientes(telefone);

-- 4. Tabela de Veículos
CREATE TABLE IF NOT EXISTS public.veiculos (
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
CREATE INDEX IF NOT EXISTS idx_veiculos_placa ON public.veiculos(placa);
CREATE INDEX IF NOT EXISTS idx_veiculos_cliente ON public.veiculos(cliente_id);

-- 5. Tabela de Estoque de Peças
CREATE TABLE IF NOT EXISTS public.pecas (
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
CREATE INDEX IF NOT EXISTS idx_pecas_codigo ON public.pecas(codigo);
CREATE INDEX IF NOT EXISTS idx_pecas_nome ON public.pecas(nome);

-- 6. Tabela de Ordens de Serviço (Orçamentos/Serviços com Histórico)
CREATE TABLE IF NOT EXISTS public.ordens_servico (
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
CREATE INDEX IF NOT EXISTS idx_ordens_servico_cliente ON public.ordens_servico(cliente_id);
CREATE INDEX IF NOT EXISTS idx_ordens_servico_veiculo ON public.ordens_servico(veiculo_id);
CREATE INDEX IF NOT EXISTS idx_ordens_servico_status ON public.ordens_servico(status);

-- 7. Tabela de Peças Usadas em cada O.S. (Sub-itens)
CREATE TABLE IF NOT EXISTS public.os_itens (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    os_id UUID REFERENCES public.ordens_servico(id) ON DELETE CASCADE,
    peca_id UUID REFERENCES public.pecas(id) ON DELETE SET NULL,
    quantidade INTEGER DEFAULT 1,
    preco_unitario DECIMAL(10, 2) DEFAULT 0.00,
    criado_em TIMESTAMPTZ DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_os_itens_os ON public.os_itens(os_id);
CREATE INDEX IF NOT EXISTS idx_os_itens_peca ON public.os_itens(peca_id);

-- 8. Tabela de Serviços (Apoio / backups JSONB / compatibilidade antiga)
CREATE TABLE IF NOT EXISTS public.servicos (
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
CREATE INDEX IF NOT EXISTS idx_servicos_cliente ON public.servicos(cliente_id);
CREATE INDEX IF NOT EXISTS idx_servicos_status ON public.servicos(status);

-- 9. Tabela de Dispositivos para Notificações Push
CREATE TABLE IF NOT EXISTS public.dispositivos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    usuario_id UUID NOT NULL,
    nome_dispositivo VARCHAR(255) NOT NULL,
    token_push TEXT NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    criado_em TIMESTAMPTZ DEFAULT NOW(),
    ativo BOOLEAN DEFAULT TRUE
);
CREATE INDEX IF NOT EXISTS idx_dispositivos_usuario ON public.dispositivos(usuario_id);

-- 10. Tabela de Histórico de Notificações
CREATE TABLE IF NOT EXISTS public.notificacoes_push (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    usuario_id VARCHAR(255) NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    mensagem TEXT NOT NULL,
    lida BOOLEAN DEFAULT FALSE,
    tipo VARCHAR(50) NOT NULL,
    criado_em TIMESTAMPTZ DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_notificacoes_usuario ON public.notificacoes_push(usuario_id);

-- Desativar Row Level Security (RLS) para permitir acesso pleno da aplicação do workspace sem barreiras
ALTER TABLE public.usuarios DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.clientes DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.veiculos DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.pecas DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.ordens_servico DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.os_itens DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.servicos DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.dispositivos DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.notificacoes_push DISABLE ROW LEVEL SECURITY;

-- Automação de Perfil (auth.users -> public.usuarios)
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

-- Gatilho
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users CASCADE;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- 11. Cadastro de Usuário para Primeiro Acesso Direto (Mesa do Administrador)
INSERT INTO public.usuarios (id, email, nome, funcao, senha, criado_em)
VALUES (
    'a0000000-0000-0000-0000-000000000002',
    'rivanildomedeiros@gmail.com',
    'Rivanildo Silva de Medeiros',
    'Administrador',
    '123456',
    NOW()
)
ON CONFLICT (id) DO UPDATE 
SET email = EXCLUDED.email, 
    nome = EXCLUDED.nome, 
    funcao = EXCLUDED.funcao, 
    senha = EXCLUDED.senha;`;

function generateRandomId(prefix: string): string {
  return prefix + Math.floor(Math.random() * 10000000).toString(36);
}

const CustomTooltip = ({ active, payload, label }: any) => {
  if (active && payload && payload.length) {
    const faturamentoVal = payload[0]?.value || 0;
    const servicosVal = payload[1]?.value || 0;
    
    const formatCurrencyLocal = (value: number) => {
      return new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL',
      }).format(value);
    };

    return (
      <div className="bg-slate-900/95 text-white p-3 rounded-xl border border-slate-700/50 shadow-xl backdrop-blur-md text-[11px] font-sans">
        <p className="text-[10px] font-bold text-slate-400 mb-1.5 uppercase tracking-wider font-mono">{label}</p>
        <div className="space-y-1">
          <div className="flex items-center gap-3 justify-between font-semibold">
            <span className="flex items-center gap-1.5 text-indigo-300">
              <span className="w-1.5 h-1.5 rounded-full bg-indigo-500"></span>
              Faturamento:
            </span>
            <span className="text-white font-extrabold">{formatCurrencyLocal(faturamentoVal)}</span>
          </div>
          <div className="flex items-center gap-3 justify-between font-semibold border-t border-slate-805 pt-1 mt-1">
            <span className="flex items-center gap-1.5 text-sky-305">
              <span className="w-1.5 h-1.5 rounded-full bg-sky-400"></span>
              Ordens de Serviço:
            </span>
            <span className="text-white font-extrabold">{servicosVal} O.S.</span>
          </div>
        </div>
      </div>
    );
  }
  return null;
};

export default function Home() {
  const router = useRouter();
  // Base State Loaded Check
  const [loading, setLoading] = useState<boolean>(true);
  const [activeTab, setActiveTab] = useState<'dashboard' | 'clientes' | 'servicos' | 'estoque' | 'relatorios' | 'config' | 'alertas' | 'busca_avancada' | 'notificacoes'>('dashboard');
  
  // Theme State
  const [darkMode, setDarkMode] = useState<boolean>(false);
  
  // Data States
  const [clientes, setClientes] = useState<Cliente[]>([]);
  const [veiculos, setVeiculos] = useState<Veiculo[]>([]);
  const [pecas, setPecas] = useState<Peca[]>([]);
  const [servicos, setServicos] = useState<Servico[]>([]);
  const [stats, setStats] = useState<DashboardStats | null>(null);
  
  // Filtering & Searching
  const [searchQuery, setSearchQuery] = useState<string>('');
  const [statusFilter, setStatusFilter] = useState<string>('todos');
  const [stockFilter, setStockFilter] = useState<'todos' | 'baixo'>('todos');
  const [stockCategoryFilter, setStockCategoryFilter] = useState<string>('todos');

  // Reports Filter State
  const [reportStartDate, setReportStartDate] = useState<string>(() => {
    const d = new Date();
    d.setMonth(d.getMonth() - 1); // Default to past 30 days
    return d.toISOString().split('T')[0];
  });
  const [reportEndDate, setReportEndDate] = useState<string>(() => {
    return new Date().toISOString().split('T')[0]; // Default to today
  });
  const [reportClienteId, setReportClienteId] = useState<string>('todos');
  const [reportStatus, setReportStatus] = useState<string>('todos');
  const [reportKeyword, setReportKeyword] = useState<string>('');
  const [reportPrintMode, setReportPrintMode] = useState<boolean>(false);
  const [mobileMoreOpen, setMobileMoreOpen] = useState<boolean>(false);
  const [activeStatusDropdownId, setActiveStatusDropdownId] = useState<string | null>(null);
  const [activeProfileSection, setActiveProfileSection] = useState<'perfil' | 'senha' | 'usuarios' | 'supabase' | 'oficina'>('perfil');

  // Close active inline status dropdown when clicking outside
  useEffect(() => {
    const handleOutsideClick = (e: MouseEvent) => {
      if (activeStatusDropdownId) {
        const target = e.target as HTMLElement;
        if (!target.closest('[id^="status_selector_wrapper_"]')) {
          setActiveStatusDropdownId(null);
        }
      }
    };
    document.addEventListener('click', handleOutsideClick);
    return () => {
      document.removeEventListener('click', handleOutsideClick);
    };
  }, [activeStatusDropdownId]);

  // Supabase Custom Config State
  const [dbMode, setDbMode] = useState<'supabase' | 'local'>('supabase');
  const [supabaseUrl, setSupabaseUrl] = useState<string>('');
  const [supabaseKey, setSupabaseKey] = useState<string>('');
  const [showConfigAlert, setShowConfigAlert] = useState<boolean>(false);
  const [latencyTesting, setLatencyTesting] = useState<boolean>(false);
  const [latencyResult, setLatencyResult] = useState<{ tested: boolean; success?: boolean; latencyMs?: number; error?: string } | null>(null);

  // Auth States
  const [currentUser, setCurrentUser] = useState<Usuario | null>(null);
  const [profileName, setProfileName] = useState<string>('');
  const [profileAvatarFile, setProfileAvatarFile] = useState<File | null>(null);
  const [profileAvatarPreview, setProfileAvatarPreview] = useState<string>('');
  const [profileSubmitting, setProfileSubmitting] = useState<boolean>(false);
  const [newPassword, setNewPassword] = useState<string>('');
  const [confirmNewPassword, setConfirmNewPassword] = useState<string>('');
  const [passwordSubmitting, setPasswordSubmitting] = useState<boolean>(false);
  const [usersList, setUsersList] = useState<Usuario[]>([]);
  const [loadingUsers, setLoadingUsers] = useState<boolean>(false);
  const [authMode, setAuthMode] = useState<'login' | 'register' | 'forgot' | 'reset'>('login');
  const [showHelpFirstAccess, setShowHelpFirstAccess] = useState<boolean>(false);
  const [chartType, setChartType] = useState<'linha' | 'barra'>('linha');
  const [authEmail, setAuthEmail] = useState<string>('');
  const [authPassword, setAuthPassword] = useState<string>('');
  const [authConfirmPassword, setAuthConfirmPassword] = useState<string>('');
  const [showEmailSimulation, setShowEmailSimulation] = useState<boolean>(false);
  const [authNome, setAuthNome] = useState<string>('');
  const [authFuncao, setAuthFuncao] = useState<'Administrador' | 'Supervisor' | 'Mecânico'>('Mecânico');
  const [authError, setAuthError] = useState<string | null>(null);
  const [authSuccess, setAuthSuccess] = useState<string | null>(null);
  const [authLoading, setAuthLoading] = useState<boolean>(false);

  // Modal / Form States
  const [activeModal, setActiveModal] = useState<'cliente' | 'veiculo' | 'peca' | 'servico' | 'visualizar_servico' | 'visualizar_cliente' | 'alerta_revisao' | null>(null);
  const [modalMode, setModalMode] = useState<'criar' | 'editar'>('criar');
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [selectedServico, setSelectedServico] = useState<Servico | null>(null);
  const [selectedCliente, setSelectedCliente] = useState<Cliente | null>(null);
  const [confirmDialog, setConfirmDialog] = useState<{
    title: string;
    message: string;
    confirmText?: string;
    onConfirm: () => void | Promise<void>;
  } | null>(null);

  // Workshop Profile & AI Logo Configurations
  const [workshopNome, setWorkshopNome] = useState<string>('DestakCar');
  const [workshopSlogan, setWorkshopSlogan] = useState<string>('Sua oficina de confiança para manutenção e reparos');
  const [workshopTelefone, setWorkshopTelefone] = useState<string>('(11) 99999-9999');
  const [workshopEndereco, setWorkshopEndereco] = useState<string>('Av. das Nações Unidas, 1234 - São Paulo - SP');
  const [workshopCnpj, setWorkshopCnpj] = useState<string>('12.345.678/0001-99');
  const [workshopLogoStyle, setWorkshopLogoStyle] = useState<'modern' | 'badge' | 'circuit' | 'speed' | 'minimal' | 'destakcar' | 'custom'>('modern');
  const [workshopLogoUrl, setWorkshopLogoUrl] = useState<string | null>(null);
  const [isDragOverLogo, setIsDragOverLogo] = useState<boolean>(false);

  const handleWorkshopLogoUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setWorkshopLogoUrl(reader.result as string);
        setWorkshopLogoStyle('custom');
        triggerToast("Logotipo da empresa adicionado à galeria com sucesso!");
      };
      reader.readAsDataURL(file);
    }
  };

  const handleDragOverLogo = (e: React.DragEvent) => {
    e.preventDefault();
    setIsDragOverLogo(true);
  };

  const handleDragLeaveLogo = () => {
    setIsDragOverLogo(false);
  };

  const handleDropLogo = (e: React.DragEvent) => {
    e.preventDefault();
    setIsDragOverLogo(false);
    const file = e.dataTransfer.files?.[0];
    if (file) {
      if (!file.type.startsWith('image/')) {
        triggerToast("Por favor, selecione apenas arquivos de imagem (PNG, JPG, SVG, GIF).");
        return;
      }
      const reader = new FileReader();
      reader.onloadend = () => {
        setWorkshopLogoUrl(reader.result as string);
        setWorkshopLogoStyle('custom');
        triggerToast("Logotipo da empresa adicionado à galeria com sucesso!");
      };
      reader.readAsDataURL(file);
    }
  };

  // Advanced Search Toggle / States
  const [showAdvancedSearch, setShowAdvancedSearch] = useState<boolean>(false);
  const [searchStartDate, setSearchStartDate] = useState<string>('');
  const [searchEndDate, setSearchEndDate] = useState<string>('');
  const [searchChassi, setSearchChassi] = useState<string>('');
  const [searchFornecedor, setSearchFornecedor] = useState<string>('');
  const [searchCategory, setSearchCategory] = useState<string>('todos');

  // Push Notifications Trailer & Registered Devices tray
  const [notificacoesPush, setNotificacoesPush] = useState<NotificacaoPush[]>([]);
  const [dispositivos, setDispositivos] = useState<Dispositivo[]>([]);
  const [showDeviceRegister, setShowDeviceRegister] = useState<boolean>(false);
  const [tempDeviceName, setTempDeviceName] = useState<string>('Meu Computador Workspace');
  const [tempDevicePlatform, setTempDevicePlatform] = useState<'desktop' | 'android' | 'ios'>('desktop');

  // Live Advanced Search Filter Engine
  const getSearchMatches = () => {
    const query = searchQuery ? searchQuery.toLowerCase().trim() : '';
    const results: { type: 'cliente' | 'veiculo' | 'servico' | 'peca'; label: string; data: any }[] = [];

    // 1. Clientes
    clientes.forEach(c => {
      const matchQuery = !query || 
        c.nome.toLowerCase().includes(query) || 
        (c.cpf_cnpj && c.cpf_cnpj.toLowerCase().includes(query)) ||
        (c.email && c.email.toLowerCase().includes(query)) ||
        (c.telefone && c.telefone.toLowerCase().includes(query));
      
      const matchDate = (!searchStartDate || c.criado_em >= searchStartDate) && 
                        (!searchEndDate || c.criado_em <= searchEndDate + 'T23:59:59');

      if (matchQuery && matchDate) {
        results.push({ type: 'cliente', label: 'Cliente', data: c });
      }
    });

    // 2. Veículos
    veiculos.forEach(v => {
      const matchQuery = !query || 
        v.placa.toLowerCase().includes(query) || 
        v.modelo.toLowerCase().includes(query) || 
        v.marca.toLowerCase().includes(query) ||
        (v.chassi && v.chassi.toLowerCase().includes(query));

      const matchChassi = !searchChassi || (v.chassi && v.chassi.toLowerCase().includes(searchChassi.toLowerCase()));
      const matchDate = (!searchStartDate || v.criado_em >= searchStartDate) && 
                        (!searchEndDate || v.criado_em <= searchEndDate + 'T23:59:59');

      if (matchQuery && matchChassi && matchDate) {
        results.push({ type: 'veiculo', label: 'Veículo', data: v });
      }
    });

    // 3. Orçamentos / Serviços
    servicos.forEach(s => {
      const matchQuery = !query || 
        s.id.toLowerCase().includes(query) || 
        s.descricao.toLowerCase().includes(query) ||
        (s.cliente_nome && s.cliente_nome.toLowerCase().includes(query)) ||
        (s.veiculo_placa && s.veiculo_placa.toLowerCase().includes(query));

      const matchStatus = statusFilter === 'todos' || s.status === statusFilter;
      const matchDate = (!searchStartDate || s.criado_em >= searchStartDate) && 
                        (!searchEndDate || s.criado_em <= searchEndDate + 'T23:59:59');

      if (matchQuery && matchStatus && matchDate) {
        results.push({ type: 'servico', label: 'Orçamento', data: s });
      }
    });

    // 4. Peças
    pecas.forEach(p => {
      const matchQuery = !query || 
        p.nome.toLowerCase().includes(query) || 
        p.codigo.toLowerCase().includes(query) ||
        (p.fornecedor && p.fornecedor.toLowerCase().includes(query)) ||
        p.categoria.toLowerCase().includes(query);

      const matchCategory = searchCategory === 'todos' || p.categoria.toLowerCase() === searchCategory.toLowerCase();
      const matchFornecedor = !searchFornecedor || (p.fornecedor && p.fornecedor.toLowerCase().includes(searchFornecedor.toLowerCase()));
      const matchDate = (!searchStartDate || p.criado_em >= searchStartDate) && 
                        (!searchEndDate || p.criado_em <= searchEndDate + 'T23:59:59');

      if (matchQuery && matchCategory && matchFornecedor && matchDate) {
        results.push({ type: 'peca', label: 'Peça de Estoque', data: p });
      }
    });

    return results;
  };

  // Alertas de Revisão State
  const [alertas, setAlertas] = useState<any[]>([]);
  const [alertaFilter, setAlertaFilter] = useState<'todos' | 'pendente' | 'notificado' | 'concluido' | 'atrasado'>('todos');
  const [formAlerta, setFormAlerta] = useState({
    cliente_id: '',
    veiculo_id: '',
    tipo_revisao: 'Troca de Óleo',
    data_alerta: '',
    km_alerta: '',
    descricao: '',
  });
  const [notifyingAlerta, setNotifyingAlerta] = useState<any | null>(null);

  // Form Fields - Cliente
  const [formCliente, setFormCliente] = useState({
    nome: '',
    email: '',
    telefone: '',
    cpf_cnpj: '',
    endereco: '',
  });

  // Form Fields - Veiculo
  const [formVeiculo, setFormVeiculo] = useState({
    cliente_id: '',
    placa: '',
    modelo: '',
    marca: '',
    ano: new Date().getFullYear(),
    cor: '',
    chassi: '',
  });

  // Form Fields - Peca
  const [formPeca, setFormPeca] = useState({
    nome: '',
    codigo: '',
    quantidade: 0,
    preco_custo: 0,
    preco_venda: 0,
    categoria: '',
    limite_minimo: 5,
    fornecedor: '',
  });

  // Form Fields - Servico / Orçamento
  const [formServico, setFormServico] = useState({
    cliente_id: '',
    veiculo_id: '',
    descricao: '',
    status: 'orcamento' as 'orcamento' | 'em_andamento' | 'aguardando_pecas' | 'concluido' | 'cancelado',
    mao_de_obra_valor: 0,
    mecanico_id: '',
    checklist: {
      combustivel: 'Não Informado',
      riscos: false,
      luzPainel: false,
      estepe: false,
      documento: false
    }
  });
  const [formPecasUsadas, setFormPecasUsadas] = useState<PecaUsada[]>([]);
  const [tempPecaId, setTempPecaId] = useState<string>('');
  const [tempPecaQtd, setTempPecaQtd] = useState<number>(1);
  const [clienteSearch, setClienteSearch] = useState<string>('');
  const [pecaSearchForm, setPecaSearchForm] = useState<string>('');
  const [pecaCategoryForm, setPecaCategoryForm] = useState<string>('todos');

  // Status Alerts helper
  const [successToast, setSuccessToast] = useState<string | null>(null);

  const triggerToast = (msg: string) => {
    setSuccessToast(msg);
    setTimeout(() => {
      setSuccessToast(null);
    }, 3500);
  };

  const checkSession = async () => {
    try {
      try {
        const creds = getSupabaseCredentials();
        setSupabaseUrl(creds.url);
        setSupabaseKey(creds.key);
        setDbMode(getDatabaseMode());
      } catch (e) {
        console.error('Erro ao inicializar chaves Supabase:', e);
      }

      const u = await getCurrentUser();
      setCurrentUser(u);
      if (u) {
        await loadData();
      } else {
        setLoading(false);
      }
    } catch (e) {
      console.error('Erro ao buscar sessão do usuário:', e);
      setLoading(false);
    }
  };

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setAuthLoading(true);
    setAuthError(null);
    setAuthSuccess(null);
    try {
      const u = await signInUser(authEmail, authPassword);
      setCurrentUser(u);
      triggerToast(`Bem-vindo de volta, ${u.nome}!`);
      setAuthEmail('');
      setAuthPassword('');
      // After login, we fetch and hydrate state
      await loadData(false, u);
      
      const creds = getSupabaseCredentials();
      setSupabaseUrl(creds.url);
      setSupabaseKey(creds.key);
      setDbMode(getDatabaseMode());
    } catch (err: any) {
      setAuthError(err.message || 'Erro ao realizar login.');
    } finally {
      setAuthLoading(false);
    }
  };

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    setAuthLoading(true);
    setAuthError(null);
    setAuthSuccess(null);
    try {
      const u = await signUpUser(authEmail, authPassword, authNome, 'Mecânico');
      setCurrentUser(u);
      triggerToast(`Conta criada! Bem-vindo, ${u.nome}!`);
      setAuthEmail('');
      setAuthPassword('');
      setAuthNome('');
      // After register/login, we fetch and hydrate state
      await loadData(false, u);
      
      const creds = getSupabaseCredentials();
      setSupabaseUrl(creds.url);
      setSupabaseKey(creds.key);
      setDbMode(getDatabaseMode());
    } catch (err: any) {
      setAuthError(err.message || 'Erro ao realizar cadastro.');
    } finally {
      setAuthLoading(false);
    }
  };

  const handleForgotPassword = async (e: React.FormEvent) => {
    e.preventDefault();
    setAuthLoading(true);
    setAuthError(null);
    setAuthSuccess(null);
    setShowEmailSimulation(false);
    try {
      const isSupabase = getDatabaseMode() === 'supabase';
      await resetPasswordForEmail(authEmail);
      if (isSupabase) {
        setAuthSuccess(`Instruções enviadas para o e-mail "${authEmail}". Verifique sua caixa de entrada.`);
        setShowEmailSimulation(true);
      } else {
        setAuthSuccess(`Workspace Offline: Seu e-mail "${authEmail}" foi validado. Ativando simulador de recuperação...`);
        setShowEmailSimulation(true);
      }
    } catch (err: any) {
      setAuthError(err.message || 'Erro ao processar pedido de redefinição.');
      // Keep simulation available as an interactive design preview/fallback
      setShowEmailSimulation(true);
    } finally {
      setAuthLoading(false);
    }
  };

  const handleResetPassword = async (e: React.FormEvent) => {
    e.preventDefault();
    if (authPassword !== authConfirmPassword) {
      setAuthError('As senhas digitadas não coincidem. Por favor, verifique.');
      return;
    }
    if (authPassword.length < 6) {
      setAuthError('A senha corporativa precisa ter no mínimo 6 caracteres por segurança.');
      return;
    }
    setAuthLoading(true);
    setAuthError(null);
    setAuthSuccess(null);
    try {
      await updateUserPassword(authPassword);
      triggerToast('Sua senha foi redefinida com sucesso!');
      setAuthMode('login');
      setAuthPassword('');
      setAuthConfirmPassword('');
      setAuthEmail('');
      setShowEmailSimulation(false);
      if (typeof window !== 'undefined') {
        window.history.pushState("", document.title, window.location.pathname + window.location.search);
      }
    } catch (err: any) {
      setAuthError(err.message || 'Erro ao gravar nova senha.');
    } finally {
      setAuthLoading(false);
    }
  };

  const handleLogout = async () => {
    try {
      await signOutUser();
      setCurrentUser(null);
      triggerToast('Sessão encerrada com sucesso.');
    } catch (e) {
      console.error('Erro ao fazer logout:', e);
    }
  };

  // Load all data
  const loadData = async (isManual?: boolean, activeUser?: Usuario | null) => {
    try {
      if (isManual) {
        setLoading(true);
      }
      const user = activeUser !== undefined ? activeUser : currentUser;
      const c = await fetchClientes();
      const v = await fetchVeiculos();
      const p = await fetchPecas();
      const s = await fetchServicos();
      const u = await fetchUsuarios();

      let filteredServicos = s;
      let filteredVeiculos = v;

      if (user?.funcao === 'Mecânico') {
        filteredServicos = s.filter(serv => serv.mecanico_id === user.id);
        const relatedVeiculoIds = new Set(filteredServicos.map(serv => serv.veiculo_id));
        filteredVeiculos = v.filter(veic => relatedVeiculoIds.has(veic.id));
      }

      const dashboardStats = await getDashboardStats(filteredServicos, p);

      setClientes(c);
      setVeiculos(filteredVeiculos);
      setPecas(p);
      setServicos(filteredServicos);
      setUsersList(u);
      setStats(dashboardStats);

      // Load and enrich Alertas de Revisão
      if (typeof window !== 'undefined') {
        const rawAlerts = window.localStorage.getItem('destakcar_alertas_revisao');
        let parsedAlerts: any[] = [];
        if (rawAlerts) {
          try {
            parsedAlerts = JSON.parse(rawAlerts);
          } catch (_) {}
        } else {
          // Seed initial realistic alerts using loaded vehicles
          const baseTime = new Date().getTime();
          parsedAlerts = [
            {
              id: 'al-1',
              veiculo_id: v[0]?.id || 'v1',
              cliente_id: v[0]?.cliente_id || 'c1',
              tipo_revisao: 'Troca de Óleo & Filtro',
              data_alerta: new Date(baseTime - 5 * 24 * 60 * 60 * 1000).toISOString().split('T')[0], // 5 days ago (Overdue)
              km_alerta: 65000,
              descricao: 'Troca preventiva de lubrificante recomendada a cada 10.000km ou 6 meses.',
              status: 'pendente',
              criado_em: new Date().toISOString(),
            },
            {
              id: 'al-2',
              veiculo_id: v[1]?.id || 'v2',
              cliente_id: v[1]?.cliente_id || 'c2',
              tipo_revisao: 'Conjunto de Pastilhas de Freio',
              data_alerta: new Date(baseTime + 8 * 24 * 60 * 60 * 1000).toISOString().split('T')[0], // 8 days from now
              km_alerta: 32000,
              descricao: 'Medicações efetuadas apontam desgaste severo próximo ao limite crítico.',
              status: 'pendente',
              criado_em: new Date().toISOString(),
            },
            {
              id: 'al-3',
              veiculo_id: v[2]?.id || 'v3',
              cliente_id: v[2]?.cliente_id || 'c3',
              tipo_revisao: 'Revisão Periódica Completa',
              data_alerta: new Date(baseTime + 25 * 24 * 60 * 60 * 1000).toISOString().split('T')[0], // 25 days from now
              km_alerta: 45000,
              descricao: 'Alinhamento, balanceamento, limpeza preventiva dos injetores e teste de fluido.',
              status: 'notificado',
              notificado_em: new Date(baseTime - 1 * 24 * 60 * 60 * 1000).toISOString(),
              criado_em: new Date().toISOString(),
            }
          ];
          window.localStorage.setItem('destakcar_alertas_revisao', JSON.stringify(parsedAlerts));
        }
        setAlertas(parsedAlerts);
      }
      
      const creds = getSupabaseCredentials();
      setSupabaseUrl(creds.url);
      setSupabaseKey(creds.key);
      setDbMode(getDatabaseMode());
    } catch (e) {
      console.error('Erro ao buscar dados:', e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    // 1. Detectar parâmetros diretos na query string ou no hash da URL para redirecionamento precoce
    if (typeof window !== 'undefined') {
      const hash = window.location.hash;
      const search = window.location.search;
      if (
        (hash && (hash.includes('access_token=') || hash.includes('type=recovery') || hash.includes('error_description=') || hash.includes('code='))) ||
        (search && (search.includes('type=recovery') || search.includes('error_description=') || search.includes('code=')))
      ) {
        let redirectUrl = '/reset-password';
        if (search || hash) {
          redirectUrl += `${search}${hash}`;
        }
        router.push(redirectUrl);
        return;
      }
    }

    // 2. Registrar listener robusto de alteração de estado do Supabase Auth para escutar redefinições de senha
    let authSubscription: any = null;
    try {
      const client = getSupabaseClient();
      if (client) {
        const { data } = client.auth.onAuthStateChange(async (event: any, session: any) => {
          const hasRecoveryHash = typeof window !== 'undefined' && (window.location.hash.includes('type=recovery') || window.location.search.includes('type=recovery') || window.location.search.includes('code='));
          if (event === 'PASSWORD_RECOVERY' || (session && event === 'SIGNED_IN' && hasRecoveryHash)) {
            const hash = window.location.hash;
            const search = window.location.search;
            let redirectUrl = '/reset-password';
            if (search || hash) {
              redirectUrl += `${search}${hash}`;
            }
            router.push(redirectUrl);
          }
        });
        authSubscription = data?.subscription;
      }
    } catch (e) {
      console.error('Erro ao registrar listener de redefinição de senha:', e);
    }

    const timer = setTimeout(() => {
      checkSession();
    }, 0);

    return () => {
      clearTimeout(timer);
      if (authSubscription) {
        authSubscription.unsubscribe();
      }
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Theme Loader Effect
  useEffect(() => {
    if (typeof window !== 'undefined') {
      const storedTheme = window.localStorage.getItem('destakcar_theme');
      const isDark = storedTheme === 'dark' || (!storedTheme && window.matchMedia('(prefers-color-scheme: dark)').matches);
      setTimeout(() => {
        setDarkMode(isDark);
      }, 0);
      if (isDark) {
        document.documentElement.classList.add('dark');
      } else {
        document.documentElement.classList.remove('dark');
      }
    }
  }, []);

  const toggleDarkMode = () => {
    const nextVal = !darkMode;
    setDarkMode(nextVal);
    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_theme', nextVal ? 'dark' : 'light');
      if (nextVal) {
        document.documentElement.classList.add('dark');
      } else {
        document.documentElement.classList.remove('dark');
      }
      triggerToast(`Modo ${nextVal ? 'Escuro' : 'Claro'} ativado!`);
    }
  };

  // Load custom workshop billing & AI logo profile settings
  useEffect(() => {
    if (typeof window !== 'undefined') {
      const stored = window.localStorage.getItem('destakcar_oficina_perfil');
      if (stored) {
        try {
          const parsed = JSON.parse(stored);
          const deferTimer = setTimeout(() => {
            if (parsed.nome) setWorkshopNome(parsed.nome);
            if (parsed.slogan) setWorkshopSlogan(parsed.slogan);
            if (parsed.telefone) setWorkshopTelefone(parsed.telefone);
            if (parsed.endereco) setWorkshopEndereco(parsed.endereco);
            if (parsed.cnpj) setWorkshopCnpj(parsed.cnpj);
            if (parsed.logoStyle) setWorkshopLogoStyle(parsed.logoStyle);
            if (parsed.logoUrl) setWorkshopLogoUrl(parsed.logoUrl);
          }, 30);
          return () => clearTimeout(deferTimer);
        } catch (_) {}
      }
    }
  }, []);

  // Handle saving the workshop profile (billing & AI logo config)
  const handleSaveWorkshopProfile = (e: React.FormEvent) => {
    e.preventDefault();
    if (!workshopNome.trim()) {
      triggerToast("O nome da oficina não pode estar vazio.");
      return;
    }
    try {
      if (typeof window !== 'undefined') {
        const payload = {
          nome: workshopNome.trim(),
          slogan: workshopSlogan.trim(),
          telefone: workshopTelefone.trim(),
          endereco: workshopEndereco.trim(),
          cnpj: workshopCnpj.trim(),
          logoStyle: workshopLogoStyle,
          logoUrl: workshopLogoUrl
        };
        window.localStorage.setItem('destakcar_oficina_perfil', JSON.stringify(payload));
        triggerToast("Informações e logotipo da oficina salvos com sucesso!");
      }
    } catch (err: any) {
      console.error("Erro ao salvar dados da oficina:", err);
      triggerToast("Erro ao salvar: " + (err.message || err));
    }
  };

  // Synchronize profile form states when logged-in user changes (asynchronously to prevent cascading render cycles)
  useEffect(() => {
    if (currentUser) {
      const targetName = currentUser.nome || '';
      const targetAvatar = currentUser.avatar_url || '';
      const deferTimer = setTimeout(() => {
        setProfileName(targetName);
        setProfileAvatarPreview(targetAvatar);
        setProfileAvatarFile(null);
      }, 50);
      return () => clearTimeout(deferTimer);
    }
  }, [currentUser]);

  // Handle saving the user profile (full name & avatar image)
  const handleSaveProfile = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!profileName.trim()) {
      triggerToast("O nome do perfil não pode estar vazio.");
      return;
    }
    setProfileSubmitting(true);
    try {
      const updated = await updateUserProfile(profileName.trim(), profileAvatarFile);
      setCurrentUser(updated);
      triggerToast("Perfil atualizado com sucesso!");
      // Reset the uploaded file but keep the preview URL returned from Server/Data payload
      setProfileAvatarFile(null);
      if (updated.avatar_url) {
        setProfileAvatarPreview(updated.avatar_url);
      }
    } catch (err: any) {
      console.error("Erro ao atualizar perfil:", err);
      triggerToast("Erro ao atualizar perfil: " + (err.message || err));
    } finally {
      setProfileSubmitting(false);
    }
  };

  // Handle updated password securely via direct custom table updating
  const handleChangeMyPassword = async (e: React.FormEvent) => {
    e.preventDefault();
    if (newPassword.length < 6) {
      triggerToast("A nova senha deve ter no mínimo 6 caracteres.");
      return;
    }
    if (newPassword !== confirmNewPassword) {
      triggerToast("As senhas informadas não coincidem.");
      return;
    }
    try {
      setPasswordSubmitting(true);
      const success = await updateUserPassword(newPassword);
      if (success) {
        triggerToast("Sua senha foi alterada com sucesso!");
        setNewPassword('');
        setConfirmNewPassword('');
      }
    } catch (err: any) {
      console.error("Erro ao alterar senha:", err);
      triggerToast("Erro ao alterar senha: " + (err.message || err));
    } finally {
      setPasswordSubmitting(false);
    }
  };

  // Promote currently logged-in user to/from Administrator immediately
  const handlePromoteSelf = async () => {
    if (!currentUser) return;
    try {
      setLoadingUsers(true);
      const isCurrentlyAdmin = currentUser.funcao === 'Administrador';
      const targetRole = isCurrentlyAdmin ? 'Mecânico' : 'Administrador';
      
      const success = await updateUsuarioFuncao(currentUser.id, targetRole);
      if (success) {
        // Sync the current user state
        const updatedUser = { ...currentUser, funcao: targetRole };
        setCurrentUser(updatedUser);
        triggerToast(`Seu perfil foi alterado de cargo para: ${targetRole}!`);
        // Refresh users list
        const updatedList = await fetchUsuarios();
        setUsersList(updatedList);
      }
    } catch (err: any) {
      console.error("Erro ao alterar próprio cargo:", err);
      triggerToast("Erro ao alterar próprio cargo: " + (err.message || err));
    } finally {
      setLoadingUsers(false);
    }
  };

  // Change another user's role/function
  const handleUpdateUserRole = async (userId: string, newFuncao: string) => {
    try {
      setLoadingUsers(true);
      const success = await updateUsuarioFuncao(userId, newFuncao);
      if (success) {
        triggerToast(`Cargo atualizado com sucesso!`);
        // Sync active user if it was themselves
        if (currentUser && currentUser.id === userId) {
          setCurrentUser({ ...currentUser, funcao: newFuncao });
        }
        // Refresh user lists
        const updatedList = await fetchUsuarios();
        setUsersList(updatedList);
      }
    } catch (err: any) {
      console.error("Erro ao atualizar cargo do usuário:", err);
      triggerToast("Erro ao atualizar cargo: " + (err.message || err));
    } finally {
      setLoadingUsers(false);
    }
  };

  // Safe save config to localstorage
  const handleSaveDBConfig = (e: React.FormEvent) => {
    e.preventDefault();
    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_supabase_url', supabaseUrl);
      window.localStorage.setItem('destakcar_supabase_key', supabaseKey);
      window.localStorage.setItem('distakcar_supabase_url', supabaseUrl);
      window.localStorage.setItem('distakcar_supabase_key', supabaseKey);
      triggerToast('Configurações de banco de dados atualizadas! Recarregando...');
      setTimeout(() => {
        window.location.reload();
      }, 1000);
    }
  };

  const handleClearDBConfig = () => {
    if (typeof window !== 'undefined') {
      window.localStorage.removeItem('destakcar_supabase_url');
      window.localStorage.removeItem('destakcar_supabase_key');
      window.localStorage.removeItem('distakcar_supabase_url');
      window.localStorage.removeItem('distakcar_supabase_key');
      triggerToast('Configurações do Supabase removidas! Recarregando...');
      setTimeout(() => {
        window.location.reload();
      }, 1000);
    }
  };

  const handleTestLatency = async () => {
    setLatencyTesting(true);
    setLatencyResult(null);
    try {
      const res = await testDatabaseLatency();
      setLatencyResult({
        tested: true,
        success: res.success,
        latencyMs: res.latencyMs,
        error: res.error
      });
    } catch (e: any) {
      setLatencyResult({
        tested: true,
        success: false,
        error: e.message || 'Erro inesperado ao testar conexão'
      });
    } finally {
      setLatencyTesting(false);
    }
  };

  const handleResetLocal = async () => {
    setConfirmDialog({
      title: 'Restaurar Dados Iniciais',
      message: 'Tem certeza de que deseja restaurar as tabelas e dados demonstrativos iniciais? Todas as novas alterações serão limpas.',
      confirmText: 'Restaurar',
      onConfirm: async () => {
        await clearAllLocalDatabase();
        setConfirmDialog(null);
        triggerToast('Dados demonstrativos restaurados! Recarregando...');
        setTimeout(() => {
          if (typeof window !== 'undefined') window.location.reload();
        }, 1000);
      }
    });
  };

  // Helper formats
  const formatCurrency = (val: number) => {
    return new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(val);
  };

  const formatDate = (isoStr: string) => {
    if (!isoStr) return '-';
    const date = new Date(isoStr);
    return date.toLocaleDateString('pt-BR', {
      day: '2-digit',
      month: '2-digit',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  };

  // ==========================================
  // CRUD Action Hooks & Handlers
  // ==========================================

  // Open Add Clientes
  const openClienteModal = (mode: 'criar' | 'editar', item?: Cliente) => {
    setModalMode(mode);
    if (mode === 'editar' && item) {
      setSelectedId(item.id);
      setFormCliente({
        nome: item.nome,
        email: item.email || '',
        telefone: item.telefone || '',
        cpf_cnpj: item.cpf_cnpj || '',
        endereco: item.endereco || '',
      });
    } else {
      setSelectedId(null);
      setFormCliente({
        nome: '',
        email: '',
        telefone: '',
        cpf_cnpj: '',
        endereco: '',
      });
    }
    setActiveModal('cliente');
  };

  // Submit Clientes
  const handleSaveCliente = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!formCliente.nome.trim()) return;

    if (formCliente.cpf_cnpj.trim()) {
      const validation = getCpfCnpjValidation(formCliente.cpf_cnpj);
      if (validation.isError) {
        triggerToast(`Documento inválido: ${validation.message}`);
        return;
      }
    }

    try {
      if (modalMode === 'criar') {
        await createCliente(formCliente);
        triggerToast('Cliente cadastrado com sucesso!');
      } else if (modalMode === 'editar' && selectedId) {
        await updateCliente(selectedId, formCliente);
        triggerToast('Cliente atualizado com sucesso!');
      }
      setActiveModal(null);
      loadData();
    } catch (err) {
      alert('Erro ao salvar cliente.');
    }
  };

  const handleDeleteCliente = async (id: string, name: string) => {
    if (currentUser?.funcao === 'Mecânico') {
      triggerToast("Acesso Negado: Colaboradores com o cargo 'Mecânico' não têm permissão para excluir clientes!");
      return;
    }
    setConfirmDialog({
      title: 'Excluir Cliente',
      message: `Excluir o cliente "${name}"? Isso também removerá permanentemente todos os seus veículos cadastrados.`,
      confirmText: 'Excluir Cliente',
      onConfirm: async () => {
        await deleteCliente(id);
        triggerToast('Cliente removido!');
        setConfirmDialog(null);
        loadData();
      }
    });
  };

  // Alertas de Revisão logic
  const openAlertaModal = (mode: 'criar' | 'editar', item?: any) => {
    setModalMode(mode);
    if (mode === 'editar' && item) {
      setSelectedId(item.id);
      setFormAlerta({
        cliente_id: item.cliente_id || '',
        veiculo_id: item.veiculo_id,
        tipo_revisao: item.tipo_revisao,
        data_alerta: item.data_alerta,
        km_alerta: item.km_alerta ? String(item.km_alerta) : '',
        descricao: item.descricao || '',
      });
    } else {
      setSelectedId(null);
      const defaultClient = item?.cliente_id || (item?.veiculo_id ? veiculos.find(v => v.id === item.veiculo_id)?.cliente_id : '') || clientes[0]?.id || '';
      const defaultVeic = item?.veiculo_id || veiculos.filter(v => v.cliente_id === defaultClient)[0]?.id || veiculos[0]?.id || '';

      setFormAlerta({
        cliente_id: defaultClient,
        veiculo_id: defaultVeic,
        tipo_revisao: item?.tipo_revisao || 'Troca de Óleo',
        data_alerta: item?.data_alerta || new Date().toISOString().split('T')[0],
        km_alerta: item?.km_alerta || '',
        descricao: item?.descricao || '',
      });
    }
    setActiveModal('alerta_revisao');
  };

  const handleSaveAlerta = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formAlerta.veiculo_id || !formAlerta.tipo_revisao || !formAlerta.data_alerta) {
      alert('Por favor, preencha o veículo, o tipo de revisão e a data do alerta.');
      return;
    }

    const selectedVeic = veiculos.find(v => v.id === formAlerta.veiculo_id);
    if (!selectedVeic) {
      alert('Veículo inválido.');
      return;
    }

    const novoAlerta = {
      id: modalMode === 'criar' ? generateRandomId('al-') : selectedId!,
      veiculo_id: formAlerta.veiculo_id,
      cliente_id: selectedVeic.cliente_id,
      tipo_revisao: formAlerta.tipo_revisao,
      data_alerta: formAlerta.data_alerta,
      km_alerta: formAlerta.km_alerta ? Number(formAlerta.km_alerta) : undefined,
      descricao: formAlerta.descricao,
      status: modalMode === 'criar' ? 'pendente' : (alertas.find(a => a.id === selectedId)?.status || 'pendente'),
      criado_em: modalMode === 'criar' ? new Date().toISOString() : (alertas.find(a => a.id === selectedId)?.criado_em || new Date().toISOString()),
      notificado_em: modalMode === 'criar' ? undefined : alertas.find(a => a.id === selectedId)?.notificado_em,
    };

    let updatedList = [...alertas];
    if (modalMode === 'criar') {
      updatedList.unshift(novoAlerta);
      triggerToast('Alerta de revisão criado com sucesso!');
    } else {
      const idx = updatedList.findIndex(a => a.id === selectedId);
      if (idx !== -1) {
        updatedList[idx] = novoAlerta;
        triggerToast('Alerta de revisão atualizado com sucesso!');
      }
    }

    setAlertas(updatedList);
    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_alertas_revisao', JSON.stringify(updatedList));
    }
    setActiveModal(null);
  };

  const handleDeleteAlerta = (id: string, revisionType: string) => {
    if (currentUser?.funcao === 'Mecânico') {
      triggerToast("Acesso Negado: Colaboradores com o cargo 'Mecânico' não têm permissão para excluir alertas de revisão!");
      return;
    }
    setConfirmDialog({
      title: 'Remover Alerta de Revisão',
      message: `Deseja realmente remover o alerta de revisão do tipo "${revisionType}"?`,
      confirmText: 'Remover Alerta',
      onConfirm: () => {
        const updated = alertas.filter(a => a.id !== id);
        setAlertas(updated);
        if (typeof window !== 'undefined') {
          window.localStorage.setItem('destakcar_alertas_revisao', JSON.stringify(updated));
        }
        triggerToast('Alerta de revisão excluído com sucesso.');
        setConfirmDialog(null);
      }
    });
  };

  const handleCompleteAlerta = (id: string) => {
    const updated = alertas.map(a => {
      if (a.id === id) {
        return { ...a, status: 'concluido' as const };
      }
      return a;
    });
    setAlertas(updated);
    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_alertas_revisao', JSON.stringify(updated));
    }
    triggerToast('Manutenção concluída! Alerta marcado como resolvido.');
  };

  const handleNotifyAlerta = (item: any) => {
    setNotifyingAlerta(item);
  };

  const confirmNotificationSent = (id: string) => {
    const updated = alertas.map(a => {
      if (a.id === id) {
        return { ...a, status: 'notificado' as const, notificado_em: new Date().toISOString() };
      }
      return a;
    });
    setAlertas(updated);
    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_alertas_revisao', JSON.stringify(updated));
    }
    triggerToast('Notificação registrada com sucesso!');
    setNotifyingAlerta(null);
  };

  // Open Add Veículos
  const openVeiculoModal = (mode: 'criar' | 'editar', item?: Veiculo, prefillClienteId?: string) => {
    setModalMode(mode);
    if (mode === 'editar' && item) {
      setSelectedId(item.id);
      setFormVeiculo({
        cliente_id: item.cliente_id,
        placa: item.placa,
        modelo: item.modelo,
        marca: item.marca,
        ano: item.ano,
        cor: item.cor || '',
        chassi: item.chassi || '',
      });
    } else {
      setSelectedId(null);
      setFormVeiculo({
        cliente_id: prefillClienteId || clientes[0]?.id || '',
        placa: '',
        modelo: '',
        marca: '',
        ano: new Date().getFullYear(),
        cor: '',
        chassi: '',
      });
    }
    setActiveModal('veiculo');
  };

  const validateBrazilianPlate = (placa: string): boolean => {
    const cleaned = placa.trim().toUpperCase().replace(/-/g, '').replace(/\s/g, '');
    const legacyRegex = /^[A-Z]{3}[0-9]{4}$/;
    const mercosulRegex = /^[A-Z]{3}[0-9][A-Z][0-9]{2}$/;
    return legacyRegex.test(cleaned) || mercosulRegex.test(cleaned);
  };

  // Submit Veículo
  const handleSaveVeiculo = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!formVeiculo.modelo.trim() || !formVeiculo.placa.trim() || !formVeiculo.cliente_id) {
      alert('Preencha os campos obrigatórios (Modelo, Placa e Proprietário)');
      return;
    }

    if (!validateBrazilianPlate(formVeiculo.placa)) {
      alert('Erro: A placa informada é inválida!\n\nA placa do veículo deve estar no padrão Mercosul (ex: AAA0A00) ou no formato antigo (ex: AAA-0000). Verifique os caracteres informados.');
      return;
    }

    try {
      if (modalMode === 'criar') {
        const res = await createVeiculo(formVeiculo);
        triggerToast('Veículo cadastrado com sucesso!');
        await dispatchAutomatedPush('Novo Veículo Cadastrado', `O veículo ${res.marca || ''} ${res.modelo} (Placa ${res.placa}) foi registrado no sistema.`, 'veiculo_novo');
      } else if (modalMode === 'editar' && selectedId) {
        await updateVeiculo(selectedId, formVeiculo);
        triggerToast('Veículo atualizado com sucesso!');
      }
      setActiveModal(null);
      loadData();
    } catch (err) {
      alert('Erro ao salvar veículo');
    }
  };

  const handleDeleteVeiculo = async (id: string, placa: string) => {
    if (currentUser?.funcao === 'Mecânico') {
      triggerToast("Acesso Negado: Colaboradores com o cargo 'Mecânico' não têm permissão para excluir veículos!");
      return;
    }
    setConfirmDialog({
      title: 'Excluir Veículo',
      message: `Remover o veículo de placa ${placa}?`,
      confirmText: 'Remover Veículo',
      onConfirm: async () => {
        await deleteVeiculo(id);
        triggerToast('Veículo removido da base de dados!');
        setConfirmDialog(null);
        loadData();
      }
    });
  };

  // Open Add Peças
  const openPecaModal = (mode: 'criar' | 'editar', item?: Peca) => {
    setModalMode(mode);
    if (mode === 'editar' && item) {
      setSelectedId(item.id);
      setFormPeca({
        nome: item.nome,
        codigo: item.codigo,
        quantidade: item.quantidade,
        preco_custo: item.preco_custo,
        preco_venda: item.preco_venda,
        categoria: item.categoria || '',
        limite_minimo: item.limite_minimo,
        fornecedor: item.fornecedor || '',
      });
    } else {
      setSelectedId(null);
      setFormPeca({
        nome: '',
        codigo: '',
        quantidade: 10,
        preco_custo: 0,
        preco_venda: 0,
        categoria: '',
        limite_minimo: 5,
        fornecedor: '',
      });
    }
    setActiveModal('peca');
  };

  // Submit Peça
  const handleSavePeca = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!formPeca.nome.trim() || !formPeca.codigo.trim()) {
      alert('Preencha os campos obrigatórios de Peça.');
      return;
    }

    try {
      if (modalMode === 'criar') {
        try {
          await createPeca(formPeca);
          triggerToast('Peça inserida no estoque!');
          if (formPeca.quantidade <= formPeca.limite_minimo) {
            await dispatchAutomatedPush('Alerta de Estoque Crítico', `A peça ${formPeca.nome} foi cadastrada com estoque baixo (${formPeca.quantidade} unidades).`, 'estoque_baixo');
          }
        } catch (err: any) {
          alert('Erro ao criar peça ou código já existente.');
        }
      } else if (modalMode === 'editar' && selectedId) {
        await updatePeca(selectedId, formPeca);
        triggerToast('Cadastro de peça atualizado!');
        if (formPeca.quantidade <= formPeca.limite_minimo) {
          await dispatchAutomatedPush('Alerta de Estoque Crítico', `Estoque atualizado: a peça ${formPeca.nome} está com apenas ${formPeca.quantidade} unidades.`, 'estoque_baixo');
        }
      }
      setActiveModal(null);
      loadData();
    } catch (err) {
      alert('Erro ao atualizar estoque.');
    }
  };

  const handleDeletePeca = async (id: string, nome: string) => {
    if (currentUser?.funcao === 'Mecânico') {
      triggerToast("Acesso Negado: Colaboradores com o cargo 'Mecânico' não têm permissão para excluir itens do estoque!");
      return;
    }
    setConfirmDialog({
      title: 'Excluir Item do Estoque',
      message: `Excluir permanentemente "${nome}" do controle de estoque?`,
      confirmText: 'Excluir Peça',
      onConfirm: async () => {
        await deletePeca(id);
        triggerToast('Item removido do estoque.');
        setConfirmDialog(null);
        loadData();
      }
    });
  };

  // Open Add Serviços / Orçamentos
  const openServicoModal = (mode: 'criar' | 'editar', item?: Servico, prefill?: { cliente_id?: string; veiculo_id?: string; descricao?: string }) => {
    if (mode === 'criar' && currentUser?.funcao === 'Mecânico') {
      triggerToast("Acesso Negado: Mecânicos não têm permissão para abrir novas ordens de serviço!");
      return;
    }
    setModalMode(mode);
    setTempPecaId('');
    setTempPecaQtd(1);
    setClienteSearch('');
    setPecaSearchForm('');
    setPecaCategoryForm('todos');
  
    if (mode === 'editar' && item) {
      setSelectedId(item.id);
      const defaultChecklist = {
        combustivel: 'Não Informado',
        riscos: false,
        luzPainel: false,
        estepe: false,
        documento: false,
        ...(item.checklist || {})
      };
      setFormServico({
        cliente_id: item.cliente_id || '',
        veiculo_id: item.veiculo_id || '',
        descricao: item.descricao || '',
        status: item.status,
        mao_de_obra_valor: item.mao_de_obra_valor,
        mecanico_id: item.mecanico_id || '',
        checklist: defaultChecklist
      });
      setFormPecasUsadas(item.pecas_usadas || []);
    } else {
      setSelectedId(null);
      const defaultClient = prefill?.cliente_id || clientes[0]?.id || '';
      // Find matching vehicle
      const matchingVehicles = veiculos.filter(v => v.cliente_id === defaultClient);
      
      setFormServico({
        cliente_id: defaultClient,
        veiculo_id: prefill?.veiculo_id || matchingVehicles[0]?.id || '',
        descricao: prefill?.descricao || '',
        status: 'orcamento',
        mao_de_obra_valor: 0,
        mecanico_id: currentUser?.id || '',
        checklist: {
          combustivel: 'Não Informado',
          riscos: false,
          luzPainel: false,
          estepe: false,
          documento: false
        }
      });
      setFormPecasUsadas([]);
    }
    setActiveModal('servico');
  };

  // Handle Client Selection inside Service Form to update available vehicles dropdown
  const handleServicoClienteChange = (cid: string) => {
    const matchedV = veiculos.filter(v => v.cliente_id === cid);
    setFormServico({
      ...formServico,
      cliente_id: cid,
      veiculo_id: matchedV[0]?.id || '',
    });
  };

  // Sync client & vehicle selections on search typing to prevent desynced selection lists
  const handleClienteSearchChange = (val: string) => {
    setClienteSearch(val);
    if (!val) return;
    const s = val.toLowerCase();
    const filtered = clientes.filter(c => {
      const matchesClient = c.nome.toLowerCase().includes(s) ||
        (c.cpf_cnpj && c.cpf_cnpj.toLowerCase().includes(s)) ||
        (c.telefone && c.telefone.toLowerCase().includes(s));
      const matchesVehicle = veiculos.some(v => 
        v.cliente_id === c.id && (
          v.placa.toLowerCase().includes(s) ||
          v.modelo.toLowerCase().includes(s) ||
          (v.marca && v.marca.toLowerCase().includes(s))
        )
      );
      return matchesClient || matchesVehicle;
    });

    if (filtered.length > 0) {
      const isCurrentInFiltered = filtered.some(c => c.id === formServico.cliente_id);
      if (!isCurrentInFiltered) {
        const nextClient = filtered[0];
        const matchedV = veiculos.filter(v => v.cliente_id === nextClient.id);
        setFormServico(prev => ({
          ...prev,
          cliente_id: nextClient.id,
          veiculo_id: matchedV[0]?.id || ''
        }));
      }
    }
  };

  // Add Part usage inside service
  const handleAddPecaToServico = () => {
    if (!tempPecaId) return;
    const item = pecas.find(p => p.id === tempPecaId);
    if (!item) return;

    if (item.quantidade < tempPecaQtd) {
      triggerToast(`Aviso: Quantidade (${tempPecaQtd} un.) excede o estoque disponível de ${item.quantidade} un.`);
    }

    const jaExisteIdx = formPecasUsadas.findIndex(p => p.peca_id === tempPecaId);
    if (jaExisteIdx !== -1) {
      const novaLista = [...formPecasUsadas];
      novaLista[jaExisteIdx].quantidade += Number(tempPecaQtd);
      setFormPecasUsadas(novaLista);
    } else {
      setFormPecasUsadas([
        ...formPecasUsadas,
        {
          peca_id: item.id,
          nome: item.nome,
          quantidade: Number(tempPecaQtd),
          preco_venda: item.preco_venda,
        }
      ]);
    }
    setTempPecaId('');
    setTempPecaQtd(1);
  };

  // Delete Part usage inside service form
  const handleRemovePecaFromServico = (index: number) => {
    const list = [...formPecasUsadas];
    list.splice(index, 1);
    setFormPecasUsadas(list);
  };

  // Compute live totals
  const getFormTotal = () => {
    const partsTotal = formPecasUsadas.reduce((sum, p) => sum + (p.preco_venda * p.quantidade), 0);
    return Number(partsTotal) + Number(formServico.mao_de_obra_valor || 0);
  };

  // Submit Servico Form
  const handleSaveServico = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!formServico.cliente_id || !formServico.veiculo_id || !formServico.descricao.trim()) {
      alert('Favor selecionar o Cliente, o Veículo e descrever o problema/serviço.');
      return;
    }

    const payload = {
      cliente_id: formServico.cliente_id,
      veiculo_id: formServico.veiculo_id,
      descricao: formServico.descricao,
      status: formServico.status,
      mao_de_obra_valor: Number(formServico.mao_de_obra_valor),
      pecas_usadas: formPecasUsadas,
      total: getFormTotal(),
      mecanico_id: formServico.mecanico_id || currentUser?.id || null,
      checklist: formServico.checklist,
    };

    try {
      if (modalMode === 'criar') {
        const added = await createServico(payload);
        triggerToast('Serviço/Orçamento criado com sucesso!');
        await dispatchAutomatedPush('Novo Orçamento Criado', `Um novo orçamento foi registrado para o cliente ${added.cliente_nome || 'cliente'} (O.S. #${added.id.substring(0, 6).toUpperCase()}) no valor de R$ ${added.total.toFixed(2)}.`, 'orcamento');
      } else if (modalMode === 'editar' && selectedId) {
        const updated = await updateServico(selectedId, payload);
        triggerToast('Serviço/Orçamento atualizado!');
        const textStatus = updated.status === 'concluido' ? 'Concluído' : updated.status === 'em_andamento' ? 'Em Andamento' : updated.status === 'aguardando_pecas' ? 'Aguardando Peças' : 'Orçamento';
        await dispatchAutomatedPush('Status de Serviço Atualizado', `A O.S. #${updated.id.substring(0, 6).toUpperCase()} teve o status atualizado para: "${textStatus}".`, 'status_servico');
      }
      setActiveModal(null);
      loadData();
    } catch (err) {
      alert('Erro ao atualizar ordem de serviço.');
    }
  };

  const handleDeleteServico = async (id: string, cod: string) => {
    if (currentUser?.funcao === 'Mecânico') {
      triggerToast("Acesso Negado: Colaboradores com o cargo 'Mecânico' não têm permissão para excluir ordens de serviço!");
      return;
    }
    setConfirmDialog({
      title: 'Excluir Histórico de O.S.',
      message: `Excluir permanentemente o registro de Serviço/Orçamento da O.S. #${cod.toUpperCase()}?`,
      confirmText: 'Apagar Ordem de Serviço',
      onConfirm: async () => {
        await deleteServico(id);
        triggerToast('Registro de serviço apagado.');
        setConfirmDialog(null);
        loadData();
      }
    });
  };

  const STATUS_OPTIONS_LIST = [
    { key: 'orcamento', label: 'Orçamento', style: 'bg-slate-100 text-slate-700 border border-slate-200/50 hover:bg-slate-200/70' },
    { key: 'em_andamento', label: 'Em Execução', style: 'bg-indigo-50 text-indigo-700 border border-indigo-200/50 hover:bg-indigo-100' },
    { key: 'aguardando_pecas', label: 'Aguar. Peças', style: 'bg-amber-55 text-amber-800 border border-amber-200/60 hover:bg-amber-100/70' },
    { key: 'concluido', label: 'Concluído', style: 'bg-emerald-55 text-emerald-800 border border-emerald-200/60 hover:bg-emerald-100' },
    { key: 'cancelado', label: 'Cancelado', style: 'bg-rose-55 text-rose-700 border border-rose-200/60 hover:bg-rose-100' }
  ];

  const getStatusBadgeStyle = (status: string) => {
    switch (status) {
      case 'orcamento': return 'bg-slate-100 text-slate-700 border border-slate-200/60';
      case 'em_andamento': return 'bg-indigo-50 text-indigo-700 border border-indigo-200/55';
      case 'aguardando_pecas': return 'bg-amber-50 text-amber-700 border border-amber-200/55';
      case 'concluido': return 'bg-emerald-50 text-emerald-700 border border-emerald-200/55';
      case 'cancelado': return 'bg-rose-50 text-rose-600 border border-rose-200/55';
      default: return 'bg-slate-100 text-slate-800 border border-slate-200/55';
    }
  };

  const decodeStatusLabel = (status: string) => {
    switch (status) {
      case 'orcamento': return 'Orçamento';
      case 'em_andamento': return 'Em Execução';
      case 'aguardando_pecas': return 'Aguard. Peças';
      case 'concluido': return 'Concluído';
      case 'cancelado': return 'Cancelado';
      default: return status;
    }
  };

  const handleUpdateStatus = async (id: string, newStatus: 'orcamento' | 'em_andamento' | 'aguardando_pecas' | 'concluido' | 'cancelado') => {
    try {
      const existing = servicos.find(s => s.id === id);
      if (!existing) return;
      
      const updated = await updateServico(id, { status: newStatus });
      triggerToast(`Status da O.S. #${id.substring(0, 6).toUpperCase()} alterado para: ${decodeStatusLabel(newStatus)}!`);
      
      const textStatus = newStatus === 'concluido' ? 'Concluído' : newStatus === 'em_andamento' ? 'Em Andamento' : newStatus === 'aguardando_pecas' ? 'Aguardando Peças' : 'Cancelado';
      await dispatchAutomatedPush('Status de Serviço Atualizado', `A O.S. #${id.substring(0, 6).toUpperCase()} teve o status atualizado para: "${textStatus}".`, 'status_servico');
      
      loadData();
    } catch (err) {
      console.error(err);
      triggerToast('Erro de conexão ao alterar o status do serviço.');
    }
  };

  // Filter lists based on Queries
  const filteredClientes = clientes.filter(c => 
    c.nome.toLowerCase().includes(searchQuery.toLowerCase()) ||
    (c.email && c.email.toLowerCase().includes(searchQuery.toLowerCase())) ||
    (c.telefone && c.telefone.includes(searchQuery)) ||
    (c.cpf_cnpj && c.cpf_cnpj.includes(searchQuery))
  );

  const filteredVeiculos = veiculos.filter(v => 
    v.modelo.toLowerCase().includes(searchQuery.toLowerCase()) ||
    v.marca.toLowerCase().includes(searchQuery.toLowerCase()) ||
    v.placa.toLowerCase().includes(searchQuery.toLowerCase()) ||
    (v.cliente_nome && v.cliente_nome.toLowerCase().includes(searchQuery.toLowerCase()))
  );

  const filteredPecas = pecas.filter(p => {
    const matchesSearch = p.nome.toLowerCase().includes(searchQuery.toLowerCase()) ||
                          p.codigo.toLowerCase().includes(searchQuery.toLowerCase()) ||
                          (p.categoria && p.categoria.toLowerCase().includes(searchQuery.toLowerCase()));
    
    const matchesCategory = stockCategoryFilter === 'todos' || 
                            (p.categoria && p.categoria.toLowerCase() === stockCategoryFilter.toLowerCase());
    
    if (stockFilter === 'baixo') {
      return matchesSearch && matchesCategory && p.quantidade <= p.limite_minimo;
    }
    return matchesSearch && matchesCategory;
  });

  const filteredServicos = servicos.filter(s => {
    const matchesSearch = s.descricao.toLowerCase().includes(searchQuery.toLowerCase()) ||
                          (s.cliente_nome && s.cliente_nome.toLowerCase().includes(searchQuery.toLowerCase())) ||
                          (s.veiculo_placa && s.veiculo_placa.toLowerCase().includes(searchQuery.toLowerCase())) ||
                          (s.veiculo_modelo && s.veiculo_modelo.toLowerCase().includes(searchQuery.toLowerCase()));
    
    if (statusFilter !== 'todos') {
      return matchesSearch && s.status === statusFilter;
    }
    return matchesSearch;
  });

  // Calculate stats on the fly if needed
  const availableCategories = Array.from(new Set(pecas.map(p => p.categoria).filter(Boolean)));

  const handlePrintService = () => {
    try {
      window.print();
    } catch (e) {
      console.warn("window.print() blocked by environment sandbox:", e);
      triggerToast("Impressora restrita no Iframe. Se a janela de impressão não abrir, use o botão 'Abrir em Nova Aba' no topo da tela.");
    }
  };

  const getFilteredReports = () => {
    return servicos.filter(s => {
      if (s.criado_em) {
        const sDate = s.criado_em.split('T')[0];
        if (reportStartDate && sDate < reportStartDate) return false;
        if (reportEndDate && sDate > reportEndDate) return false;
      }
      if (reportClienteId !== 'todos' && s.cliente_id !== reportClienteId) {
        return false;
      }
      if (reportStatus !== 'todos' && s.status !== reportStatus) {
        return false;
      }
      if (reportKeyword.trim() !== '') {
        const keyword = reportKeyword.toLowerCase();
        const descMatch = s.descricao?.toLowerCase().includes(keyword);
        const clientMatch = s.cliente_nome?.toLowerCase().includes(keyword);
        const vehicleMatch = s.veiculo_modelo?.toLowerCase().includes(keyword) || s.veiculo_placa?.toLowerCase().includes(keyword);
        if (!descMatch && !clientMatch && !vehicleMatch) return false;
      }
      return true;
    });
  };

  const handleExportCSV = () => {
    const data = getFilteredReports();
    if (data.length === 0) {
      triggerToast('Aviso: Nenhum registro encontrado para exportar com os filtros atuais.');
      return;
    }

    const headers = [
      'ID O.S.', 
      'Cliente', 
      'Veiculo', 
      'Placa', 
      'Data de Abertura', 
      'Status', 
      'Valor Mao de Obra (R$)', 
      'Qtd de Pecas',
      'Total de Pecas (R$)',
      'Total Geral (R$)'
    ];

    const rows = data.map(s => {
      const partsQty = s.pecas_usadas?.reduce((sum, p) => sum + p.quantidade, 0) || 0;
      const partsSum = s.pecas_usadas?.reduce((sum, p) => sum + (p.preco_venda * p.quantidade), 0) || 0;
      const formattedDate = s.criado_em ? new Date(s.criado_em).toLocaleDateString('pt-BR') : '';
      
      const statusMap: Record<string, string> = {
        orcamento: 'Orcamento',
        em_andamento: 'Em Execucao',
        aguardando_pecas: 'Aguardando Pecas',
        concluido: 'Concluido',
        cancelado: 'Cancelado'
      };
      const statusLabel = statusMap[s.status] || s.status;

      return [
        s.id.substring(0, 8).toUpperCase(),
        s.cliente_nome || '',
        s.veiculo_modelo || '',
        s.veiculo_placa || '',
        formattedDate,
        statusLabel,
        s.mao_de_obra_valor.toFixed(2),
        partsQty,
        partsSum.toFixed(2),
        s.total.toFixed(2)
      ].map(field => {
        const stringField = String(field).replace(/"/g, '""');
        return `"${stringField}"`;
      });
    });

    const csvContent = "\uFEFF" + [headers.join(','), ...rows.map(e => e.join(','))].join('\n');
    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.setAttribute("download", `relatorio_vendas_destakcar_${reportStartDate}_a_${reportEndDate}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    triggerToast('Relatório CSV baixado com sucesso!');
  };

  const handleExportPDF = () => {
    setReportPrintMode(true);
    setTimeout(() => {
      try {
        window.print();
      } catch (e) {
        console.warn("window.print() blocked by environment sandbox:", e);
        triggerToast("Impressora restrita no Iframe. Se a janela não abrir, clique em 'Imprimir' na pré-visualização.");
      }
    }, 450);
  };

  return (
    <div className="min-h-screen bg-slate-50 text-slate-800 font-sans selection:bg-indigo-100 selection:text-indigo-900" id="main_app_layout">
      
      {/* Toast Notification */}
      <AnimatePresence>
        {successToast && (
          <motion.div 
            initial={{ opacity: 0, y: -50, scale: 0.9 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: -20, scale: 0.95 }}
            className="fixed top-5 left-1/2 -translate-x-1/2 z-50 bg-slate-900 text-white px-5 py-3 rounded-full shadow-2xl flex items-center gap-2 border border-slate-700/50 backdrop-blur-md"
            id="toast_notification"
          >
            <CheckCircle2 className="w-5 h-5 text-emerald-400 shrink-0" />
            <span className="text-sm font-medium tracking-tight text-slate-100">{successToast}</span>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Primary Header */}
      <header className="sticky top-0 z-40 bg-white border-b border-slate-200/80 px-3 sm:px-6 md:px-8 py-3 flex items-center justify-between gap-2.5" id="primary_header">
        <div className="flex items-center gap-2 sm:gap-3 shrink-0">
          <div className="bg-indigo-600 text-white p-2 sm:p-2.5 rounded-2xl shadow-indigo-205 shadow-md">
            <Car className="w-5 h-5 sm:w-6 sm:h-6" />
          </div>
          <div>
            <h1 className="text-lg sm:text-2xl font-semibold tracking-tight text-slate-900 flex items-center gap-1 font-sans">
              Destak<span className="text-indigo-600 font-bold">Car</span>
            </h1>
            <p className="text-[10px] sm:text-[11px] font-medium text-slate-500 uppercase tracking-wider hidden sm:block font-sans animate-fade-in">Workshop Suite</p>
          </div>
        </div>

        {/* Database Connection / Switcher Pill */}
        <div className="flex items-center gap-1.5 sm:gap-2">
          {dbMode === 'supabase' ? (
            <div 
              role="button"
              onClick={() => setActiveTab('config')}
              className="relative bg-emerald-50/70 hover:bg-emerald-100/90 text-emerald-700 border border-emerald-250/20 rounded-full py-1 sm:py-1 px-2.5 text-[9px] font-bold flex items-center justify-center gap-1 transition cursor-pointer shrink-0 shadow-xs"
              title="Conectado ao banco Supabase da nuvem"
              id="db_indicator_supabase"
            >
              <div className="absolute top-0.5 left-0.5 flex h-1.5 w-1.5 shrink-0">
                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                <span className="relative inline-flex rounded-full h-1.5 w-1.5 bg-emerald-500"></span>
              </div>
              <Database className="w-2.5 h-2.5 shrink-0 text-emerald-600" />
              <span className="whitespace-nowrap tracking-tight leading-none hidden sm:inline">Nuvem Supabase</span>
            </div>
          ) : (
            <div 
              role="button"
              onClick={() => {
                setActiveTab('config');
                setShowConfigAlert(true);
              }}
              className="relative bg-violet-50/70 hover:bg-violet-100/90 text-violet-700 border border-violet-250/20 rounded-full py-1 sm:py-1 px-2.5 text-[9px] font-bold flex items-center justify-center gap-1 transition cursor-pointer shrink-0 shadow-xs"
              title="Armazenamento no Browser Ativo. Clique para configurar Supabase Nuvem."
              id="db_indicator_local"
            >
              <div className="absolute top-0.5 left-0.5 flex h-1.5 w-1.5 shrink-0">
                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-violet-400 opacity-75"></span>
                <span className="relative inline-flex rounded-full h-1.5 w-1.5 bg-violet-500"></span>
              </div>
              <Database className="w-2.5 h-2.5 shrink-0 text-violet-600" />
              <span className="whitespace-nowrap tracking-tight leading-none hidden sm:inline">Local Off-line</span>
            </div>
          )}

          {/* Theme Switcher Button */}
          <button
            onClick={toggleDarkMode}
            className="p-1.5 sm:p-2 rounded-full border border-slate-200/80 hover:bg-slate-105 transition cursor-pointer text-slate-500 hover:text-slate-800 flex items-center justify-center shrink-0 shadow-xs dark:border-slate-800 dark:hover:bg-slate-800"
            title={darkMode ? "Ativar Modo Claro" : "Ativar Modo Escuro"}
            id="theme_switcher_btn"
            type="button"
          >
            {darkMode ? (
              <Sun className="w-3.5 h-3.5 text-amber-500 animate-pulse" />
            ) : (
              <Moon className="w-3.5 h-3.5 text-slate-500" />
            )}
          </button>
 
          {/* Quick Add Blueprint Shortcut */}
          {currentUser && (
            <div className="relative group shrink-0">
              <button 
                onClick={() => {
                  if (activeTab === 'clientes') openClienteModal('criar');
                  else if (activeTab === 'estoque') openPecaModal('criar');
                  else openServicoModal('criar');
                }}
                className="bg-indigo-600 hover:bg-indigo-700 active:scale-95 text-white p-1.5 px-2.5 sm:p-2 sm:px-3.5 rounded-xl transition flex items-center gap-1 sm:gap-1.5 text-xs sm:text-sm font-semibold shadow-md shadow-indigo-100"
                title="Adicionar Novo"
                id="quick_add_btn"
              >
                <Plus className="w-3.5 h-3.5 sm:w-4 sm:h-4 shrink-0" />
                <span className="hidden sm:inline">Cadastrar</span>
              </button>
            </div>
          )}

          {currentUser && (
            <div className="flex items-center gap-2 sm:gap-3 border-l border-slate-200 pl-2 sm:pl-3 md:pl-4 shrink-0" id="header_user_profile">
              {/* User Avatar Circle */}
              <div className="w-7 h-7 sm:w-8 sm:h-8 rounded-full border border-slate-200 bg-slate-100 overflow-hidden flex items-center justify-center shrink-0 shadow-inner">
                {currentUser.avatar_url ? (
                  // eslint-disable-next-line @next/next/no-img-element
                  <img
                    src={currentUser.avatar_url}
                    alt={currentUser.nome}
                    className="w-full h-full object-cover"
                  />
                ) : (
                  <div className="w-full h-full bg-gradient-to-tr from-indigo-500 to-violet-600 text-white font-bold flex items-center justify-center text-xs">
                    {currentUser.nome ? currentUser.nome[0].toUpperCase() : '?'}
                  </div>
                )}
              </div>

              <div className="text-right hidden md:block">
                <span className="text-xs font-bold text-slate-800 block truncate max-w-[120px]">{currentUser.nome}</span>
                <span className="text-[9px] text-slate-500 font-bold block uppercase tracking-wider font-sans">
                  {currentUser.funcao || 'Mecânico'} • {dbMode === 'supabase' ? 'Nuvem' : 'Local'}
                </span>
              </div>
              <button 
                onClick={handleLogout}
                className="bg-slate-100 hover:bg-rose-50 text-slate-600 hover:text-rose-600 p-2 sm:px-3 sm:py-1.5 rounded-xl text-xs font-bold transition flex items-center gap-1.5"
                title="Sair do aplicativo"
                id="header_logout_btn"
              >
                <LogOut className="w-3.5 h-3.5 shrink-0" />
                <span className="hidden sm:inline">Sair</span>
              </button>
            </div>
          )}
        </div>
      </header>

      {/* Main Container Wrapper */}
      {loading ? (
        <div className="flex flex-col items-center justify-center min-h-[60vh] py-12" id="auth_loading_spinner">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600 mb-4"></div>
          <p className="text-slate-500 text-sm font-medium animate-pulse font-sans">Carregando painel seguro...</p>
        </div>
      ) : !currentUser ? (
        <div className="max-w-4xl mx-auto my-6 md:my-12 bg-white border border-slate-200/80 shadow-2xl rounded-3xl overflow-hidden grid grid-cols-1 md:grid-cols-12 min-h-[580px]" id="auth_portal_wrapper">
          {/* Lado Esquerdo: Ilustração Técnica */}
          <div className="hidden md:flex md:col-span-5 bg-gradient-to-br from-slate-950 via-indigo-950 to-slate-900 p-8 flex-col justify-between relative overflow-hidden border-r border-slate-850">
            {/* Background Grid Accent */}
            <div className="absolute inset-0 opacity-15 pointer-events-none" style={{ backgroundImage: 'radial-gradient(circle at 1px 1px, white 1px, transparent 0)', backgroundSize: '16px 16px' }}></div>
            
            {/* Decorative Ambient Glow Elements */}
            <div className="absolute -top-12 -left-12 w-48 h-48 bg-indigo-500/20 rounded-full blur-3xl pointer-events-none"></div>
            <div className="absolute -bottom-16 -right-16 w-56 h-56 bg-blue-500/10 rounded-full blur-3xl pointer-events-none"></div>
            
            {/* Header section of illustration panel */}
            <div className="relative z-10 space-y-1">
              <span className="text-[10px] uppercase font-bold tracking-widest text-indigo-400 font-mono">WORKSPACE SEGURO</span>
              <h3 className="text-xl font-extrabold text-white tracking-tight flex items-center gap-2">
                <span className="bg-indigo-600/30 text-indigo-300 p-1.5 rounded-lg border border-indigo-500/40">
                  <Wrench className="w-4 h-4 text-indigo-400" />
                </span>
                DestakCar
              </h3>
            </div>

            {/* Illustration Canvas inside left panel */}
            <div className="relative z-10 w-full flex flex-col items-center justify-center my-6 select-none">
              <svg viewBox="0 0 200 160" className="w-full max-w-[190px] drop-shadow-[0_0_15px_rgba(99,102,241,0.25)]" fill="none" xmlns="http://www.w3.org/2000/svg">
                {/* Outer tech circuit boundary */}
                <rect x="5" y="5" width="190" height="150" rx="16" stroke="rgba(99, 102, 241, 0.25)" strokeWidth="1" strokeDasharray="4 4" />
                <circle cx="100" cy="80" r="45" stroke="rgba(99, 102, 241, 0.15)" strokeWidth="1.5" />
                <circle cx="100" cy="80" r="55" stroke="rgba(59, 130, 246, 0.1)" strokeWidth="1" strokeDasharray="8 6" />

                {/* Animated Rotating Gears representing workshop & execution */}
                <g className="animate-[spin_40s_linear_infinite]" style={{ transformOrigin: '100px 80px' }}>
                  {/* Gear 1 Center */}
                  <circle cx="100" cy="80" r="18" stroke="#6366f1" strokeWidth="2" strokeOpacity="0.8" />
                  <circle cx="100" cy="80" r="24" stroke="#6366f1" strokeWidth="1" strokeDasharray="3 3" strokeOpacity="0.7" />
                  {/* Gear teeth */}
                  {[...Array(12)].map((_, i) => {
                    const angle = (i * 30 * Math.PI) / 180;
                    const x1 = 100 + 17 * Math.cos(angle);
                    const y1 = 80 + 17 * Math.sin(angle);
                    const x2 = 100 + 22 * Math.cos(angle);
                    const y2 = 80 + 22 * Math.sin(angle);
                    return <line key={i} x1={x1} y1={y1} x2={x2} y2={y2} stroke="#6366f1" strokeWidth="2.5" strokeLinecap="round" strokeOpacity="0.8" />;
                  })}
                </g>

                <g className="animate-[spin_30s_linear_infinite_reverse]" style={{ transformOrigin: '144px 110px' }}>
                  {/* Gear 2 Center (Medium) */}
                  <circle cx="144" cy="110" r="11" stroke="#3b82f6" strokeWidth="1.5" strokeOpacity="0.75" />
                  {/* Gear teeth */}
                  {[...Array(8)].map((_, i) => {
                    const angle = (i * 45 * Math.PI) / 180;
                    const x1 = 144 + 10 * Math.cos(angle);
                    const y1 = 110 + 10 * Math.sin(angle);
                    const x2 = 144 + 14 * Math.cos(angle);
                    const y2 = 110 + 14 * Math.sin(angle);
                    return <line key={i} x1={x1} y1={y1} x2={x2} y2={y2} stroke="#3b82f6" strokeWidth="2" strokeLinecap="round" strokeOpacity="0.75" />;
                  })}
                </g>

                {/* Car Silhouette schematic outline over the gears */}
                <path d="M 60,86 
                         C 60,80 65,74 72,74 
                         L 86,74 
                         C 92,62 101,56 112,56 
                         L 138,56 
                         C 146,56 154,64 156,72 
                         L 165,76 
                         C 171,78 174,82 174,88 
                         L 174,96 
                         C 174,98 172,100 170,100 
                         L 160,100 
                         C 158,95 153,92 148,92 
                         C 143,92 138,95 136,100 
                         L 96,100 
                         C 94,95 89,92 84,92 
                         C 79,92 74,95 72,100 
                         L 64,100 
                         C 62,100 60,98 60,96 
                         Z" 
                      stroke="#f8fafc" 
                      strokeWidth="2.5" 
                      strokeLinecap="round" 
                      strokeLinejoin="round" 
                      strokeOpacity="0.95" 
                      className="animate-pulse" 
                />

                {/* Car wheels */}
                <circle cx="84" cy="100" r="9" stroke="#f8fafc" strokeWidth="2" fill="#0f172a" fillOpacity="0.6" />
                <circle cx="84" cy="100" r="4" stroke="#6366f1" strokeWidth="1.5" />
                <circle cx="148" cy="100" r="9" stroke="#f8fafc" strokeWidth="2" fill="#0f172a" fillOpacity="0.6" />
                <circle cx="148" cy="100" r="4" stroke="#6366f1" strokeWidth="1.5" />

                {/* Cybernetic details & tech lines */}
                <line x1="30" y1="35" x2="65" y2="35" stroke="rgba(99, 102, 241, 0.4)" strokeWidth="1" />
                <circle cx="30" cy="35" r="2" fill="#6366f1" />
                <path d="M 45,35 L 55,45 L 80,45" stroke="rgba(59, 130, 246, 0.3)" strokeWidth="1" />
                
                <line x1="170" y1="125" x2="135" y2="125" stroke="rgba(99, 102, 241, 0.4)" strokeWidth="1" />
                <circle cx="170" cy="125" r="2" fill="#3b82f6" />
                
                {/* Diagnostic scan bar */}
                <g className="animate-[pulse_2s_infinite]">
                  <line x1="45" y1="50" x2="45" y2="110" stroke="rgba(59, 130, 246, 0.4)" strokeWidth="1.5" strokeDasharray="3 3" />
                  <path d="M 45,50 L 52,50" stroke="#3b82f6" strokeWidth="1.5" />
                  <path d="M 45,110 L 52,110" stroke="#3b82f6" strokeWidth="1.5" />
                </g>
              </svg>
              
              {/* Technical indicators overlay */}
              <div className="flex gap-4 mt-2 select-none font-mono text-[9px] text-slate-400">
                <span className="flex items-center gap-1"><span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-ping"></span>SYS OK</span>
                <span>DB_MODE: {dbMode.toUpperCase()}</span>
                <span>SECURE: SSL</span>
              </div>
            </div>

            {/* Bottom Slogans / Features */}
            <div className="relative z-10 space-y-3.5">
              <h4 className="text-xs font-bold text-slate-200 tracking-wider uppercase font-mono border-l-2 border-indigo-500 pl-2">
                Gestão de Oficina Mecânica 360°
              </h4>
              <p className="text-[11px] text-slate-405 leading-relaxed font-medium">
                Controle completo de checklist de entrada, ordens de serviço, fluxo de caixa, alertas de revisão por quilometragem e muito mais.
              </p>
              <div className="flex items-center gap-2 pt-1">
                <span className="bg-slate-800/80 text-[10px] text-indigo-300 font-bold px-2 py-0.5 rounded-lg border border-slate-700/50">
                  V3.5.0 Stable
                </span>
                <span className="bg-slate-800/80 text-[10px] text-slate-350 font-bold px-2 py-0.5 rounded-lg border border-slate-700/50">
                  Cloud Relational & Local Offline
                </span>
              </div>
            </div>
          </div>

          {/* Lado Direito: Formulário de Login (Centralizado e Responsivo) */}
          <div className="col-span-12 md:col-span-7 p-6 sm:p-10 flex flex-col justify-center bg-white">
            <div className="text-center space-y-2 mb-6">
              <div className="inline-flex p-3 bg-indigo-50 text-indigo-600 rounded-2xl mb-1">
                <Lock className="w-6 h-6 animate-pulse" />
              </div>
              <h2 className="text-2xl font-bold tracking-tight text-slate-900 font-sans">
                {authMode === 'login' && 'Acesse o Painel DestakCar'}
                {authMode === 'register' && 'Cadastrar Novo Administrador'}
                {authMode === 'forgot' && 'Recuperar Acesso ao Painel'}
                {authMode === 'reset' && 'Definir Nova Senha'}
              </h2>
              <p className="text-xs text-slate-500 max-w-sm mx-auto">
                {authMode === 'login' && 'Painel de controle para oficinas e autopeças. Gerencie clientes, veículos e ordens de serviço.'}
                {authMode === 'register' && 'Crie suas credenciais para gerenciar a sua oficina.'}
                {authMode === 'forgot' && 'Informe seu e-mail corporativo cadastrado para receber as instruções de recuperação.'}
                {authMode === 'reset' && 'Insira sua nova senha corporativa abaixo para restabelecer o acesso ao workspace.'}
              </p>
            </div>

            {authError && (
              <div className="mb-4 p-3.5 bg-rose-50 border border-rose-100 rounded-xl text-rose-700 text-xs font-semibold flex items-start gap-2.5" id="auth_error_alert">
                <AlertTriangle className="w-4 h-4 shrink-0 mt-0.5" />
                <span>{authError}</span>
              </div>
            )}

            {authSuccess && (
              <div className="mb-4 p-3.5 bg-emerald-50 border border-emerald-100 rounded-xl text-emerald-800 text-xs font-semibold flex items-start gap-2.5" id="auth_success_alert">
                <CheckCircle2 className="w-4 h-4 shrink-0 mt-0.5 text-emerald-500" />
                <span>{authSuccess}</span>
              </div>
            )}

            <form 
              onSubmit={
                authMode === 'login' ? handleLogin : 
                authMode === 'register' ? handleRegister : 
                authMode === 'forgot' ? handleForgotPassword : 
                handleResetPassword
              } 
              className="space-y-4" 
              id="auth_form"
            >
              {authMode === 'register' && (
                <>
                  <div className="space-y-1">
                    <label className="text-xs font-bold text-slate-600 block">Nome Completo</label>
                    <input 
                      type="text" 
                      placeholder="Ex: João de Souza Silva"
                      value={authNome}
                      onChange={(e) => setAuthNome(e.target.value)}
                      className="w-full bg-slate-50 focus:bg-white border border-slate-200 focus:border-indigo-500 rounded-xl px-3.5 py-2.5 text-xs font-medium outline-none transition"
                      required
                    />
                  </div>
                  <div className="space-y-1">
                    <label className="text-xs font-bold text-slate-400 block">Cargo / Função (Atribuído Automático)</label>
                    <select 
                      value="Mecânico"
                      disabled
                      className="w-full bg-slate-100 border border-slate-200 text-slate-500 rounded-xl px-3.5 py-2.5 text-xs font-semibold cursor-not-allowed outline-none"
                    >
                      <option value="Mecânico">Mecânico (Acesso Inicial)</option>
                    </select>
                    <p className="text-[10.5px] text-slate-400 font-normal leading-normal mt-1.5 bg-slate-50 p-2.5 rounded-lg border border-slate-150">
                      ⚠️ Novos cadastros recebem obrigatoriamente a função de <strong>Mecânico</strong> por segurança. Solicite a promoção para cargos elevados (Supervisor ou Administrador) ao proprietário já logado.
                    </p>
                  </div>
                </>
              )}

              {(authMode === 'login' || authMode === 'register' || authMode === 'forgot') && (
                <div className="space-y-1">
                  <label className="text-xs font-bold text-slate-600 block">E-mail Corporativo</label>
                  <input 
                    type="email" 
                    placeholder="colaborador@distakcar.com"
                    value={authEmail}
                    onChange={(e) => setAuthEmail(e.target.value)}
                    className="w-full bg-slate-50 focus:bg-white border border-slate-200 focus:border-indigo-500 rounded-xl px-3.5 py-2.5 text-xs font-medium outline-none transition"
                    required
                  />
                </div>
              )}

              {(authMode === 'login' || authMode === 'register' || authMode === 'reset') && (
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <label className="text-xs font-bold text-slate-600 block">
                      {authMode === 'reset' ? 'Nova Senha' : 'Senha de Acesso'}
                    </label>
                  </div>
                  <div className="relative">
                    <input 
                      type="password" 
                      placeholder={authMode === 'reset' ? "Mínimo 6 caracteres" : "••••••••"}
                      value={authPassword}
                      onChange={(e) => setAuthPassword(e.target.value)}
                      className={`w-full bg-slate-50 focus:bg-white border rounded-xl pl-3.5 pr-10 py-2.5 text-xs font-medium outline-none transition ${
                        (authMode === 'reset' || authMode === 'register') && authPassword
                          ? (authPassword.length >= 6 
                              ? 'border-emerald-300 focus:border-emerald-500 ring-2 ring-emerald-50/50' 
                              : 'border-rose-300 focus:border-rose-500 ring-2 ring-rose-50/50') 
                          : 'border-slate-200 focus:border-indigo-500'
                      }`}
                      required
                    />
                    {(authMode === 'reset' || authMode === 'register') && authPassword && (
                      <div className="absolute right-3.5 top-1/2 -translate-y-1/2 flex items-center pointer-events-none">
                        {authPassword.length >= 6 ? (
                          <CheckCircle2 className="w-4 h-4 text-emerald-500" />
                        ) : (
                          <AlertTriangle className="w-4 h-4 text-rose-500 animate-pulse" />
                        )}
                      </div>
                    )}
                  </div>
                  {(authMode === 'reset' || authMode === 'register') && authPassword && (
                    <p className={`text-[10px] font-semibold transition ${
                      authPassword.length >= 6 ? 'text-emerald-600' : 'text-rose-500'
                    }`}>
                      {authPassword.length >= 6 
                        ? '✓ Requisito de tamanho mínimo preenchido!' 
                        : 'A nova senha deve possuir no mínimo 6 caracteres.'}
                    </p>
                  )}
                </div>
              )}

              {authMode === 'reset' && (
                <div className="space-y-1">
                  <label className="text-xs font-bold text-slate-600 block">Confirmar Nova Senha</label>
                  <div className="relative">
                    <input 
                      type="password" 
                      placeholder="Repita a nova senha corporativa"
                      value={authConfirmPassword}
                      onChange={(e) => setAuthConfirmPassword(e.target.value)}
                      className={`w-full bg-slate-50 focus:bg-white border rounded-xl pl-3.5 pr-10 py-2.5 text-xs font-medium outline-none transition ${
                        authConfirmPassword 
                          ? (authConfirmPassword === authPassword 
                              ? 'border-emerald-300 focus:border-emerald-500 ring-2 ring-emerald-50/50' 
                              : 'border-rose-300 focus:border-rose-500 ring-2 ring-rose-50/50') 
                          : 'border-slate-200 focus:border-indigo-500'
                      }`}
                      required
                    />
                    {authConfirmPassword && (
                      <div className="absolute right-3.5 top-1/2 -translate-y-1/2 flex items-center pointer-events-none">
                        {authConfirmPassword === authPassword ? (
                          <CheckCircle2 className="w-4 h-4 text-emerald-500" />
                        ) : (
                          <AlertTriangle className="w-4 h-4 text-rose-500 animate-pulse" />
                        )}
                      </div>
                    )}
                  </div>
                  {authConfirmPassword && (
                    <p className={`text-[10px] font-semibold transition ${
                      authConfirmPassword === authPassword ? 'text-emerald-600' : 'text-rose-500'
                    }`}>
                      {authConfirmPassword === authPassword 
                        ? '✓ As senhas conferem corretamente!' 
                        : '✗ As senhas digitadas não coincidem.'}
                    </p>
                  )}
                </div>
              )}

              <button 
                type="submit"
                disabled={authLoading}
                className="w-full bg-indigo-600 hover:bg-indigo-700 active:scale-[0.98] disabled:opacity-75 disabled:active:scale-100 text-white font-bold py-2.5 rounded-xl text-xs shadow-lg shadow-indigo-100 transition flex items-center justify-center gap-1.5 cursor-pointer"
              >
                {authLoading ? (
                  <>
                    <div className="animate-spin rounded-full h-3.5 w-3.5 border-b-2 border-white"></div>
                    <span>Processando credenciais...</span>
                  </>
                ) : (
                  <>
                    {authMode === 'login' && <span>Acessar Workspace</span>}
                    {authMode === 'register' && <span>Concluir Cadastro</span>}
                    {authMode === 'forgot' && <span>Enviar Link de Recuperação</span>}
                    {authMode === 'reset' && <span>Gravar Nova Senha</span>}
                  </>
                )}
              </button>
            </form>

            {/* Elegant Interactive Password Reset Email Simulation */}
            {authMode === 'forgot' && showEmailSimulation && (
              <motion.div 
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                className="mt-6 border border-slate-200/90 rounded-2xl bg-slate-50/70 p-4 font-sans text-left space-y-3 shadow-inner"
                id="recovery_email_demo_box"
              >
                <div className="flex items-center gap-2 border-b border-slate-200 pb-2 text-[10px] text-slate-500 font-medium">
                  <div className="w-2 h-2 rounded-full bg-indigo-600 animate-ping"></div>
                  <span className="font-bold text-slate-600 text-xs">Simulador de E-mail de Teste</span>
                  <span className="ml-auto text-slate-405">Recebido agora mesmo</span>
                </div>
                
                <div className="bg-white border border-slate-150 p-5 rounded-xl space-y-4 shadow-sm">
                  <div className="flex items-center gap-2 text-xs text-slate-400 pb-2.5 border-b border-slate-100">
                    <span className="font-semibold text-slate-600">De:</span> no-reply@distakcar.com
                    <span className="mx-1">•</span>
                    <span className="font-semibold text-slate-600">Para:</span> {authEmail || 'seu-email@distakcar.com'}
                  </div>
                  
                  <div className="space-y-4 pt-1">
                    <h2 className="text-xl font-bold text-slate-900 tracking-tight" id="email_template_title">Reset your password</h2>
                    
                    <p className="text-xs text-slate-600 leading-relaxed">
                      We received a request to reset your password. Follow the link below to choose a new one.
                    </p>
                    
                    <div className="py-1">
                      <button 
                        onClick={() => {
                          setAuthMode('reset');
                          setAuthSuccess(null);
                          setAuthPassword('');
                          setAuthConfirmPassword('');
                          triggerToast("Link de recuperação validado! Insira sua nova senha.");
                        }}
                        className="inline-flex bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-2.5 px-5 rounded-xl text-xs transition duration-150 transform active:scale-95 shadow-md shadow-indigo-100 items-center justify-center cursor-pointer"
                        id="email_confirm_btn"
                      >
                        Reset password
                      </button>
                    </div>
                    
                    <p className="text-[10px] text-slate-400 leading-relaxed border-t border-slate-100 pt-3">
                      If you didn&apos;t request this, you can safely ignore this email.
                    </p>
                  </div>
                </div>
                <div className="text-[10px] text-center text-slate-500 font-medium">
                  💡 Clique no botão de teste <strong className="text-indigo-600">Reset password</strong> acima para abrir a tela e redefinir sua senha corporativa!
                </div>
              </motion.div>
            )}

            <div className="mt-5 pt-4 border-t border-slate-105 text-center text-xs">
              {authMode === 'login' && (
                <span className="text-slate-500">
                  Não tem uma conta?{' '}
                  <button 
                    onClick={() => { setAuthMode('register'); setAuthError(null); setAuthSuccess(null); }}
                    className="text-indigo-600 font-bold hover:underline cursor-pointer"
                  >
                    Cadastre-se gratuitamente
                  </button>
                </span>
              )}
              {authMode === 'register' && (
                <span className="text-slate-500">
                  Já possui uma conta?{' '}
                  <button 
                    onClick={() => { setAuthMode('login'); setAuthError(null); setAuthSuccess(null); }}
                    className="text-indigo-600 font-bold hover:underline cursor-pointer"
                  >
                    Faça login
                  </button>
                </span>
              )}
              {(authMode === 'forgot' || authMode === 'reset') && (
                <span className="text-slate-500">
                  Lembrou de sua senha?{' '}
                  <button 
                    onClick={() => { setAuthMode('login'); setAuthError(null); setAuthSuccess(null); }}
                    className="text-indigo-600 font-bold hover:underline cursor-pointer"
                  >
                    Voltar para o Login
                  </button>
                </span>
              )}
            </div>








          </div>
        </div>
      ) : (
        <>
          {/* Main Container Wrapper */}
          <div className="max-w-7xl mx-auto px-4 md:px-8 py-6 pb-24 lg:pb-8 flex flex-col lg:flex-row gap-6" id="dashboard_container">
        
        {/* Navigation Sidebar (Vertical on Large screens) */}
        <aside className="hidden lg:block lg:w-64 shrink-0" id="sidebar_nav">
          <nav className="bg-white rounded-3xl p-3 border border-slate-200/75 shadow-sm space-y-1 flex flex-row lg:flex-col justify-around lg:justify-start overflow-x-auto lg:overflow-x-visible">
            
            <button 
              onClick={() => { setActiveTab('dashboard'); setSearchQuery(''); }}
              className={`flex items-center gap-3 px-4 py-3 rounded-2xl text-sm font-semibold transition shrink-0 whitespace-nowrap ${
                activeTab === 'dashboard' 
                  ? 'bg-indigo-50 text-indigo-700 shadow-sm border-l-4 border-indigo-600' 
                  : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900'
              }`}
              id="nav_dashboard"
            >
              <TrendingUp className="w-4 h-4" />
              <span>Dashboard</span>
            </button>

            {currentUser?.funcao !== 'Mecânico' && (
              <button 
                onClick={() => { setActiveTab('clientes'); setSearchQuery(''); }}
                className={`flex items-center gap-3 px-4 py-3 rounded-2xl text-sm font-semibold transition shrink-0 whitespace-nowrap ${
                  activeTab === 'clientes' 
                    ? 'bg-indigo-50 text-indigo-700 shadow-sm border-l-4 border-indigo-600' 
                    : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900'
                }`}
                id="nav_clientes"
              >
                <Users className="w-4 h-4" />
                <span>Clientes & Carros</span>
              </button>
            )}

            <button 
              onClick={() => { setActiveTab('servicos'); setSearchQuery(''); }}
              className={`flex items-center gap-3 px-4 py-3 rounded-2xl text-sm font-semibold transition shrink-0 whitespace-nowrap ${
                activeTab === 'servicos' 
                  ? 'bg-indigo-50 text-indigo-700 shadow-sm border-l-4 border-indigo-600' 
                  : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900'
              }`}
              id="nav_servicos"
            >
              <ClipboardList className="w-4 h-4" />
              <span>Serviços & O.S.</span>
            </button>

            {currentUser?.funcao !== 'Mecânico' && (
              <button 
                onClick={() => { setActiveTab('estoque'); setSearchQuery(''); setStockCategoryFilter('todos'); }}
                className={`flex items-center gap-3 px-4 py-3 rounded-2xl text-sm font-semibold transition shrink-0 whitespace-nowrap ${
                  activeTab === 'estoque' 
                    ? 'bg-indigo-50 text-indigo-700 shadow-sm border-l-4 border-indigo-600' 
                    : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900'
                }`}
                id="nav_estoque"
              >
                <Package className="w-4 h-4" />
                <span>Estoque Peças</span>
                {stats && stats.pecasBaixoEstoque > 0 && (
                  <span className="ml-auto bg-amber-500 text-white font-bold text-xs px-2 py-0.5 rounded-full animate-bounce">
                    {stats.pecasBaixoEstoque}
                  </span>
                )}
              </button>
            )}

            {currentUser?.funcao !== 'Mecânico' && (
              <button 
                onClick={() => { 
                  setActiveTab('relatorios'); 
                  setSearchQuery(''); 
                }}
                className={`flex items-center gap-3 px-4 py-3 rounded-2xl text-sm font-semibold transition shrink-0 whitespace-nowrap ${
                  activeTab === 'relatorios' 
                    ? 'bg-indigo-50 text-indigo-700 shadow-sm border-l-4 border-indigo-600' 
                    : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900'
                }`}
                id="nav_relatorios"
              >
                <BarChart3 className="w-4 h-4" />
                <span>Relatórios</span>
              </button>
            )}

            {currentUser?.funcao !== 'Mecânico' && (
              <button 
                onClick={() => { setActiveTab('alertas'); setSearchQuery(''); }}
                className={`flex items-center gap-3 px-4 py-3 rounded-2xl text-sm font-semibold transition shrink-0 whitespace-nowrap ${
                  activeTab === 'alertas' 
                    ? 'bg-indigo-50 text-indigo-700 shadow-sm border-l-4 border-indigo-600' 
                    : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900'
                }`}
                id="nav_alertas"
              >
                <Bell className="w-4 h-4 text-amber-500" />
                <span>Controle de Revisões</span>
                {alertas.filter(a => a.status === 'pendente').length > 0 && (
                  <span className="ml-auto bg-amber-500 text-white font-extrabold text-[9px] px-1.5 py-0.5 rounded-xl">
                    {alertas.filter(a => a.status === 'pendente').length}
                  </span>
                )}
              </button>
            )}

            {currentUser?.funcao !== 'Mecânico' && (
              <button 
                onClick={() => { setActiveTab('busca_avancada'); setSearchQuery(''); }}
                className={`flex items-center gap-3 px-4 py-3 rounded-2xl text-sm font-semibold transition shrink-0 whitespace-nowrap ${
                  activeTab === 'busca_avancada' 
                    ? 'bg-indigo-50 text-indigo-700 shadow-sm border-l-4 border-indigo-600' 
                    : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900'
                }`}
                id="nav_busca_avancada"
              >
                <Search className="w-4 h-4 text-indigo-500" />
                <span>Busca Avançada</span>
              </button>
            )}

            {currentUser?.funcao !== 'Mecânico' && (
              <button 
                onClick={() => { setActiveTab('notificacoes'); setSearchQuery(''); }}
                className={`flex items-center gap-3 px-4 py-3 rounded-2xl text-sm font-semibold transition shrink-0 whitespace-nowrap ${
                  activeTab === 'notificacoes' 
                    ? 'bg-indigo-50 text-indigo-700 shadow-sm border-l-4 border-indigo-600' 
                    : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900'
                }`}
                id="nav_notificacoes"
              >
                <BellRing className={`w-4 h-4 ${notificacoesPush.some(n => !n.lida) ? 'text-rose-500 animate-pulse font-bold' : 'text-slate-400'}`} />
                <span>Notificações Push</span>
                {notificacoesPush.filter(n => !n.lida).length > 0 && (
                  <span className="ml-auto bg-rose-500 text-white font-extrabold text-[9px] px-1.5 py-0.5 rounded-xl">
                    {notificacoesPush.filter(n => !n.lida).length}
                  </span>
                )}
              </button>
            )}

            <button 
              onClick={() => { setActiveTab('config'); setSearchQuery(''); }}
              className={`flex items-center gap-3 px-4 py-3 rounded-2xl text-sm font-semibold transition shrink-0 whitespace-nowrap ${
                activeTab === 'config' 
                  ? 'bg-indigo-50 text-indigo-700 shadow-sm border-l-4 border-indigo-600' 
                  : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900'
              }`}
              id="nav_config"
            >
              <Settings className="w-4 h-4" />
              <span>Configurações & Perfil</span>
            </button>
          </nav>

          {/* Quick Tech Info */}
          <div className="hidden lg:block bg-slate-900/5 border border-slate-200 text-slate-500 rounded-3xl p-4 mt-4 text-[11px] leading-relaxed">
            <div className="flex items-center gap-1.5 font-semibold text-slate-700 mb-1">
              <Smartphone className="w-3.5 h-3.5 text-indigo-500" />
              <span>Layout Multi-Dispositivo</span>
            </div>
            <span>Este painel é adaptado para visualização em tablets, smartphones e computadores.</span>
          </div>
        </aside>

        {/* Dynamic Content Center */}
        <main className="flex-1" id="main_content_area">
          {loading ? (
            <div className="bg-white rounded-3xl border border-slate-200/80 p-12 text-center shadow-sm flex flex-col items-center justify-center gap-4 min-h-[400px]">
              <div className="animate-spin text-indigo-600">
                <RefreshCw className="w-8 h-8" />
              </div>
              <p className="text-slate-500 text-sm font-medium">Carregando painel DestakCar...</p>
            </div>
          ) : (
            <AnimatePresence mode="wait">
              
              {/* TAB 1: DASHBOARD */}
              {activeTab === 'dashboard' && stats && (
                <motion.div
                  key="tab_dashboard"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.2 }}
                  className="space-y-6"
                >
                  
                  {/* Alert: database local configuration helper */}
                  {showConfigAlert && dbMode === 'local' && (
                    <div className="bg-violet-50 text-violet-800 rounded-2xl p-4 border border-violet-200/50 shadow-sm relative flex flex-col sm:flex-row items-start gap-3">
                      <div className="p-2 bg-white rounded-xl shadow-sm text-violet-600 shrink-0">
                        <Database className="w-5 h-5" />
                      </div>
                      <div className="text-xs sm:text-sm">
                        <h4 className="font-semibold text-violet-900 mb-0.5">Modo Local (Banco no Browser) Ativo</h4>
                        <p className="text-violet-700 mb-3">Seus dados estão sendo guardados no armazenamento local deste navegador. Para habilitar um banco compartilhado, clique no botão para obter o script de tabelas e conecte seu Supabase.</p>
                        <div className="flex items-center gap-3">
                          <button 
                            onClick={() => setActiveTab('config')}
                            className="bg-violet-600 hover:bg-violet-700 text-white font-semibold text-xs px-3.5 py-1.8 rounded-lg shadow-sm"
                          >
                            Configurar Supabase
                          </button>
                          <button 
                            onClick={() => setShowConfigAlert(false)}
                            className="text-violet-600 hover:text-violet-800 font-semibold text-xs py-1.8"
                          >
                            Fechar Alerta
                          </button>
                        </div>
                      </div>
                      <button 
                        onClick={() => setShowConfigAlert(false)}
                        className="absolute right-3 top-3 text-violet-400 hover:text-violet-600 p-1"
                      >
                        <X className="w-4 h-4" />
                      </button>
                    </div>
                  )}

                  {/* 4 Cards Grid */}
                  <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4" id="kpi_grid">
                    
                    {/* card 1: Total Revenue */}
                    {currentUser?.funcao === 'Mecânico' ? (
                      <div className="bg-slate-50/80 rounded-3xl p-5 border border-slate-200/50 shadow-sm flex items-center gap-4 relative overflow-hidden">
                        <div className="bg-slate-200 text-slate-400 p-3 rounded-2xl shrink-0">
                          <Lock className="w-6 h-6" />
                        </div>
                        <div>
                          <span className="text-[10px] font-bold text-slate-400 uppercase tracking-wider block mb-0.5">Faturamento Total</span>
                          <h3 className="text-xs font-bold text-slate-500 leading-snug">Visualização Restrita</h3>
                          <p className="text-[9px] text-slate-400 font-medium mt-1">Apenas Admin / Supervisor</p>
                        </div>
                      </div>
                    ) : (
                      <div className="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-sm flex items-center gap-4">
                        <div className="bg-indigo-50 text-indigo-600 p-3 rounded-2xl shrink-0">
                          <TrendingUp className="w-6 h-6" />
                        </div>
                        <div>
                          <span className="text-xs font-semibold text-slate-500 uppercase tracking-wider block mb-0.5">Faturamento Total</span>
                          <h3 className="text-xl md:text-2xl font-bold tracking-tight text-slate-900">{formatCurrency(stats.totalFaturamento)}</h3>
                          <p className="text-[10px] text-slate-500 font-medium mt-1">Soma de todos os serviços</p>
                        </div>
                      </div>
                    )}

                    {/* card 2: Monthly Revenue */}
                    {currentUser?.funcao === 'Mecânico' ? (
                      <div className="bg-slate-50/80 rounded-3xl p-5 border border-slate-200/50 shadow-sm flex items-center gap-4 relative overflow-hidden">
                        <div className="bg-slate-200 text-slate-400 p-3 rounded-2xl shrink-0">
                          <Lock className="w-6 h-6" />
                        </div>
                        <div>
                          <span className="text-[10px] font-bold text-slate-400 uppercase tracking-wider block mb-0.5">Faturamento Mês</span>
                          <h3 className="text-xs font-bold text-slate-500 leading-snug">Visualização Restrita</h3>
                          <p className="text-[9px] text-slate-400 font-medium mt-1">Apenas Admin / Supervisor</p>
                        </div>
                      </div>
                    ) : (
                      <div className="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-sm flex items-center gap-4">
                        <div className="bg-emerald-50 text-emerald-600 p-3 rounded-2xl shrink-0">
                          <DollarSign className="w-6 h-6" />
                        </div>
                        <div>
                          <span className="text-xs font-semibold text-slate-500 uppercase tracking-wider block mb-0.5">Faturamento Mês</span>
                          <h3 className="text-xl md:text-2xl font-bold tracking-tight text-slate-900">{formatCurrency(stats.faturamentoMensal)}</h3>
                          <p className="text-[10px] text-slate-500 font-medium mt-1">Este mês corrente</p>
                        </div>
                      </div>
                    )}

                    {/* card 3: Servicos Ativos */}
                    <div className="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-sm flex items-center gap-4">
                      <div className="bg-blue-50 text-blue-600 p-3 rounded-2xl shrink-0">
                        <Wrench className="w-6 h-6" />
                      </div>
                      <div>
                        <span className="text-xs font-semibold text-slate-500 uppercase tracking-wider block mb-0.5">Serviços Ativos</span>
                        <h3 className="text-xl md:text-2xl font-bold tracking-tight text-slate-900">{stats.servicosAndamento}</h3>
                        <p className="text-[10px] text-slate-500 font-medium mt-1">Executando neste momento</p>
                      </div>
                    </div>

                    {/* card 4: Stock Alerts */}
                    <div onClick={() => { setActiveTab('estoque'); setStockFilter('baixo'); }} className={`rounded-3xl p-5 border shadow-sm flex items-center gap-4 cursor-pointer transition ${
                      stats.pecasBaixoEstoque > 0 
                        ? 'bg-amber-50 hover:bg-amber-100/80 border-amber-200/60 text-amber-900' 
                        : 'bg-white border-slate-200/80 text-slate-800'
                    }`}>
                      <div className={`p-3 rounded-2xl shrink-0 ${stats.pecasBaixoEstoque > 0 ? 'bg-amber-500 text-white animate-pulse' : 'bg-slate-100 text-slate-500'}`}>
                        <AlertTriangle className="w-6 h-6" />
                      </div>
                      <div>
                        <span className="text-xs font-semibold text-slate-500 uppercase tracking-wider block mb-0.5">Estoque Crítico</span>
                        <h3 className="text-xl md:text-2xl font-bold tracking-tight">{stats.pecasBaixoEstoque}</h3>
                        <p className="text-[10px] text-slate-500 font-medium mt-1">Peças abaixo do mínimo</p>
                      </div>
                    </div>

                  </div>

                  {/* Revenue Distribution and Stats Chart Box */}
                  <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">

                    {/* Left: Interactive Mini Financial Summary Graph */}
                    <div className="lg:col-span-2 bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm space-y-6 relative overflow-hidden">
                      {currentUser?.funcao === 'Mecânico' && (
                        <div className="absolute inset-0 bg-slate-50/75 backdrop-blur-[4px] z-20 flex flex-col items-center justify-center p-6 text-center">
                          <div className="bg-slate-100 p-3.5 rounded-2xl text-slate-500 mb-3 border border-slate-200/50 shadow-inner">
                            <Lock className="w-6 h-6 text-slate-400 animate-pulse" />
                          </div>
                          <h4 className="font-extrabold text-slate-800 text-sm tracking-tight">Histórico de Faturamento</h4>
                          <p className="text-xs text-slate-500 max-w-sm mt-1 leading-relaxed">
                            Apenas usuários com o cargo de <strong>Supervisor</strong> ou <strong>Administrador</strong> têm permissão para visualizar o fluxo financeiro acumulado.
                          </p>
                        </div>
                      )}
                      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                        <div>
                          <h3 className="text-base font-bold tracking-tight text-slate-900">Histórico de Faturamento de Serviços</h3>
                          <p className="text-xs text-slate-500">Fluxo geral dos últimos 6 meses</p>
                        </div>
                        
                        <div className="flex flex-wrap items-center gap-3">
                          {/* Segmented Control Selector */}
                          <div className="flex bg-slate-100 p-0.5 rounded-lg border border-slate-200">
                            <button
                              type="button"
                              onClick={() => setChartType('linha')}
                              className={`px-2 py-0.5 text-[10px] font-bold rounded-md transition-all cursor-pointer ${
                                chartType === 'linha'
                                  ? 'bg-white text-indigo-700 shadow-xs'
                                  : 'text-slate-500 hover:text-slate-800'
                              }`}
                            >
                              Série (Linha)
                            </button>
                            <button
                              type="button"
                              onClick={() => setChartType('barra')}
                              className={`px-2 py-0.5 text-[10px] font-bold rounded-md transition-all cursor-pointer ${
                                chartType === 'barra'
                                  ? 'bg-white text-indigo-700 shadow-xs'
                                  : 'text-slate-500 hover:text-slate-800'
                              }`}
                            >
                              Colunas
                            </button>
                          </div>

                          <div className="flex items-center gap-2.5 text-[9px] font-bold text-slate-400 uppercase tracking-wider">
                            <span className="flex items-center gap-1"><span className="w-2 h-2 rounded-full bg-indigo-500"></span>Faturamento</span>
                            <span className="flex items-center gap-1"><span className="w-2 h-2 rounded-full bg-sky-400"></span>N. Ordens</span>
                          </div>
                        </div>
                      </div>

                      {chartType === 'linha' ? (
                        <div className="h-64 pt-4 select-none">
                          <ResponsiveContainer width="100%" height="100%">
                            <LineChart
                              data={stats.mensalDataChart}
                              margin={{ top: 12, right: 10, left: -15, bottom: 0 }}
                            >
                              <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" vertical={false} />
                              <XAxis 
                                dataKey="mes" 
                                stroke="#94a3b8" 
                                fontSize={10} 
                                fontWeight={600}
                                tickLine={false} 
                                axisLine={false}
                                dy={8}
                              />
                              <YAxis 
                                stroke="#94a3b8" 
                                fontSize={10} 
                                fontWeight={600}
                                tickLine={false} 
                                axisLine={false}
                                tickFormatter={(val) => {
                                  if (val >= 1000) {
                                    return `R$ ${(val / 1000).toFixed(0)}k`;
                                  }
                                  return `R$ ${val}`;
                                }}
                                dx={-5}
                              />
                              <Tooltip content={<CustomTooltip />} />
                              <Line 
                                type="monotone" 
                                dataKey="faturamento" 
                                stroke="#4f46e5" 
                                strokeWidth={3} 
                                activeDot={{ r: 6, strokeWidth: 0, fill: '#4f46e5' }} 
                                dot={{ r: 4, strokeWidth: 2, fill: '#ffffff', stroke: '#4f46e5' }}
                                name="Faturamento"
                              />
                              <Line 
                                type="monotone" 
                                dataKey="servicos" 
                                stroke="#38bdf8" 
                                strokeWidth={2} 
                                strokeDasharray="4 4"
                                activeDot={{ r: 5, strokeWidth: 0, fill: '#38bdf8' }} 
                                dot={{ r: 3, strokeWidth: 2, fill: '#ffffff', stroke: '#38bdf8' }}
                                name="Ordens"
                              />
                            </LineChart>
                          </ResponsiveContainer>
                        </div>
                      ) : (
                        /* Pure Interactive Custom SVG/Flex Bar Chart */
                        <div className="h-64 flex items-end justify-between px-2 pt-6 gap-2">
                          {stats.mensalDataChart.map((d, index) => {
                            const maxFaturamento = Math.max(...stats.mensalDataChart.map(m => m.faturamento), 100);
                            const barHeightPercent = Math.max(10, Math.min(100, (d.faturamento / maxFaturamento) * 100));
                            
                            return (
                              <div key={index} className="flex-1 flex flex-col items-center gap-2 group relative">
                                
                                {/* Hover tooltip for accurate values */}
                                <div className="absolute -top-12 bg-slate-900 text-white rounded-lg px-2.5 py-1.5 text-[10px] font-semibold shadow-xl opacity-0 group-hover:opacity-100 transition duration-150 z-20 pointer-events-none whitespace-nowrap text-center">
                                  <div className="text-slate-300 font-normal">Faturado: {formatCurrency(d.faturamento)}</div>
                                  <div>{d.servicos} O.S. Concluídas</div>
                                </div>

                                <div className="w-full flex justify-center items-end gap-1.5 h-44">
                                  {/* Faturamento Bar */}
                                  <div 
                                    style={{ height: `${barHeightPercent}%` }} 
                                    className="w-7 sm:w-10 bg-indigo-600 group-hover:bg-indigo-700 rounded-t-lg transition-all duration-300 shadow-sm relative flex justify-center"
                                  >
                                    {d.faturamento > 0 && (
                                      <span className="text-[9px] text-white font-medium absolute -top-5 hidden sm:block whitespace-nowrap bg-slate-800 px-1 py-0.2 rounded-md">
                                        {Math.round(d.faturamento)}
                                      </span>
                                    )}
                                  </div>
                                </div>

                                <div className="text-[10px] font-bold text-slate-700 tracking-wider text-center">{d.mes}</div>
                              </div>
                            );
                          })}
                        </div>
                      )}
                    </div>

                    {/* Right: Pie Summary (Mao de Obra vs Pecas) */}
                    <div className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm flex flex-col justify-between relative overflow-hidden">
                      {currentUser?.funcao === 'Mecânico' && (
                        <div className="absolute inset-0 bg-slate-50/75 backdrop-blur-[4px] z-20 flex flex-col items-center justify-center p-6 text-center">
                          <div className="bg-slate-100 p-3.5 rounded-2xl text-slate-500 mb-3 border border-slate-200/50 shadow-inner">
                            <Lock className="w-6 h-6 text-slate-400 font-bold" />
                          </div>
                          <h4 className="font-extrabold text-slate-800 text-sm tracking-tight">Distribuição de Receita</h4>
                          <p className="text-xs text-slate-500 max-w-xs mt-1 leading-relaxed font-sans">
                            Métricas e proporções de receitas de mão de obra e peças estão bloqueadas para o cargo de Mecânico.
                          </p>
                        </div>
                      )}
                      <div>
                        <h3 className="text-base font-bold tracking-tight text-slate-900">Distribuição de Receita</h3>
                        <p className="text-xs text-slate-500 mb-4">Composição do faturamento da oficina</p>
                      </div>

                      <div className="flex-1 flex flex-col justify-center items-center py-4 space-y-4">
                        <div className="relative w-36 h-36 flex items-center justify-center">
                          {/* Circle Composition indicator */}
                          <div className="w-full h-full rounded-full border-8 border-indigo-100 absolute"></div>
                          {/* Segment representing parts ratio */}
                          <div className="w-full h-full rounded-full border-8 border-indigo-600 border-t-transparent border-r-transparent absolute"></div>
                          
                          <div className="text-center z-10">
                            <span className="text-xs text-slate-400 font-medium block">Serviços Total</span>
                            <span className="text-base font-extrabold text-slate-800">{formatCurrency(stats.receitaMaoDeObra + stats.receitaPecas)}</span>
                          </div>
                        </div>

                        <div className="w-full grid grid-cols-2 gap-4 pt-2">
                          <div className="bg-slate-50 p-2.5 rounded-xl border border-slate-100 text-center">
                            <span className="text-[10px] font-semibold text-slate-400 block uppercase">Mão de Obra</span>
                            <span className="text-xs font-bold text-indigo-600">{formatCurrency(stats.receitaMaoDeObra)}</span>
                          </div>
                          <div className="bg-slate-50 p-2.5 rounded-xl border border-slate-100 text-center">
                            <span className="text-[10px] font-semibold text-slate-400 block uppercase">Peças</span>
                            <span className="text-xs font-bold text-slate-600">{formatCurrency(stats.receitaPecas)}</span>
                          </div>
                        </div>
                      </div>
                    </div>

                  </div>

                  {/* Latests Active Services table */}
                  <div className="bg-white rounded-3xl border border-slate-200/80 shadow-sm overflow-hidden">
                    <div className="p-5 border-b border-slate-100 flex items-center justify-between">
                      <div>
                        <h3 className="text-base font-bold text-slate-900">Ordens de Serviço em Aberto</h3>
                        <p className="text-xs text-slate-400">Serviços prioritários sob manutenção</p>
                      </div>
                      <button 
                        onClick={() => setActiveTab('servicos')} 
                        className="text-xs font-bold text-indigo-600 hover:text-indigo-800 flex items-center gap-1 hover:underline"
                      >
                        Ver todos <ChevronRight className="w-3.5 h-3.5" />
                      </button>
                    </div>

                    <div className="overflow-x-auto">
                      <table className="w-full text-left text-xs border-collapse">
                        <thead>
                          <tr className="bg-slate-50 border-b border-slate-100 text-slate-500 font-bold tracking-wider text-[10px] uppercase">
                            <th className="p-4">Cliente / Carro</th>
                            <th className="p-4">Problema / Descrição</th>
                            <th className="p-4">Criado em</th>
                            <th className="p-4">Status</th>
                            <th className="p-4 text-right">Total Estimado</th>
                            <th className="p-4">Ação</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-100 font-medium text-slate-700">
                          {stats.ultimosServicos.length === 0 ? (
                            <tr>
                              <td colSpan={6} className="p-8 text-center text-slate-400 font-normal">Nenhum serviço em andamento no momento.</td>
                            </tr>
                          ) : (
                            stats.ultimosServicos.map(s => (
                              <tr key={s.id} className="hover:bg-slate-50/50 transition">
                                <td className="p-4">
                                  <div className="font-bold text-slate-900">{s.cliente_nome}</div>
                                  <div className="text-slate-400 font-mono text-[10px] flex items-center gap-1.5 mt-0.5">
                                    <Car className="w-3 h-3 text-indigo-500" />
                                    <span>{s.veiculo_modelo || 'Veículo'} • <span className="uppercase text-slate-700">{s.veiculo_placa}</span></span>
                                  </div>
                                  {s.mecanico_nome && (
                                    <div className="text-[10px] text-slate-500 font-medium flex items-center gap-1 mt-0.5">
                                      <span className="bg-slate-105 border border-slate-200/60 px-1.5 py-0.2 rounded-full text-slate-650">
                                        🔧 {s.mecanico_nome}
                                      </span>
                                    </div>
                                  )}
                                </td>
                                <td className="p-4 max-w-xs truncate text-slate-600">{s.descricao}</td>
                                <td className="p-4 text-slate-500">{formatDate(s.criado_em)}</td>
                                <td className="p-4">
                                  {s.status === 'orcamento' && (
                                    <span className="inline-flex items-center gap-1.5 bg-slate-100 text-slate-700 px-2 py-1 rounded-full text-[10px] font-bold">
                                      <Clock className="w-3 h-3" /> Orçamento
                                    </span>
                                  )}
                                  {s.status === 'em_andamento' && (
                                    <span className="inline-flex items-center gap-1.5 bg-amber-50 text-amber-700 border border-amber-200/50 px-2 py-1 rounded-full text-[10px] font-bold">
                                      <Wrench className="w-3 h-3 animate-spin" /> Em Execução
                                    </span>
                                  )}
                                  {s.status === 'aguardando_pecas' && (
                                    <span className="inline-flex items-center gap-1.5 bg-amber-100 text-amber-800 px-2 py-1 rounded-full text-[10px] font-bold">
                                      <Package className="w-3 h-3" /> Aguardando Peças
                                    </span>
                                  )}
                                  {s.status === 'concluido' && (
                                    <span className="inline-flex items-center gap-1.5 bg-emerald-50 text-emerald-700 px-2 py-1 rounded-full text-[10px] font-bold">
                                      <CheckCircle2 className="w-3 h-3" /> Concluído
                                    </span>
                                  )}
                                  {s.status === 'cancelado' && (
                                    <span className="inline-flex items-center gap-1.5 bg-rose-50 text-rose-600 px-2 py-1 rounded-full text-[10px] font-bold line-through">
                                      Cancelado
                                    </span>
                                  )}
                                </td>
                                <td className="p-4 text-right font-bold text-slate-900">{formatCurrency(s.total)}</td>
                                <td className="p-4">
                                  <button 
                                    onClick={() => { setSelectedServico(s); setActiveModal('visualizar_servico'); }}
                                    className="p-1 text-slate-400 hover:text-indigo-600 hover:bg-indigo-50 rounded-lg transition"
                                    title="Visualizar Ordem"
                                    id={`view_recent_${s.id}`}
                                  >
                                    <FileText className="w-4 h-4" />
                                  </button>
                                </td>
                              </tr>
                            ))
                          )}
                        </tbody>
                      </table>
                    </div>
                  </div>

                </motion.div>
              )}

              {/* TAB 2: CLIENTES & VEÍCULOS */}
              {activeTab === 'clientes' && (
                <motion.div
                  key="tab_clientes"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.15 }}
                  className="space-y-6"
                >
                  
                  {/* Search and Action Toolbar */}
                  <div className="flex flex-col sm:flex-row items-center justify-between gap-4 bg-white p-4 rounded-3xl border border-slate-200/80 shadow-sm">
                    <div className="w-full sm:w-80 relative">
                      <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
                      <input 
                        type="search" 
                        placeholder="Buscar por nome, CPF/CNPJ, placa..."
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        className="w-full pl-10 pr-4 py-2 text-sm bg-slate-50 border border-slate-200 focus:border-indigo-500 focus:bg-white rounded-2xl outline-none transition"
                        id="cliente_search_input"
                      />
                    </div>
                    
                    <div className="w-full sm:w-auto flex flex-wrap gap-2 justify-end">
                      <button 
                        onClick={() => openClienteModal('criar')}
                        className="flex-1 sm:flex-none justify-center bg-indigo-600 hover:bg-indigo-700 text-white font-semibold text-xs px-4 py-2.5 rounded-2xl flex items-center gap-1.5 shadow-md shadow-indigo-100"
                        id="add_cliente_btn"
                      >
                        <UserPlus className="w-4 h-4" />
                        <span>Novo Cliente</span>
                      </button>
                      
                      <button 
                        onClick={() => openVeiculoModal('criar')}
                        className="flex-1 sm:flex-none justify-center bg-indigo-50 hover:bg-indigo-100 text-indigo-700 font-semibold text-xs px-4 py-2.5 rounded-2xl flex items-center gap-1.5"
                        id="add_veiculo_btn"
                      >
                        <Car className="w-4 h-4" />
                        <span>Vincular Veículo</span>
                      </button>
                    </div>
                  </div>

                  {/* Grid layout for Clients */}
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4" id="clientes_cards_grid">
                    {filteredClientes.length === 0 ? (
                      <div className="col-span-full bg-white p-12 text-center rounded-3xl border border-dashed border-slate-300">
                        <Users className="w-8 h-8 text-slate-400 mx-auto mb-2" />
                        <h4 className="font-bold text-slate-700">Nenhum cliente cadastrado</h4>
                        <p className="text-slate-400 text-xs mt-1">Sua busca ou banco não retornou clientes. Cadastre um novo!</p>
                      </div>
                    ) : (
                      filteredClientes.map(c => {
                        // find connected client vehicles
                        const clientVehicles = veiculos.filter(v => v.cliente_id === c.id);
                        
                        return (
                          <div key={c.id} className="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-sm flex flex-col justify-between hover:border-slate-300 hover:shadow-md transition gap-4">
                            <div className="space-y-3">
                              <div className="flex justify-between items-start">
                                <div>
                                  <h4 className="font-bold text-slate-900 tracking-tight text-base">{c.nome}</h4>
                                  <span className="text-[10px] text-slate-400 font-mono block mt-0.5">ID: {c.id.substring(0, 8)} • Cadastrado em {new Date(c.criado_em).toLocaleDateString('pt-BR')}</span>
                                </div>
                                
                                <div className="flex items-center gap-1">
                                  <button 
                                    onClick={() => {
                                      setSelectedCliente(c);
                                      setActiveModal('visualizar_cliente');
                                    }}
                                    className="p-1 px-2 hover:bg-slate-100 text-slate-500 hover:text-indigo-600 rounded-lg transition text-xs flex items-center gap-1"
                                    title="Visualizar Informações Detalhadas"
                                    id={`view_cli_${c.id}`}
                                  >
                                    <Eye className="w-3.5 h-3.5" />
                                  </button>
                                  <button 
                                    onClick={() => openClienteModal('editar', c)}
                                    className="p-1 px-2 hover:bg-slate-100 text-slate-500 hover:text-indigo-600 rounded-lg transition text-xs flex items-center gap-1"
                                    title="Editar Cliente"
                                    id={`edit_cli_${c.id}`}
                                  >
                                    <Edit3 className="w-3.5 h-3.5" />
                                  </button>
                                  <button 
                                    onClick={() => handleDeleteCliente(c.id, c.nome)}
                                    className={`p-1 px-2 rounded-lg transition text-xs flex items-center gap-1 ${
                                      currentUser?.funcao === 'Mecânico'
                                        ? 'opacity-40 text-slate-300 cursor-not-allowed bg-slate-50'
                                        : 'hover:bg-rose-50 text-slate-400 hover:text-rose-600'
                                    }`}
                                    title={currentUser?.funcao === 'Mecânico' ? "Acesso Restrito: Mecânicos não podem excluir clientes" : "Excluir Cliente"}
                                    id={`del_cli_${c.id}`}
                                  >
                                    <Trash2 className="w-3.5 h-3.5" />
                                  </button>
                                </div>
                              </div>

                              <div className="grid grid-cols-2 gap-3 pt-1 text-xs">
                                <div className="bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                  <span className="text-[10px] text-slate-400 block uppercase font-mono tracking-wider">Telefone</span>
                                  <span className="font-bold text-slate-800">{c.telefone || 'Sem telefone'}</span>
                                </div>
                                <div className="bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                  <span className="text-[10px] text-slate-400 block uppercase font-mono tracking-wider">CPF / CNPJ</span>
                                  <span className="font-bold text-slate-800">{c.cpf_cnpj || 'Sem documento'}</span>
                                </div>
                              </div>

                              {c.email && (
                                <div className="text-xs text-slate-500 bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                  <span className="text-[10px] text-slate-400 block uppercase font-mono">E-mail</span>
                                  <span className="font-medium text-slate-700">{c.email}</span>
                                </div>
                              )}

                              {c.endereco && (
                                <div className="text-xs text-slate-500 bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                  <span className="text-[10px] text-slate-400 block uppercase font-mono">Endereço</span>
                                  <span className="font-medium text-slate-700 line-clamp-1">{c.endereco}</span>
                                </div>
                              )}
                            </div>

                            {/* Registered Vehicles Box */}
                            <div className="border-t border-slate-100 pt-3 mt-1">
                              <span className="text-[10px] font-bold text-slate-400 block uppercase mb-1.5 font-mono tracking-wider">Carros Vinculados ({clientVehicles.length})</span>
                              {clientVehicles.length === 0 ? (
                                <div className="flex items-center justify-between bg-violet-50/50 p-2 rounded-xl border border-dashed border-violet-100 text-xs">
                                  <span className="text-slate-400">Nenhum veículo vinculado</span>
                                  <button 
                                    onClick={() => {
                                      openVeiculoModal('criar', undefined, c.id);
                                    }}
                                    className="text-indigo-600 hover:text-indigo-800 font-bold ml-2 underline text-[11px]"
                                  >
                                    Vincular Carro
                                  </button>
                                </div>
                              ) : (
                                <div className="space-y-1.5">
                                  {clientVehicles.map(v => (
                                    <div key={v.id} className="bg-slate-50/80 p-2.5 rounded-xl border border-slate-200/50 flex justify-between items-center text-xs">
                                      <div className="flex items-center gap-1.5">
                                        <Car className="w-3.5 h-3.5 text-indigo-500 shrink-0" />
                                        <span className="font-bold text-slate-800">{v.marca} {v.modelo}</span>
                                        <span className="text-[10px] text-slate-400">• {v.cor} • {v.ano}</span>
                                      </div>
                                      <div className="flex items-center gap-2">
                                        <span className="bg-white border border-slate-200 text-[10px] font-mono font-bold tracking-widest text-slate-800 px-2 py-0.5 rounded-md uppercase">
                                          {v.placa}
                                        </span>
                                        <div className="flex items-center gap-0.5">
                                          <button 
                                            onClick={() => openVeiculoModal('editar', v)}
                                            className="p-1 hover:bg-slate-200 text-slate-400 hover:text-slate-700 rounded transition"
                                            id={`edit_veh_${v.id}`}
                                          >
                                            <Edit3 className="w-3 h-3" />
                                          </button>
                                          <button 
                                            onClick={() => handleDeleteVeiculo(v.id, v.placa)}
                                            className={`p-1 rounded transition ${
                                              currentUser?.funcao === 'Mecânico'
                                                ? 'opacity-40 text-slate-300 cursor-not-allowed bg-slate-50'
                                                : 'hover:bg-rose-100 text-rose-500 hover:text-rose-700'
                                            }`}
                                            title={currentUser?.funcao === 'Mecânico' ? "Acesso Restrito: Mecânicos não podem excluir carros" : "Excluir Veículo"}
                                            id={`del_veh_${v.id}`}
                                          >
                                            <Trash2 className="w-3 h-3" />
                                          </button>
                                        </div>
                                      </div>
                                    </div>
                                  ))}
                                </div>
                              )}
                            </div>

                          </div>
                        );
                      })
                    )}
                  </div>

                </motion.div>
              )}

              {/* TAB 3: ORÇAMENTOS & SERVIÇOS */}
              {activeTab === 'servicos' && (
                <motion.div
                  key="tab_servicos"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.15 }}
                  className="space-y-6"
                >
                  
                  {/* Filter and Switch bar */}
                  <div className="bg-white p-4 rounded-3xl border border-slate-200/80 shadow-sm space-y-3.5">
                    <div className="flex flex-wrap items-center justify-between gap-3">
                      <div>
                        <h3 className="text-base font-bold text-slate-900">Manutenção de Ordens de Serviço (O.S.)</h3>
                        <p className="text-xs text-slate-400">Totalizadores e orçamentos emitidos de clientes</p>
                      </div>
                      
                      {currentUser?.funcao !== 'Mecânico' && (
                        <button 
                          onClick={() => openServicoModal('criar')}
                          className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold text-xs px-4 py-2.5 rounded-2xl flex items-center gap-1.5 shadow-md shadow-indigo-100"
                          id="add_servico_btn"
                        >
                          <Plus className="w-4 h-4" />
                          <span>Abrir Nova O.S.</span>
                        </button>
                      )}
                    </div>

                    <div className="flex flex-wrap items-center justify-between gap-3 pt-2.5 border-t border-slate-100">
                      <div className="w-full sm:w-72 relative">
                        <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
                        <input 
                          type="search" 
                          placeholder="Buscar por O.S., cliente ou placa..."
                          value={searchQuery}
                          onChange={(e) => setSearchQuery(e.target.value)}
                          className="w-full pl-9 pr-3 py-1.8 text-xs bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl outline-none"
                          id="servico_search_input"
                        />
                      </div>

                      {/* Status Tabs filters */}
                      <div className="flex flex-wrap items-center gap-1 overflow-x-auto">
                        {[
                          { key: 'todos', label: 'Todos' },
                          { key: 'orcamento', label: 'Orçamentos' },
                          { key: 'em_andamento', label: 'Em Execução' },
                          { key: 'aguardando_pecas', label: 'Peças Pendentes' },
                          { key: 'concluido', label: 'Concluídos' },
                          { key: 'cancelado', label: 'Cancelados' },
                        ].map(f => (
                          <button
                            key={f.key}
                            onClick={() => setStatusFilter(f.key)}
                            className={`px-3 py-1.5 rounded-xl text-xs font-semibold whitespace-nowrap transition ${
                              statusFilter === f.key 
                                ? 'bg-indigo-600 text-white shadow-sm' 
                                : 'text-slate-500 hover:bg-slate-100 hover:text-slate-900'
                            }`}
                          >
                            {f.label}
                          </button>
                        ))}
                      </div>
                    </div>
                  </div>

                  {/* List / Table of services */}
                  <div className="bg-white rounded-3xl border border-slate-200/80 shadow-sm overflow-hidden" id="servicos_list_wrapper">
                    
                    {/* Mobile OS Cards Container (visible only on narrow viewports) */}
                    <div className="block md:hidden divide-y divide-slate-100" id="servicos_cards_mobile">
                      {filteredServicos.length === 0 ? (
                        <div className="p-8 text-center text-slate-400 font-normal">
                          Nenhum registro de O.S. atendeu aos critérios de busca.
                        </div>
                      ) : (
                        filteredServicos.map(s => {
                          const totalPartsCount = s.pecas_usadas?.reduce((sum, p) => sum + p.quantidade, 0) || 0;
                          return (
                            <div key={s.id} className="p-4 space-y-3 hover:bg-slate-50/30 transition">
                              <div className="flex items-start justify-between gap-2">
                                <div>
                                  <span className="bg-slate-900 text-white font-mono text-[9px] font-bold px-2 py-0.5 rounded shadow-sm">
                                    O.S. #{s.id.substring(0, 8).toUpperCase()}
                                  </span>
                                  <h4 className="font-bold text-slate-900 text-sm mt-1">{s.cliente_nome}</h4>
                                  <div className="text-[11px] text-slate-500 font-mono flex items-center gap-1.5 mt-0.5">
                                    <Car className="w-3.5 h-3.5 text-indigo-500 shrink-0" />
                                    <span>{s.veiculo_modelo}</span>
                                    <span className="uppercase bg-slate-100 px-1 py-0.2 rounded font-bold text-slate-800 text-[10px]">{s.veiculo_placa}</span>
                                  </div>
                                  {s.mecanico_nome && (
                                    <div className="text-[10px] text-slate-500 font-medium flex items-center gap-1 mt-1 font-sans">
                                      <span className="bg-indigo-50 text-indigo-700 border border-indigo-150 px-2 py-0.5 rounded-md flex items-center gap-1">
                                        <Wrench className="w-3 h-3 text-indigo-550 shrink-0" /> {s.mecanico_nome}
                                      </span>
                                    </div>
                                  )}
                                </div>
                                
                                <div className="shrink-0 text-right">
                                  <div className="relative inline-block text-left" id={`status_selector_wrapper_mobile_${s.id}`}>
                                    <AnimatePresence mode="wait">
                                      <motion.button
                                        key={s.status}
                                        initial={{ opacity: 0, scale: 0.8 }}
                                        animate={{ opacity: 1, scale: 1 }}
                                        exit={{ opacity: 0, scale: 0.8 }}
                                        transition={{ type: "spring", stiffness: 350, damping: 25 }}
                                        onClick={(e) => {
                                          e.stopPropagation();
                                          setActiveStatusDropdownId(activeStatusDropdownId === `mobile_${s.id}` ? null : `mobile_${s.id}`);
                                        }}
                                        className={`px-2 py-0.8 rounded-full text-[9px] font-bold uppercase font-sans cursor-pointer transition-all duration-150 inline-flex items-center gap-1 hover:brightness-95 active:scale-95 shadow-sm border ${getStatusBadgeStyle(s.status)}`}
                                      >
                                        <span>{decodeStatusLabel(s.status)}</span>
                                        <ChevronDown className="w-3 h-3 hover:scale-110 shrink-0 opacity-80" />
                                      </motion.button>
                                    </AnimatePresence>

                                    <AnimatePresence>
                                      {activeStatusDropdownId === `mobile_${s.id}` && (
                                        <motion.div
                                          initial={{ opacity: 0, scale: 0.95, y: 3 }}
                                          animate={{ opacity: 1, scale: 1, y: 0 }}
                                          exit={{ opacity: 0, scale: 0.95, y: 3 }}
                                          transition={{ duration: 0.12 }}
                                          className="absolute right-0 mt-1.5 w-40 rounded-2xl bg-white p-1.5 shadow-xl border border-slate-200/80 z-50 flex flex-col focus:outline-none text-left"
                                        >
                                          <span className="text-[8px] uppercase font-bold text-slate-400 px-2 py-0.5 block">Status:</span>
                                          {STATUS_OPTIONS_LIST.map((opt) => (
                                            <button
                                              key={opt.key}
                                              onClick={(e) => {
                                                e.stopPropagation();
                                                handleUpdateStatus(s.id, opt.key as any);
                                                setActiveStatusDropdownId(null);
                                              }}
                                              className={`w-full text-left px-2 py-1.5 text-[9px] rounded-xl font-bold uppercase font-sans transition-all flex items-center justify-between ${opt.key === s.status ? 'bg-indigo-50 text-indigo-700' : 'text-slate-600 hover:bg-slate-50'}`}
                                            >
                                              <span>{opt.label}</span>
                                              {opt.key === s.status && (
                                                <span className="w-1 h-1 bg-indigo-600 rounded-full shrink-0" />
                                              )}
                                            </button>
                                          ))}
                                        </motion.div>
                                      )}
                                    </AnimatePresence>
                                  </div>
                                </div>
                              </div>

                              <p className="text-xs text-slate-600 font-normal line-clamp-2 bg-slate-50 p-2 rounded-xl border border-slate-100/70">
                                {s.descricao || 'Sem descrição cadastrada'}
                              </p>

                              <div className="grid grid-cols-3 gap-2 text-center text-[10px] font-mono">
                                <div className="bg-slate-50/50 p-1.5 rounded-lg border border-slate-100/80">
                                  <span className="text-slate-400 block text-[8px] uppercase font-bold">Mão de Obra</span>
                                  <span className="text-slate-700 font-bold block">{formatCurrency(s.mao_de_obra_valor)}</span>
                                </div>
                                <div className="bg-slate-50/50 p-1.5 rounded-lg border border-slate-100/80">
                                  <span className="text-slate-400 block text-[8px] uppercase font-bold">Peças</span>
                                  <span className="text-slate-700 font-bold block">{totalPartsCount} item(s)</span>
                                </div>
                                <div className="bg-indigo-50/30 p-1.5 rounded-lg border border-indigo-100">
                                  <span className="text-indigo-500 block text-[8px] uppercase font-bold">Total Geral</span>
                                  <span className="text-indigo-700 font-extrabold block">{formatCurrency(s.total)}</span>
                                </div>
                              </div>

                              {/* Quick status buttons for mobile card */}
                              <div className="bg-slate-50 p-2 rounded-2xl border border-slate-150/45 flex flex-wrap items-center justify-center gap-1.5 mt-2">
                                <span className="text-[8px] font-extrabold text-slate-450 uppercase tracking-widest mr-auto pl-1">Status Rápido:</span>
                                {s.status !== 'orcamento' && (
                                  <button
                                    onClick={() => handleUpdateStatus(s.id, 'orcamento')}
                                    className="px-2 py-1 text-[8.5px] font-bold uppercase rounded-lg bg-white border border-slate-200 text-slate-600 transition hover:bg-slate-100 cursor-pointer"
                                    title="Mudar para Orçamento"
                                  >
                                    Orçamento
                                  </button>
                                )}
                                {s.status !== 'em_andamento' && (
                                  <button
                                    onClick={() => handleUpdateStatus(s.id, 'em_andamento')}
                                    className="px-2 py-1 text-[8.5px] font-extrabold uppercase rounded-lg bg-indigo-50 border border-indigo-200 text-indigo-700 transition hover:bg-indigo-100 flex items-center gap-0.5 animate-pulse cursor-pointer"
                                    title="Mudar para Em Execução"
                                  >
                                    <span className="w-1.5 h-1.5 bg-indigo-600 rounded-full shrink-0"></span> Iniciar
                                  </button>
                                )}
                                {s.status !== 'aguardando_pecas' && (
                                  <button
                                    onClick={() => handleUpdateStatus(s.id, 'aguardando_pecas')}
                                    className="px-2 py-1 text-[8.5px] font-bold uppercase rounded-lg bg-amber-50 border border-amber-200 text-amber-850 transition hover:bg-amber-100 cursor-pointer"
                                    title="Mudar para Aguardando Peças"
                                  >
                                    Peças
                                  </button>
                                )}
                                {s.status !== 'concluido' && (
                                  <button
                                    onClick={() => handleUpdateStatus(s.id, 'concluido')}
                                    className="px-2 py-1 text-[8.5px] font-bold uppercase rounded-lg bg-emerald-50 border border-emerald-250 text-emerald-800 transition hover:bg-emerald-100 cursor-pointer"
                                    title="Mudar para Concluído"
                                  >
                                    ✓ Concluir
                                  </button>
                                )}
                              </div>

                              <div className="flex items-center justify-between pt-1.5 border-t border-slate-50">
                                <span className="text-[10px] text-slate-400">Criado em {new Date(s.criado_em).toLocaleDateString('pt-BR')}</span>
                                
                                <div className="flex items-center gap-1.5">
                                  <button 
                                    onClick={() => { setSelectedServico(s); setActiveModal('visualizar_servico'); }}
                                    className="p-1 px-2.5 bg-emerald-50 border border-emerald-200 hover:bg-emerald-100 text-emerald-700 rounded-lg transition text-xs flex items-center gap-1.5 font-bold cursor-pointer"
                                    id={`print_m_${s.id}`}
                                  >
                                    <Printer className="w-3.5 h-3.5" />
                                    <span>Imprimir O.S.</span>
                                  </button>
                                  {currentUser?.funcao !== 'Mecânico' && (
                                    <button 
                                      onClick={() => openServicoModal('editar', s)}
                                      className="p-1.5 hover:bg-indigo-50 text-indigo-600 rounded-lg bg-indigo-50/50 transition border border-indigo-100/50 cursor-pointer"
                                      id={`edit_m_${s.id}`}
                                    >
                                      <Edit3 className="w-3.5 h-3.5" />
                                    </button>
                                  )}
                                  <button 
                                    onClick={() => handleDeleteServico(s.id, s.id.substring(0,6))}
                                    className={`p-1.5 rounded-lg transition border ${
                                      currentUser?.funcao === 'Mecânico'
                                        ? 'opacity-40 text-slate-300 cursor-not-allowed bg-slate-50 border-slate-200'
                                        : 'hover:bg-rose-50 text-rose-600 bg-rose-50/50 border-rose-100/50'
                                    }`}
                                    title={currentUser?.funcao === 'Mecânico' ? "Acesso Restrito: Mecânicos não podem excluir ordens de serviço" : "Excluir Registro"}
                                    id={`del_m_${s.id}`}
                                  >
                                    <Trash2 className="w-3.5 h-3.5" />
                                  </button>
                                </div>
                              </div>
                            </div>
                          );
                        })
                      )}
                    </div>

                    {/* Desktop OS Table (visible starting from md size class) */}
                    <div className="hidden md:block overflow-x-auto" id="servicos_table_desktop">
                      <table className="w-full text-left text-xs border-collapse">
                        <thead>
                          <tr className="bg-slate-50 border-b border-slate-100 text-slate-500 font-bold tracking-wider text-[10px] uppercase">
                            <th className="p-4">O.S. / Carro</th>
                            <th className="p-4">Histórico / Descrição</th>
                            <th className="p-4">Mão de Obra</th>
                            <th className="p-4">Itens / Peças</th>
                            <th className="p-4 text-right">Faturamento Total</th>
                            <th className="p-4">Status</th>
                            <th className="p-4 text-center">Ações</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-100 font-medium text-slate-700">
                          {filteredServicos.length === 0 ? (
                            <tr>
                              <td colSpan={7} className="p-12 text-center text-slate-400 font-normal">Nenhum registro de O.S. atendeu aos critérios de busca.</td>
                            </tr>
                          ) : (
                            filteredServicos.map(s => {
                              // count parts
                              const totalPartsCount = s.pecas_usadas?.reduce((sum, p) => sum + p.quantidade, 0) || 0;
                              return (
                                <tr key={s.id} className="hover:bg-slate-50/50 transition">
                                  <td className="p-4 whitespace-nowrap">
                                    <div className="font-bold text-slate-900">{s.cliente_nome}</div>
                                    <div className="text-[10px] text-slate-400 font-mono flex items-center gap-1 mt-0.5">
                                      <Car className="w-3.5 h-3.5 text-indigo-500 shrink-0" />
                                      <span>{s.veiculo_modelo}</span>
                                      <span className="uppercase bg-slate-100 px-1 py-0.2 rounded font-semibold text-slate-800">{s.veiculo_placa}</span>
                                    </div>
                                    {s.mecanico_nome && (
                                      <div className="text-[9px] text-slate-500 font-medium flex items-center gap-1 mt-1 font-sans">
                                        <span className="bg-indigo-50 text-indigo-700 border border-indigo-100 px-1.5 py-0.2 rounded-md">
                                          🔧 {s.mecanico_nome}
                                        </span>
                                      </div>
                                    )}
                                    <span className="text-[9px] text-slate-300 block mt-1 font-mono">ID: {s.id.substring(0,6)}...</span>
                                  </td>
                                  
                                  <td className="p-4 max-w-sm truncate text-slate-600 font-normal">
                                    {s.descricao}
                                  </td>

                                  <td className="p-4 text-slate-500 font-mono">
                                    {formatCurrency(s.mao_de_obra_valor)}
                                  </td>

                                  <td className="p-4 text-slate-500 font-mono">
                                    <span className="bg-slate-50 border border-slate-150 px-2 py-0.8 rounded-lg text-slate-700 text-[10px]">
                                      {totalPartsCount} item(ns)
                                    </span>
                                  </td>

                                  <td className="p-4 text-right font-bold text-slate-900 font-mono">
                                    {formatCurrency(s.total)}
                                  </td>

                                  <td className="p-4">
                                    <div className="relative inline-block" id={`status_selector_wrapper_${s.id}`}>
                                      <AnimatePresence mode="wait">
                                        <motion.button
                                          key={s.status}
                                          initial={{ opacity: 0, scale: 0.8 }}
                                          animate={{ opacity: 1, scale: 1 }}
                                          exit={{ opacity: 0, scale: 0.8 }}
                                          transition={{ type: "spring", stiffness: 350, damping: 25 }}
                                          onClick={(e) => {
                                            e.stopPropagation();
                                            setActiveStatusDropdownId(activeStatusDropdownId === s.id ? null : s.id);
                                          }}
                                          className={`px-3 py-1 rounded-full text-[10px] font-extrabold uppercase font-sans cursor-pointer transition-all duration-150 inline-flex items-center gap-1 hover:brightness-95 active:scale-95 shadow-sm border ${getStatusBadgeStyle(s.status)}`}
                                        >
                                          <span>{decodeStatusLabel(s.status)}</span>
                                          <ChevronDown className="w-3.5 h-3.5 hover:scale-110 shrink-0 opacity-80" />
                                        </motion.button>
                                      </AnimatePresence>

                                      <AnimatePresence>
                                        {activeStatusDropdownId === s.id && (
                                          <motion.div
                                            initial={{ opacity: 0, scale: 0.95, y: 3 }}
                                            animate={{ opacity: 1, scale: 1, y: 0 }}
                                            exit={{ opacity: 0, scale: 0.95, y: 3 }}
                                            transition={{ duration: 0.12 }}
                                            className="absolute left-0 mt-1.5 w-44 rounded-2xl bg-white p-1.5 shadow-xl border border-slate-200/80 z-50 flex flex-col focus:outline-none"
                                          >
                                            <span className="text-[9px] uppercase font-bold text-slate-400 px-2.5 py-1 block">Alterar Status:</span>
                                            {STATUS_OPTIONS_LIST.map((opt) => (
                                              <button
                                                key={opt.key}
                                                onClick={(e) => {
                                                  e.stopPropagation();
                                                  handleUpdateStatus(s.id, opt.key as any);
                                                  setActiveStatusDropdownId(null);
                                                }}
                                                className={`w-full text-left px-2.5 py-2 text-[10px] rounded-xl font-bold uppercase font-sans transition-all flex items-center justify-between ${opt.key === s.status ? 'bg-indigo-50 text-indigo-700' : 'text-slate-600 hover:bg-slate-50'}`}
                                              >
                                                <span>{opt.label}</span>
                                                {opt.key === s.status && (
                                                  <span className="w-1.5 h-1.5 bg-indigo-600 rounded-full shrink-0" />
                                                )}
                                              </button>
                                            ))}
                                          </motion.div>
                                        )}
                                      </AnimatePresence>

                                      {/* Quick action buttons on desktop */}
                                      <div className="flex gap-1 mt-1.5 justify-start">
                                        {s.status !== 'orcamento' && (
                                          <button
                                            onClick={(e) => { e.stopPropagation(); handleUpdateStatus(s.id, 'orcamento'); }}
                                            className="px-1.5 py-0.5 text-[8px] font-extrabold uppercase rounded bg-white hover:bg-slate-50 border border-slate-200 text-slate-500 transition-all cursor-pointer shadow-2xs"
                                            title="Mudar status para Orçamento"
                                          >
                                            Orc
                                          </button>
                                        )}
                                        {s.status !== 'em_andamento' && (
                                          <button
                                            onClick={(e) => { e.stopPropagation(); handleUpdateStatus(s.id, 'em_andamento'); }}
                                            className="px-1.5 py-0.5 text-[8px] font-extrabold uppercase rounded bg-indigo-50 hover:bg-indigo-100 border border-indigo-200 text-indigo-700 transition-all cursor-pointer hover:shadow-xs animate-pulse"
                                            title="Iniciar Serviço"
                                          >
                                            Inic
                                          </button>
                                        )}
                                        {s.status !== 'aguardando_pecas' && (
                                          <button
                                            onClick={(e) => { e.stopPropagation(); handleUpdateStatus(s.id, 'aguardando_pecas'); }}
                                            className="px-1.5 py-0.5 text-[8px] font-extrabold uppercase rounded bg-amber-50 hover:bg-amber-100 border border-amber-200 text-amber-800 transition-all cursor-pointer"
                                            title="Aguardando Peças"
                                          >
                                            Peç
                                          </button>
                                        )}
                                        {s.status !== 'concluido' && (
                                          <button
                                            onClick={(e) => { e.stopPropagation(); handleUpdateStatus(s.id, 'concluido'); }}
                                            className="px-1.5 py-0.5 text-[8px] font-extrabold uppercase rounded bg-emerald-50 hover:bg-emerald-100 border border-emerald-250 text-emerald-800 transition-all cursor-pointer"
                                            title="Marcar como Concluído"
                                          >
                                            ✓
                                          </button>
                                        )}
                                      </div>
                                    </div>
                                  </td>

                                  <td className="p-4">
                                    <div className="flex items-center justify-center gap-1.5">
                                      <button 
                                        onClick={() => { setSelectedServico(s); setActiveModal('visualizar_servico'); }}
                                        className="px-3 py-1.5 bg-emerald-50 hover:bg-emerald-100 text-emerald-700 hover:text-emerald-800 border border-emerald-200/60 rounded-xl text-[10.5px] font-bold flex items-center gap-1.5 transition-all shadow-sm cursor-pointer"
                                        title="Imprimir O.S."
                                        id={`print_b_${s.id}`}
                                      >
                                        <Printer className="w-3.5 h-3.5 shrink-0" />
                                        <span>Imprimir O.S.</span>
                                      </button>
                                      {currentUser?.funcao !== 'Mecânico' && (
                                        <button 
                                          onClick={() => openServicoModal('editar', s)}
                                          className="p-2 hover:bg-slate-100 text-slate-500 hover:text-indigo-600 rounded-xl transition-all border border-transparent hover:border-slate-200 cursor-pointer"
                                          title="Alterar O.S."
                                          id={`edit_b_${s.id}`}
                                        >
                                          <Edit3 className="w-3.5 h-3.5" />
                                        </button>
                                      )}
                                      <button 
                                        onClick={() => handleDeleteServico(s.id, s.id.substring(0,6))}
                                        className={`p-2 rounded-xl transition border ${
                                          currentUser?.funcao === 'Mecânico'
                                            ? 'opacity-40 text-slate-300 cursor-not-allowed bg-slate-50 border-slate-100'
                                            : 'hover:bg-rose-50 text-slate-400 hover:text-rose-600 border-transparent hover:border-rose-100'
                                        }`}
                                        title={currentUser?.funcao === 'Mecânico' ? "Acesso Restrito: Mecânicos não podem excluir registros" : "Apagar Registro"}
                                        id={`del_b_${s.id}`}
                                      >
                                        <Trash2 className="w-3.5 h-3.5" />
                                      </button>
                                    </div>
                                  </td>
                                </tr>
                              );
                            })
                          )}
                        </tbody>
                      </table>
                    </div>
                  </div>

                </motion.div>
              )}

              {/* TAB 4: ESTOQUE DE PEÇAS */}
              {activeTab === 'estoque' && (
                <motion.div
                  key="tab_estoque"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.15 }}
                  className="space-y-6"
                >
                  
                  {/* Header Stock Tools */}
                  <div className="bg-white p-4 rounded-3xl border border-slate-200/80 shadow-sm space-y-3.5">
                    <div className="flex flex-wrap items-center justify-between gap-3">
                      <div>
                        <h3 className="text-base font-bold text-slate-900">Almoxarifado & Estoque de Catálogo</h3>
                        <p className="text-xs text-slate-400">Gerenciamento quantitativo e alarmes de segurança</p>
                      </div>

                      <button 
                        onClick={() => openPecaModal('criar')}
                        className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold text-xs px-4 py-2.5 rounded-2xl flex items-center gap-1.5 shadow-md shadow-indigo-100"
                        id="add_catalogo_btn"
                      >
                        <Plus className="w-4 h-4" />
                        <span>Cadastrar Peça</span>
                      </button>
                    </div>

                    <div className="flex flex-wrap items-center justify-between gap-3 pt-2.5 border-t border-slate-100">
                      <div className="w-full sm:w-72 relative">
                        <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
                        <input 
                          type="search" 
                          placeholder="Buscar por código ou nome..."
                          value={searchQuery}
                          onChange={(e) => setSearchQuery(e.target.value)}
                          className="w-full pl-9 pr-3 py-1.8 text-xs bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl outline-none"
                          id="peca_search_input"
                        />
                      </div>

                      <div className="flex items-center gap-2">
                        <button 
                          onClick={() => setStockFilter('todos')}
                          className={`px-3 py-1.5 rounded-xl text-xs font-semibold whitespace-nowrap transition ${
                            stockFilter === 'todos' 
                              ? 'bg-slate-900 text-white shadow-sm' 
                              : 'text-slate-500 hover:bg-slate-100'
                          }`}
                        >
                          Catálogo Completo
                        </button>
                        <button 
                          onClick={() => setStockFilter('baixo')}
                          className={`px-3 py-1.5 rounded-xl text-xs font-semibold whitespace-nowrap transition flex items-center gap-1.5 ${
                            stockFilter === 'baixo' 
                              ? 'bg-amber-500 text-white shadow-sm' 
                              : 'text-amber-600 bg-amber-50 hover:bg-amber-100 border border-amber-200/55'
                          }`}
                        >
                          <AlertTriangle className="w-3.5 h-3.5" />
                          Estoque Crítico
                        </button>
                      </div>
                    </div>

                    {/* Categorias - Filtro Rápido */}
                    <div className="pt-3 border-t border-slate-100 space-y-2">
                      <div className="flex items-center justify-between">
                        <span className="text-[10px] uppercase font-bold text-slate-400 tracking-wider">Filtrar por Seção / Categoria:</span>
                        {stockCategoryFilter !== 'todos' && (
                          <button 
                            onClick={() => setStockCategoryFilter('todos')}
                            className="text-[10px] font-bold text-indigo-600 hover:text-indigo-800 transition-all"
                          >
                            Limpar Filtro
                          </button>
                        )}
                      </div>
                      <div className="flex items-center gap-2 overflow-x-auto pb-1 -mx-2 px-2 scrollbar-none">
                        <button
                          onClick={() => setStockCategoryFilter('todos')}
                          className={`px-3.5 py-1.5 rounded-xl text-[11px] font-semibold whitespace-nowrap transition-all duration-150 shrink-0 cursor-pointer ${
                            stockCategoryFilter === 'todos'
                              ? 'bg-indigo-600 text-white shadow-sm font-bold scale-[1.01]'
                              : 'bg-slate-50 text-slate-600 hover:bg-slate-100 border border-slate-200/50'
                          }`}
                        >
                          Mostrar Tudo
                        </button>
                        {availableCategories.map((cat) => (
                          <button
                            key={cat}
                            onClick={() => setStockCategoryFilter(cat)}
                            className={`px-3.5 py-1.5 rounded-xl text-[11px] font-semibold whitespace-nowrap transition-all duration-150 shrink-0 cursor-pointer ${
                              stockCategoryFilter.toLowerCase() === cat.toLowerCase()
                                ? 'bg-indigo-600 text-white shadow-sm font-bold scale-[1.01]'
                                : 'bg-slate-50 text-slate-650 hover:bg-slate-100 border border-slate-200/50'
                            }`}
                          >
                            {cat}
                          </button>
                        ))}
                        {availableCategories.length === 0 && (
                          <span className="text-[10px] text-slate-400 italic">Nenhuma categoria cadastrada no momento</span>
                        )}
                      </div>
                    </div>
                  </div>

                  {/* Stock Grid Cards */}
                  <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4" id="pecas_grid">
                    {filteredPecas.length === 0 ? (
                      <div className="col-span-full bg-white p-12 text-center rounded-3xl border border-dashed border-slate-300">
                        <Package className="w-8 h-8 text-slate-400 mx-auto mb-2" />
                        <h4 className="font-bold text-slate-700">Nenhuma peça localizada</h4>
                        <p className="text-slate-400 text-xs mt-1">Nossos registros não encontraram nenhuma peça correspondente no catálogo.</p>
                      </div>
                    ) : (
                      filteredPecas.map(p => {
                        const isCritico = p.quantidade <= p.limite_minimo;
                        
                        return (
                          <div key={p.id} className={`bg-white rounded-3xl p-5 border shadow-sm flex flex-col justify-between hover:shadow-md transition ${
                            isCritico ? 'border-amber-200/80 bg-amber-50/20' : 'border-slate-200/80'
                          }`}>
                            <div className="space-y-3">
                              <div className="flex items-start justify-between">
                                <div>
                                  {p.categoria && (
                                    <span className="bg-slate-100 text-slate-600 font-semibold px-2 py-0.5 rounded-full text-[10px] uppercase font-mono tracking-wider mb-1.5 inline-block">
                                      {p.categoria}
                                    </span>
                                  )}
                                  <h4 className="font-bold text-slate-900 tracking-tight text-sm line-clamp-2">{p.nome}</h4>
                                  <span className="text-[10px] text-slate-400 font-mono block mt-1">CÓDIGO: {p.codigo}</span>
                                </div>

                                <div className="flex items-center gap-1 shrink-0">
                                  <button
                                    onClick={() => openPecaModal('editar', p)}
                                    className="p-1 hover:bg-slate-100 text-slate-400 hover:text-indigo-600 rounded transition"
                                    id={`edit_peca_${p.id}`}
                                  >
                                    <Edit3 className="w-3.5 h-3.5" />
                                  </button>
                                  <button
                                    onClick={() => handleDeletePeca(p.id, p.nome)}
                                    className={`p-1 rounded transition ${
                                      currentUser?.funcao === 'Mecânico'
                                        ? 'opacity-40 text-slate-300 cursor-not-allowed bg-slate-50'
                                        : 'hover:bg-rose-50 text-slate-400 hover:text-rose-600'
                                    }`}
                                    title={currentUser?.funcao === 'Mecânico' ? "Acesso Restrito: Mecânicos não podem excluir itens do estoque" : "Excluir Peça"}
                                    id={`del_peca_${p.id}`}
                                  >
                                    <Trash2 className="w-3.5 h-3.5" />
                                  </button>
                                </div>
                              </div>

                              {/* Stock Quantity Indicators */}
                              <div className="bg-slate-50 p-3 rounded-2xl border border-slate-100/80 flex items-center justify-between">
                                <div>
                                  <span className="text-[9px] text-slate-400 block uppercase font-mono tracking-wider">Disponível em Estoque</span>
                                  <span className={`text-base font-extrabold ${isCritico ? 'text-amber-600' : 'text-slate-800'}`}>
                                    {p.quantidade} un.
                                  </span>
                                </div>
                                <div className="text-right">
                                  <span className="text-[9px] text-slate-400 block uppercase font-mono tracking-wider">Limite Alerta</span>
                                  <span className="text-xs font-bold text-slate-600">
                                    {p.limite_minimo} un.
                                  </span>
                                </div>
                              </div>

                              {/* Price tags */}
                              <div className="grid grid-cols-2 gap-2 text-xs">
                                <div className="bg-slate-100/40 p-2.5 rounded-xl text-center">
                                  <span className="text-[9px] text-slate-400 block font-mono">Preço Custo</span>
                                  <span className="font-bold text-slate-500 font-mono">{formatCurrency(p.preco_custo)}</span>
                                </div>
                                <div className="bg-indigo-50/30 p-2.5 rounded-xl text-center border border-indigo-100/50">
                                  <span className="text-[9px] text-indigo-400 block font-mono font-medium">Preço Venda</span>
                                  <span className="font-extrabold text-indigo-700 font-mono">{formatCurrency(p.preco_venda)}</span>
                                </div>
                              </div>
                            </div>

                            {isCritico && (
                              <div className="bg-amber-100/55 text-amber-900 text-[10px] font-semibold mt-3 p-2 rounded-xl flex items-center gap-1.5">
                                <AlertTriangle className="w-3.5 h-3.5 text-amber-600 shrink-0" />
                                <span>Estoque abaixo do recomendado. Reponha este item!</span>
                              </div>
                            )}
                          </div>
                        );
                      })
                    )}
                  </div>

                </motion.div>
              )}

              {/* TAB 7: ALERTAS DE REVISÃO */}
              {activeTab === 'alertas' && (
                <motion.div
                  key="tab_alertas"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.15 }}
                  className="space-y-6"
                  id="tab_alertas_revisao"
                >
                  {/* Header Card */}
                  <div className="bg-white rounded-3xl p-5 sm:p-6 border border-slate-200/80 shadow-xs flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                      <div className="flex items-center gap-2 mb-1">
                        <div className="bg-amber-100 text-amber-700 p-1.5 rounded-lg">
                          <Bell className="w-5 h-5 shrink-0" />
                        </div>
                        <h2 className="text-lg font-bold text-slate-900">Alertas de Revisão Preventiva</h2>
                      </div>
                      <p className="text-xs text-slate-500 max-w-xl">
                        Fidelize seus clientes com lembretes automáticos! Agende alertas por quilometragem ou data e envie notificações profissionais diretamente pelo WhatsApp.
                      </p>
                    </div>
                    <button
                      onClick={() => openAlertaModal('criar')}
                      className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold text-xs px-4 py-2.5 rounded-2xl flex items-center gap-1.5 shadow-md shadow-indigo-100 shrink-0 self-stretch sm:self-auto justify-center transition"
                      id="btn_criar_alerta_revisao"
                    >
                      <Plus className="w-4 h-4" />
                      <span>Agendar Próxima Manutenção</span>
                    </button>
                  </div>

                  {/* Bento Grid Stats Card */}
                  <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                    {/* Atrasados */}
                    <div className="bg-red-50 border border-red-100 rounded-2xl p-4 flex flex-col">
                      <span className="text-[10px] text-red-500 uppercase font-mono tracking-wider font-extrabold flex items-center gap-1">
                        <span className="h-2 w-2 rounded-full bg-red-600 animate-ping shrink-0" />
                        Atrasados / Urgentes
                      </span>
                      <span className="text-2xl font-black font-mono text-red-700 mt-1">
                        {alertas.filter(a => a.status === 'pendente' && new Date(a.data_alerta) < new Date()).length}
                      </span>
                      <span className="text-[10px] text-red-600 font-semibold mt-1">Requerem contato hoje</span>
                    </div>

                    {/* Pendentes */}
                    <div className="bg-amber-50 border border-amber-100 rounded-2xl p-4 flex flex-col">
                      <span className="text-[10px] text-amber-600 uppercase font-mono tracking-wider font-extrabold">
                        Próximas Revisões (Pendente)
                      </span>
                      <span className="text-2xl font-black font-mono text-amber-700 mt-1">
                        {alertas.filter(a => a.status === 'pendente').length}
                      </span>
                      <span className="text-[10px] text-amber-600 font-semibold mt-1">Aguardando manutenção</span>
                    </div>

                    {/* Notificados */}
                    <div className="bg-blue-50 border border-blue-100 rounded-2xl p-4 flex flex-col">
                      <span className="text-[10px] text-blue-600 uppercase font-mono tracking-wider font-extrabold">
                        Clientes Notificados
                      </span>
                      <span className="text-2xl font-black font-mono text-blue-700 mt-1">
                        {alertas.filter(a => a.status === 'notificado').length}
                      </span>
                      <span className="text-[10px] text-blue-600 font-semibold mt-1">Mensagem enviada</span>
                    </div>

                    {/* Concluídos */}
                    <div className="bg-emerald-50 border border-emerald-100 rounded-2xl p-4 flex flex-col">
                      <span className="text-[10px] text-emerald-600 uppercase font-mono tracking-wider font-extrabold">
                        Manutenções Concluídas
                      </span>
                      <span className="text-2xl font-black font-mono text-emerald-700 mt-1">
                        {alertas.filter(a => a.status === 'concluido').length}
                      </span>
                      <span className="text-[10px] text-emerald-600 font-semibold mt-1">Clientes satisfeitos ✓</span>
                    </div>
                  </div>

                  {/* Sugestão Inteligente (Aumentador de Faturamento) */}
                  <div className="bg-linear-to-r from-indigo-900 to-slate-900 text-white rounded-3xl p-5 border border-slate-800 shadow-md flex flex-col md:flex-row justify-between items-start md:items-center gap-4 relative overflow-hidden">
                    <div className="absolute top-0 right-0 w-32 h-32 bg-indigo-500/10 rounded-full blur-2xl" />
                    <div className="relative">
                      <span className="bg-indigo-500 text-white text-[9px] font-bold tracking-widest px-2 py-0.5 rounded-full uppercase">💡 IA Sugestão Inteligente</span>
                      <h3 className="font-bold text-sm tracking-tight text-indigo-100 mt-2">Deseja impulsionar o faturamento da semana?</h3>
                      <p className="text-xs text-indigo-200 mt-1 max-w-2xl">
                        Identificamos veículos que realizaram manutenção há mais de 3 meses. Você pode cadastrar um lembrete de revisão de rotina (Verificação de Suspensão / Troca de Óleo de Motor) para aumentar seu agendamento em até 30%.
                      </p>
                    </div>
                    <button
                      onClick={() => {
                        const targetV = veiculos[0];
                        if (targetV) {
                          openAlertaModal('criar', {
                            veiculo_id: targetV.id,
                            tipo_revisao: 'Revisão Periódica Preventiva',
                            data_alerta: new Date(Date.now() + 15 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
                            km_alerta: '62000',
                            descricao: 'Recomendação periódica aos 6 meses da última visita geral.',
                          });
                        } else {
                          triggerToast("Cadastre um veículo primeiro!");
                        }
                      }}
                      className="bg-white text-slate-900 hover:bg-indigo-50 font-extrabold text-xs px-4 py-2.5 rounded-2xl shrink-0 self-stretch sm:self-auto justify-center transition flex items-center gap-1.5 shadow-sm shadow-indigo-950"
                    >
                      <Bell className="w-3.5 h-3.5 text-indigo-600" />
                      <span>Cadastrar Alerta Sugerido</span>
                    </button>
                  </div>

                  {/* Filter Pills list & Search Bar */}
                  <div className="flex flex-col sm:flex-row gap-3 justify-between items-center bg-white p-3 border border-slate-200/80 rounded-2xl shadow-xs">
                    <div className="flex flex-wrap items-center gap-1 w-full sm:w-auto">
                      {(['todos', 'pendente', 'atrasado', 'notificado', 'concluido'] as const).map(f => {
                        const count = f === 'todos' ? alertas.length 
                          : f === 'atrasado' ? alertas.filter(a => a.status === 'pendente' && new Date(a.data_alerta) < new Date()).length
                          : alertas.filter(a => a.status === f).length;
                        
                        const label = f === 'todos' ? 'Todos'
                          : f === 'pendente' ? 'Pendentes'
                          : f === 'atrasado' ? '📅 Atrasados'
                          : f === 'notificado' ? '💬 Notificados'
                          : '✓ Concluídos';

                        const colorClass = alertaFilter === f
                          ? 'bg-indigo-600 text-white shadow-xs'
                          : f === 'atrasado' && count > 0 
                            ? 'text-red-600 hover:bg-red-50 hover:text-red-800 font-bold'
                            : 'text-slate-600 hover:bg-slate-100/70 hover:text-slate-900 font-semibold';

                        return (
                          <button
                            key={f}
                            onClick={() => setAlertaFilter(f)}
                            className={`px-3 py-1.5 rounded-xl text-xs font-bold transition flex items-center gap-1.5 cursor-pointer ${colorClass}`}
                          >
                            <span>{label}</span>
                            <span className={`text-[10px] px-1.5 py-0.2 rounded-full font-mono ${alertaFilter === f ? 'bg-white/20 text-white font-extrabold' : 'bg-slate-100 text-slate-500 font-bold'}`}>
                              {count}
                            </span>
                          </button>
                        );
                      })}
                    </div>

                    {/* Search Field */}
                    <div className="relative w-full sm:w-64">
                      <div className="absolute inset-y-0 left-3 flex items-center pointer-events-none text-slate-400">
                        <Search className="w-4 h-4" />
                      </div>
                      <input
                        type="text"
                        placeholder="Busque por placa, modelo ou dono..."
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl pl-9 pr-4 py-1.5 outline-none text-xs transition"
                      />
                    </div>
                  </div>

                  {/* Alerts Grid Render */}
                  {(() => {
                    const filtered = alertas.filter(item => {
                      if (alertaFilter === 'atrasado') {
                        if (item.status !== 'pendente' || new Date(item.data_alerta) >= new Date()) return false;
                      } else if (alertaFilter !== 'todos' && item.status !== alertaFilter) {
                        return false;
                      }

                      if (searchQuery.trim() !== '') {
                        const q = searchQuery.toLowerCase();
                        const client = clientes.find(c => c.id === item.cliente_id);
                        const vehicle = veiculos.find(v => v.id === item.veiculo_id);
                        
                        const clientName = client?.nome.toLowerCase() || '';
                        const vehicleModel = vehicle?.modelo.toLowerCase() || '';
                        const vehiclePlate = vehicle?.placa.toLowerCase() || '';
                        const revisionType = item.tipo_revisao.toLowerCase() || '';

                        return clientName.includes(q) || vehicleModel.includes(q) || vehiclePlate.includes(q) || revisionType.includes(q);
                      }

                      return true;
                    });

                    if (filtered.length === 0) {
                      return (
                        <div className="bg-white rounded-3xl p-12 border border-slate-200/80 shadow-xs text-center flex flex-col items-center justify-center">
                          <div className="bg-slate-50 text-slate-400 p-4 rounded-full mb-4">
                            <Bell className="w-8 h-8 opacity-40 animate-pulse" />
                          </div>
                          <h4 className="text-sm font-bold text-slate-800">Nenhum lembrete de revisão encontrado</h4>
                          <p className="text-xs text-slate-400 mt-1 max-w-sm">
                            Não encontramos nenhum registro correspondente aos filtros ativos atualmente. Crie ou altere seus parâmetros de busca.
                          </p>
                          <button
                            onClick={() => openAlertaModal('criar')}
                            className="text-xs font-bold text-indigo-600 hover:text-indigo-700 bg-indigo-50 hover:bg-indigo-100 rounded-xl px-4 py-2 mt-4 transition cursor-pointer"
                          >
                            Cadastrar Alerta Prontamente
                          </button>
                        </div>
                      );
                    }

                    return (
                      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        {filtered.map(item => {
                          const client = clientes.find(c => c.id === item.cliente_id);
                          const vehicle = veiculos.find(v => v.id === item.veiculo_id);
                          const isAtrasado = item.status === 'pendente' && new Date(item.data_alerta) < new Date();
                          
                          return (
                            <motion.div
                              layoutId={`alerta-card-${item.id}`}
                              key={item.id}
                              className={`bg-white rounded-2xl border ${isAtrasado ? 'border-red-200 shadow-xs shadow-red-50/50' : 'border-slate-200/80'} p-4.5 flex flex-col justify-between transition-all hover:shadow-xs`}
                            >
                              <div className="space-y-3">
                                <div className="flex items-start justify-between gap-2">
                                  <div>
                                    <span className="text-[9px] uppercase font-mono text-slate-400 tracking-wider font-extrabold">SERVIÇO DE LEMBRETE</span>
                                    <h4 className="font-extrabold text-xs text-slate-800 tracking-tight leading-snug">{item.tipo_revisao}</h4>
                                  </div>
                                  
                                  {item.status === 'concluido' ? (
                                    <span className="bg-slate-100 text-slate-600 text-[9.5px] font-extrabold uppercase tracking-wider px-2 py-0.5 rounded-full flex items-center gap-0.5 whitespace-nowrap shrink-0">
                                      <CheckCircle2 className="w-3 h-3 text-emerald-500" />
                                      Arquivado
                                    </span>
                                  ) : item.status === 'notificado' ? (
                                    <span className="bg-blue-50 text-blue-700 text-[9.5px] font-extrabold uppercase tracking-wider px-2 py-0.5 rounded-full flex items-center gap-0.5 whitespace-nowrap shrink-0 border border-blue-105">
                                      <Check className="w-3 h-3 text-indigo-600" />
                                      Notificado
                                    </span>
                                  ) : isAtrasado ? (
                                    <span className="bg-red-500 text-white text-[9.5px] font-extrabold uppercase tracking-wider px-2 py-0.5 rounded-full flex items-center gap-0.5 animate-pulse whitespace-nowrap shrink-0 shadow-xs">
                                      📅 Atrasado
                                    </span>
                                  ) : (
                                    <span className="bg-amber-50 text-amber-700 text-[9.5px] font-extrabold uppercase tracking-wider px-2 py-0.5 rounded-full flex items-center gap-0.5 whitespace-nowrap shrink-0 border border-amber-200/60">
                                      ⏳ Pendente
                                    </span>
                                  )}
                                </div>

                                <div className="bg-slate-50 rounded-xl p-3 space-y-1.5 text-xs text-slate-600 border border-slate-100">
                                  <div className="flex items-center gap-1.5 font-bold text-slate-700">
                                    <Car className="w-3.5 h-3.5 text-indigo-500 shrink-0" />
                                    <span>{vehicle ? `${vehicle.marca} ${vehicle.modelo}` : 'Veículo Desconhecido'}</span>
                                  </div>
                                  <div className="flex items-center gap-1 justify-between font-mono text-[10px] text-slate-400 mt-1">
                                    <span className="bg-white border border-slate-200 text-slate-800 px-1.5 py-0.5 rounded font-extrabold uppercase shrink-0 tracking-widest">{vehicle?.placa || 'PLACA_OK'}</span>
                                    <span>Ano {vehicle?.ano || '2020'} • {vehicle?.cor || 'Cinza'}</span>
                                  </div>
                                </div>

                                <div className="space-y-1 text-xs">
                                  <div className="flex items-center gap-1">
                                    <Users className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                                    <span className="font-bold text-slate-700 text-[11px] truncate">{client?.nome || 'Proprietário'}</span>
                                  </div>
                                  {client?.telefone && (
                                    <div className="text-[10px] text-slate-500/90 pl-5 font-semibold font-mono">{client.telefone}</div>
                                  )}
                                </div>

                                <div className="grid grid-cols-2 gap-2 text-[11px] bg-slate-50 border border-slate-100 rounded-xl p-2.5">
                                  <div>
                                    <span className="text-[9px] text-slate-400 font-mono block uppercase">Data Limite</span>
                                    <span className="font-extrabold text-slate-700 block font-sans">
                                      {new Date(item.data_alerta + 'T12:00:00').toLocaleDateString('pt-BR')}
                                    </span>
                                  </div>
                                  <div>
                                    <span className="text-[9px] text-slate-400 font-mono block uppercase">Odômetro Meta</span>
                                    <span className="font-black text-indigo-700 block font-mono">
                                      {item.km_alerta ? `${Number(item.km_alerta).toLocaleString('pt-BR')} KM` : 'Não exigido'}
                                    </span>
                                  </div>
                                </div>

                                {item.descricao && (
                                  <p className="text-[11px] text-slate-400 italic bg-slate-50 border border-slate-100 rounded-lg p-2 leading-relaxed">
                                    &ldquo;{item.descricao}&rdquo;
                                  </p>
                                )}

                                {item.status === 'notificado' && item.notificado_em && (
                                  <div className="text-[10px] text-indigo-600 font-semibold bg-indigo-50/50 border border-indigo-100/30 rounded-lg p-2 flex items-center gap-1.5">
                                    <MessageSquare className="w-3.5 h-3.5 text-indigo-600 shrink-0" />
                                    <span>Notificado: {new Date(item.notificado_em).toLocaleDateString('pt-BR')} às {new Date(item.notificado_em).toLocaleTimeString('pt-BR', {hour: '2-digit', minute:'2-digit'})}</span>
                                  </div>
                                )}
                              </div>

                              <div className="border-t border-slate-100 pt-3 mt-4 flex items-center justify-between gap-1">
                                <div className="flex items-center gap-1">
                                  <button
                                    onClick={() => handleDeleteAlerta(item.id, item.tipo_revisao)}
                                    className={`p-1.5 rounded-xl transition border cursor-pointer ${
                                      currentUser?.funcao === 'Mecânico'
                                        ? 'opacity-45 text-slate-300 cursor-not-allowed bg-slate-50 border-slate-100'
                                        : 'hover:bg-red-50 text-slate-400 hover:text-red-600 border-transparent hover:border-red-100'
                                    }`}
                                    title={currentUser?.funcao === 'Mecânico' ? "Acesso Restrito: Mecânicos não podem excluir alertas" : "Excluir Alerta"}
                                  >
                                    <Trash2 className="w-3.5 h-3.5" />
                                  </button>
                                  <button
                                    onClick={() => openAlertaModal('editar', item)}
                                    className="p-1.5 hover:bg-slate-100 text-slate-400 hover:text-indigo-600 rounded-xl transition border border-transparent hover:border-slate-200 cursor-pointer"
                                    title="Editar Lembrete"
                                  >
                                    <Edit3 className="w-3.5 h-3.5" />
                                  </button>
                                </div>

                                <div className="flex items-center gap-1">
                                  {item.status !== 'concluido' && (
                                    <>
                                      <button
                                        onClick={() => handleNotifyAlerta(item)}
                                        className="bg-emerald-50 hover:bg-emerald-100 text-emerald-700 text-[11px] font-bold py-1.5 px-2.5 rounded-xl transition flex items-center gap-1 border border-emerald-200/50 cursor-pointer text-nowrap"
                                        title="Enviar Lembrete por WhatsApp"
                                      >
                                        <MessageSquare className="w-3.5 h-3.5" />
                                        <span>Notificar</span>
                                      </button>
                                      
                                      <button
                                        onClick={() => handleCompleteAlerta(item.id)}
                                        className="bg-indigo-600 hover:bg-indigo-700 text-white text-[11px] font-bold py-1.5 px-2.5 rounded-xl transition flex items-center gap-1 cursor-pointer select-none text-nowrap"
                                        title="Registrar Manutenção como Resolvida"
                                      >
                                        <Check className="w-3.5 h-3.5" />
                                        <span>Resolvido</span>
                                      </button>
                                    </>
                                  )}
                                  
                                  {item.status === 'concluido' && (
                                    <button
                                      onClick={() => openServicoModal('criar', undefined, {
                                        cliente_id: item.cliente_id,
                                        veiculo_id: item.veiculo_id,
                                        descricao: `Manutenção Preventiva Periódica de ${item.tipo_revisao} agendada.`
                                      })}
                                      className="bg-slate-900 hover:bg-slate-800 text-white text-[11px] font-bold py-1.5 px-3 rounded-xl transition flex items-center gap-1 cursor-pointer"
                                      title="Abrir uma O.S. para esta revisão"
                                    >
                                      <Wrench className="w-3.5 h-3.5" />
                                      <span>Abrir O.S.</span>
                                    </button>
                                  )}
                                </div>
                              </div>
                            </motion.div>
                          );
                        })}
                      </div>
                    );
                  })()}
                </motion.div>
              )}

               {/* TAB 4.1: BUSCA AVANÇADA MULTI-ENTIDADE */}
              {activeTab === 'busca_avancada' && (
                <motion.div
                  key="tab_busca_avancada"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.15 }}
                  className="space-y-6 animate-fade-in"
                >
                  {/* Search Title info */}
                  <div className="bg-gradient-to-r from-indigo-500 to-indigo-700 rounded-3xl p-6 text-white shadow-xl shadow-indigo-100 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                    <div className="space-y-1">
                      <h3 className="text-lg md:text-xl font-bold tracking-tight">Painel de Busca Avançada</h3>
                      <p className="text-xs text-indigo-100">Filtre, localize e explore informações cruzadas de clientes, veículos, O.S. e autopeças instantaneamente.</p>
                    </div>
                    <button
                      onClick={() => setShowAdvancedSearch(!showAdvancedSearch)}
                      className="bg-white/10 hover:bg-white/20 text-white font-semibold text-xs px-4 py-2.5 rounded-2xl flex items-center justify-center gap-1.5 backdrop-blur-xs transition self-start sm:self-center"
                    >
                      <Filter className="w-4 h-4" />
                      <span>{showAdvancedSearch ? 'Recolher Filtros' : 'Filtros Avançados'}</span>
                    </button>
                  </div>

                  {/* Core Inputs Block */}
                  <div className="bg-white rounded-3.5xl p-5 border border-slate-200/80 shadow-sm space-y-4">
                    <div className="relative">
                      <Search className="w-5 h-5 text-slate-400 absolute left-4 top-1/2 -translate-y-1/2" />
                      <input
                        type="search"
                        placeholder="Buscar cliente (nome, cpf), veículo (placa, chassi), O.S. (número, descrição) ou peça (código, fornecedor)..."
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        className="w-full pl-12 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl focus:border-indigo-500 focus:bg-white outline-none text-sm transition"
                        autoFocus
                      />
                    </div>

                    {/* Collapsible Advanced Filters Tray */}
                    <AnimatePresence>
                      {showAdvancedSearch && (
                        <motion.div
                          initial={{ height: 0, opacity: 0 }}
                          animate={{ height: 'auto', opacity: 1 }}
                          exit={{ height: 0, opacity: 0 }}
                          transition={{ duration: 0.2 }}
                          className="overflow-hidden border-t border-slate-100 pt-4"
                        >
                          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 text-xs font-sans">
                            {/* Date Picker Start */}
                            <div className="space-y-1">
                              <label className="font-bold text-slate-600 block">Data de Criação (De)</label>
                              <input
                                type="date"
                                value={searchStartDate}
                                onChange={(e) => setSearchStartDate(e.target.value)}
                                className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-550 rounded-xl px-3 py-2 outline-none"
                              />
                            </div>

                            {/* Date Picker End */}
                            <div className="space-y-1">
                              <label className="font-bold text-slate-600 block">Data de Criação (Até)</label>
                              <input
                                type="date"
                                value={searchEndDate}
                                onChange={(e) => setSearchEndDate(e.target.value)}
                                className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-550 rounded-xl px-3 py-2 outline-none"
                              />
                            </div>

                            {/* Status filter for orders */}
                            <div className="space-y-1">
                              <label className="font-bold text-slate-600 block">Status da Ordem / Serviço</label>
                              <select
                                value={statusFilter}
                                onChange={(e) => setStatusFilter(e.target.value)}
                                className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-550 rounded-xl px-3 py-2 outline-none font-medium text-slate-700"
                              >
                                <option value="todos">Todos os status</option>
                                <option value="orcamento">Orçamento</option>
                                <option value="em_andamento">Em Andamento</option>
                                <option value="aguardando_pecas">Aguardando Peças</option>
                                <option value="concluido">Concluído</option>
                              </select>
                            </div>

                            {/* Supplier search */}
                            <div className="space-y-1">
                              <label className="font-bold text-slate-600 block">Nome do Fornecedor (Peças)</label>
                              <input
                                type="text"
                                placeholder="Busca de fornecedor"
                                value={searchFornecedor}
                                onChange={(e) => setSearchFornecedor(e.target.value)}
                                className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-550 rounded-xl px-3 py-2 outline-none"
                              />
                            </div>

                            {/* Chassis Filter */}
                            <div className="space-y-1">
                              <label className="font-bold text-slate-600 block">Número do Chassi (Veículos)</label>
                              <input
                                type="text"
                                placeholder="Ex: 9BH..."
                                value={searchChassi}
                                onChange={(e) => setSearchChassi(e.target.value)}
                                className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-550 rounded-xl px-3 py-2 outline-none font-mono uppercase"
                              />
                            </div>

                            {/* Piece Category Filter */}
                            <div className="space-y-1">
                              <label className="font-bold text-slate-600 block">Categoria da Peça</label>
                              <input
                                type="text"
                                placeholder="Ex: Motor, Suspensão"
                                value={searchCategory}
                                onChange={(e) => setSearchCategory(e.target.value)}
                                className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-550 rounded-xl px-3 py-2 outline-none"
                              />
                            </div>
                          </div>

                          <div className="flex justify-end gap-2 mt-4 pt-4 border-t border-slate-100">
                            <button
                              type="button"
                              onClick={() => {
                                setSearchStartDate('');
                                setSearchEndDate('');
                                setStatusFilter('todos');
                                setSearchFornecedor('');
                                setSearchChassi('');
                                setSearchCategory('todos');
                                setSearchQuery('');
                              }}
                              className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-semibold px-4 py-2 rounded-xl text-xs transition"
                            >
                              Limpar Filtros
                            </button>
                          </div>
                        </motion.div>
                      )}
                    </AnimatePresence>
                  </div>

                  {/* Matching results layout */}
                  <div className="space-y-4">
                    <div className="flex items-center justify-between px-1">
                      <span className="text-xs font-bold text-slate-400 block uppercase tracking-wider font-mono">
                        Resultados Compatíveis ({getSearchMatches().length})
                      </span>
                    </div>

                    {getSearchMatches().length === 0 ? (
                      <div className="bg-white p-16 text-center rounded-3xl border border-slate-200/80 shadow-xs max-w-full">
                        <Search className="w-10 h-10 text-slate-300 mx-auto mb-3" />
                        <h4 className="font-bold text-slate-700 text-sm">Nenhum registro correspondente</h4>
                        <p className="text-slate-400 text-xs mt-1 max-w-md mx-auto">Não encontramos nada correspondente para os critérios informados. Ajuste os filtros adicionais.</p>
                      </div>
                    ) : (
                      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                        {getSearchMatches().map((res, idx) => {
                          const item = res.data;
                          
                          if (res.type === 'cliente') {
                            return (
                              <div key={`s_cli_${item.id}_${idx}`} className="bg-white border border-slate-200 rounded-3xl p-5 shadow-xs flex flex-col justify-between hover:border-slate-300 hover:shadow-md transition gap-4">
                                <div>
                                  <div className="flex justify-between items-start">
                                    <div>
                                      <span className="bg-indigo-50 text-indigo-700 text-[9px] font-bold px-2 py-0.5 rounded-md uppercase font-mono tracking-wider">Cliente</span>
                                      <h4 className="font-bold text-slate-900 text-sm mt-1">{item.nome}</h4>
                                    </div>
                                    <button
                                      onClick={() => {
                                        setSelectedCliente(item);
                                        setActiveModal('visualizar_cliente');
                                      }}
                                      className="p-1 px-2.5 bg-slate-50 hover:bg-indigo-50 border border-slate-150 rounded-xl text-indigo-600 font-bold text-[10px] flex items-center gap-1 transition"
                                    >
                                      <Eye className="w-3.5 h-3.5" />
                                      <span>Ficha</span>
                                    </button>
                                  </div>
                                  <div className="grid grid-cols-2 gap-2 mt-3 pt-1 text-xs">
                                    <div className="bg-slate-50 p-2 rounded-xl">
                                      <span className="text-[9px] text-slate-400 block">TELEFONE</span>
                                      <span className="font-bold text-slate-800">{item.telefone || 'Ainda sem'}</span>
                                    </div>
                                    <div className="bg-slate-50 p-2 rounded-xl">
                                      <span className="text-[9px] text-slate-400 block">CPF / CNPJ</span>
                                      <span className="font-bold text-slate-800">{item.cpf_cnpj || 'Ainda sem'}</span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            );
                          } else if (res.type === 'veiculo') {
                            return (
                              <div key={`s_veh_${item.id}_${idx}`} className="bg-white border border-slate-200 rounded-3xl p-5 shadow-xs hover:border-slate-300 transition flex flex-col justify-between">
                                <div className="space-y-3">
                                  <div className="flex justify-between items-start">
                                    <div>
                                      <span className="bg-violet-50 text-violet-700 text-[9px] font-bold px-2 py-0.5 rounded-md uppercase font-mono tracking-wider">Veículo do Cliente</span>
                                      <h4 className="font-bold text-slate-900 text-sm mt-1">{item.marca} {item.modelo}</h4>
                                    </div>
                                    <span className="bg-indigo-50 border border-indigo-100 text-indigo-700 text-xs font-bold px-2.5 py-0.5 rounded uppercase font-mono tracking-widest">{item.placa}</span>
                                  </div>
                                  <div className="bg-slate-50 p-3 rounded-2xl border border-slate-200/30 text-xs space-y-1.5">
                                    <div className="flex justify-between"><span className="text-slate-400">Cor / Ano:</span> <span className="font-semibold text-slate-800">{item.cor} • {item.ano}</span></div>
                                    {item.chassi && <div className="flex justify-between"><span className="text-slate-400">Chassi:</span> <span className="font-mono text-slate-800">{item.chassi}</span></div>}
                                  </div>
                                </div>
                              </div>
                            );
                          } else if (res.type === 'servico') {
                            const statusColor = item.status === 'concluido' 
                              ? 'bg-emerald-50 text-emerald-700 border-emerald-100' 
                              : item.status === 'em_andamento'
                              ? 'bg-sky-50 text-sky-700 border-sky-100'
                              : item.status === 'aguardando_pecas'
                              ? 'bg-amber-50 text-amber-700 border-amber-100'
                              : 'bg-slate-50 text-slate-600 border-slate-100';

                            return (
                              <div key={`s_os_${item.id}_${idx}`} className="bg-white border border-slate-200 rounded-3xl p-5 shadow-xs hover:border-slate-300 transition flex flex-col justify-between gap-3">
                                <div>
                                  <div className="flex justify-between items-start">
                                    <div>
                                      <span className="bg-amber-50 text-amber-700 text-[9px] font-bold px-2 py-0.5 rounded-md uppercase font-mono tracking-wider">Orçamento & OS</span>
                                      <h4 className="font-bold text-slate-900 text-sm mt-1">O.S. #{item.id.substring(0, 6).toUpperCase()}</h4>
                                    </div>
                                    <span className={`text-[10px] font-bold px-2 py-0.5 rounded-md border ${statusColor}`}>{item.status === 'concluido' ? 'Concluído' : item.status === 'em_andamento' ? 'Em Andamento' : item.status === 'aguardando_pecas' ? 'Aguardando Peças' : 'Orçamento'}</span>
                                  </div>
                                  <p className="text-xs text-slate-500 mt-2 line-clamp-2">{item.descricao || 'Sem descrição'}</p>
                                  <div className="bg-slate-50 p-2.5 rounded-xl border border-slate-200/20 text-xs space-y-1 mt-3">
                                    <p className="flex justify-between"><span className="text-slate-405 text-[10px]">CLIENTE:</span> <span className="font-bold text-slate-700 truncate max-w-[150px]">{item.cliente_nome || 'Desconhecido'}</span></p>
                                    <p className="flex justify-between"><span className="text-slate-405 text-[10px]">VEÍCULO PLACA:</span> <span className="font-bold text-slate-700 font-mono">{item.veiculo_placa || 'Sem Placa'}</span></p>
                                  </div>
                                </div>
                                <div className="border-t border-slate-100 pt-2.5 flex items-center justify-between text-xs">
                                  <span className="text-slate-400">{new Date(item.criado_em).toLocaleDateString('pt-BR')}</span>
                                  <div className="text-right shrink-0">
                                    <span className="font-extrabold text-slate-900">R$ {Number(item.total).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</span>
                                    <button 
                                      onClick={() => {
                                        setSelectedServico(item);
                                        setActiveModal('visualizar_servico');
                                      }}
                                      className="text-indigo-650 hover:text-indigo-800 block text-[10px] font-bold hover:underline"
                                    >
                                      Visualizar O.S.
                                    </button>
                                  </div>
                                </div>
                              </div>
                            );
                          } else if (res.type === 'peca') {
                            const isLow = item.quantidade <= item.limite_minimo;
                            return (
                              <div key={`s_pec_${item.id}_${idx}`} className="bg-white border border-slate-200 rounded-3xl p-5 shadow-xs hover:border-slate-300 transition flex flex-col justify-between">
                                <div className="space-y-3">
                                  <div className="flex justify-between items-start">
                                    <div>
                                      <span className="bg-emerald-50 text-emerald-700 text-[9px] font-bold px-2 py-0.5 rounded-md uppercase font-mono tracking-wider">Peça no Estoque</span>
                                      <h4 className="font-bold text-slate-900 text-sm mt-1">{item.nome}</h4>
                                    </div>
                                    <span className="bg-slate-100 border border-slate-200 text-slate-800 text-[10px] font-mono px-2 py-0.5 rounded font-bold uppercase">{item.codigo}</span>
                                  </div>
                                  <div className="bg-slate-50 p-3 rounded-2xl space-y-1.5 text-xs">
                                    <div className="flex justify-between">
                                      <span className="text-slate-400">Quantidade:</span>
                                      <span className={`font-bold ${isLow ? 'text-rose-600 animate-pulse' : 'text-slate-800'}`}>
                                        {item.quantidade} unidades {isLow && '(Estoque Baixo!)'}
                                      </span>
                                    </div>
                                    {item.fornecedor && (
                                      <div className="flex justify-between">
                                        <span className="text-slate-400">Fornecedor:</span> 
                                        <span className="font-semibold text-slate-800">{item.fornecedor}</span>
                                      </div>
                                    )}
                                    <div className="flex justify-between">
                                      <span className="text-slate-400">Seção:</span> 
                                      <span className="font-semibold text-indigo-600">{item.categoria}</span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            );
                          }
                          return null;
                        })}
                      </div>
                    )}
                  </div>
                </motion.div>
              )}

              {/* TAB 4.2: NOTIFICAÇÕES PUSH & DISPOSITIVOS REGISTRADOS */}
              {activeTab === 'notificacoes' && (
                <motion.div
                  key="tab_notificacoes"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.15 }}
                  className="space-y-6 animate-fade-in text-slate-800"
                >
                  <div className="bg-white rounded-3.5xl p-6 border border-slate-200/80 shadow-sm space-y-6">
                    <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
                      <div>
                        <h3 className="text-lg font-bold tracking-tight text-slate-900 flex items-center gap-2">
                          <BellRing className="w-5 h-5 text-indigo-600" />
                          Central de Notificações Push
                        </h3>
                        <p className="text-sm text-slate-550 mt-0.5">Gerencie os dispositivos registrados neste browser/Supabase e receba alertas imediatos de eventos importantes.</p>
                      </div>
                      
                      <div className="flex items-center gap-2">
                        <button
                          onClick={async () => {
                            await markNotificacoesLidas(currentUser?.id || 'todos');
                            triggerToast('Notificações marcadas como lidas.');
                            loadData();
                          }}
                          className="bg-indigo-50 hover:bg-indigo-100 text-indigo-700 font-semibold text-xs px-3.5 py-2.2 rounded-xl flex items-center gap-1.5 transition"
                          disabled={notificacoesPush.length === 0}
                        >
                          <CheckCheck className="w-4 h-4" />
                          <span>Marcar Lidas</span>
                        </button>
                        <button
                          onClick={async () => {
                            await clearNotificacoesPush(currentUser?.id || 'todos');
                            triggerToast('Histórico de notificações limpo!');
                            loadData();
                          }}
                          className="bg-rose-50 hover:bg-rose-100 text-rose-700 font-semibold text-xs px-3.5 py-2.2 rounded-xl flex items-center gap-1.5 transition"
                          disabled={notificacoesPush.length === 0}
                        >
                          <Trash className="w-4 h-4" />
                          <span>Limpar Histórico</span>
                        </button>
                      </div>
                    </div>

                    <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                      
                      {/* Left Block: Registered devices list */}
                      <div className="lg:col-span-1 bg-slate-50 border border-slate-200/50 p-5 rounded-2.5xl space-y-4">
                        <div className="flex justify-between items-center">
                          <h4 className="font-bold text-slate-800 text-xs uppercase font-mono tracking-wider">Dispositivos Ativos ({dispositivos.length})</h4>
                          <button
                            onClick={() => setShowDeviceRegister(!showDeviceRegister)}
                            className="text-indigo-600 hover:text-indigo-800 font-bold text-xs"
                          >
                            {showDeviceRegister ? 'Cancelar' : '+ Adicionar'}
                          </button>
                        </div>

                        {showDeviceRegister && (
                          <div className="bg-white border border-slate-200/80 p-4 rounded-xl space-y-3 shadow-xs">
                            <div className="space-y-1">
                              <label className="text-[10px] font-bold text-slate-500 uppercase">Apelido do Dispositivo</label>
                              <input
                                type="text"
                                value={tempDeviceName}
                                onChange={(e) => setTempDeviceName(e.target.value)}
                                className="w-full text-xs bg-slate-50 border border-slate-200 rounded-lg px-2.5 py-1.8 outline-none focus:border-indigo-500 focus:bg-white"
                                placeholder="Ex: iPad Oficina de rivanildo"
                              />
                            </div>
                            <div className="space-y-1">
                              <label className="text-[10px] font-bold text-slate-500 uppercase">Plataforma</label>
                              <select
                                value={tempDevicePlatform}
                                onChange={(e) => setTempDevicePlatform(e.target.value as any)}
                                className="w-full text-xs bg-slate-50 border border-slate-205 rounded-lg px-2.2 py-1.8 outline-none font-medium text-slate-700"
                              >
                                <option value="desktop">Computador (Navegador Workspace)</option>
                                <option value="android">Dispositivo Android (Push SDK)</option>
                                <option value="ios">Dispositivo Apple iOS (Push APNS)</option>
                              </select>
                            </div>
                            <button
                              onClick={async () => {
                                if (!tempDeviceName.trim()) return;
                                try {
                                  await registerDispositivo({
                                    usuario_id: currentUser?.id || 'todos',
                                    nome_dispositivo: tempDeviceName,
                                    token_push: 'tok-' + Math.random().toString(36).substring(2, 12),
                                    plataforma: tempDevicePlatform,
                                    ativo: true
                                  });
                                  triggerToast('Dispositivo registrado com sucesso!');
                                  setTempDeviceName('Meu Dispositivo Office');
                                  setShowDeviceRegister(false);
                                  loadData();
                                } catch (_) {
                                  alert('Erro ao cadastrar dispositivo.');
                                }
                              }}
                              className="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold text-xs py-2 rounded-lg text-center shadow-xs transition"
                            >
                              Confirmar Registro
                            </button>
                          </div>
                        )}

                        <div className="space-y-2 max-h-72 overflow-y-auto">
                          {dispositivos.length === 0 ? (
                            <div className="text-center bg-white border border-dashed border-slate-200 p-6 rounded-xl">
                              <Smartphone className="w-6 h-6 text-slate-300 mx-auto mb-1.5" />
                              <p className="text-[10px] text-slate-400">Nenhum dispositivo registrado. Registre para habilitar push.</p>
                            </div>
                          ) : (
                            dispositivos.map(d => (
                              <div key={d.id} className="bg-white border border-slate-200/60 p-3 rounded-xl flex items-center justify-between text-xs gap-3">
                                <div>
                                  <p className="font-bold text-slate-800">{d.nome_dispositivo}</p>
                                  <div className="flex items-center gap-1.5 mt-1 text-[10px] text-slate-400 font-medium">
                                    <span className="uppercase text-indigo-600 bg-indigo-50 px-1 py-0.2 rounded font-bold font-mono tracking-wider">{d.plataforma}</span>
                                    <span>• {new Date(d.criado_em).toLocaleDateString('pt-BR')}</span>
                                  </div>
                                </div>
                                <button
                                  onClick={async () => {
                                    await deleteDispositivo(d.id);
                                    triggerToast('Registro de dispositivo removido!');
                                    loadData();
                                  }}
                                  className="p-1 hover:bg-rose-50 text-slate-400 hover:text-rose-600 rounded transition"
                                  title="Remover Dispositivo"
                                >
                                  <Trash className="w-3.5 h-3.5" />
                                </button>
                              </div>
                            ))
                          )}
                        </div>

                        {/* Interactive testing simulator */}
                        <div className="bg-slate-900 border border-slate-800 rounded-2xl p-4 text-white !mt-6 space-y-3 shadow-md">
                          <h5 className="text-[10px] font-bold uppercase text-indigo-400 font-mono tracking-wider flex items-center gap-1.5">
                            <Terminal className="w-3.5 h-3.5" />
                            <span>Simulador de Eventos Push</span>
                          </h5>
                          <p className="text-[11px] text-slate-350 leading-relaxed">Pressione um botão abaixo para injetar eventos imediatos que geram alertas push simulados.</p>
                          <div className="grid grid-cols-2 gap-2 text-[10px] font-semibold">
                            <button
                              onClick={async () => {
                                await dispatchAutomatedPush('Alerta de Revisão Periódica', 'O veículo Compass RIO1A23 está agendado para revisão em 5 dias.', 'status_servico');
                                triggerToast('Push simulado emitido!');
                                loadData();
                              }}
                              className="bg-slate-800 hover:bg-slate-700 text-indigo-300 py-1.8 px-2 rounded-lg border border-slate-700 transition"
                            >
                              Revisão de Carro
                            </button>
                            <button
                              onClick={async () => {
                                await dispatchAutomatedPush('Baixa em Filtro de Óleo', 'O estoque de Filtro de Óleo desceu do limite mínimo com apenas 9 restantes!', 'estoque_baixo');
                                triggerToast('Push simulado emitido!');
                                loadData();
                              }}
                              className="bg-slate-800 hover:bg-slate-700 text-indigo-300 py-1.8 px-2 rounded-lg border border-slate-700 transition"
                            >
                              Estoque Crítico
                            </button>
                          </div>
                        </div>

                      </div>

                      {/* Right Block: Live Notification Feed */}
                      <div className="lg:col-span-2 bg-white rounded-2.5xl space-y-4">
                        <span className="text-xs font-bold text-slate-400 block uppercase font-mono tracking-wider px-1">Feed de Notificações Recebidas</span>
                        <div className="space-y-2.5 max-h-[480px] overflow-y-auto pr-1">
                          {notificacoesPush.length === 0 ? (
                            <div className="text-center p-14 border border-dashed border-slate-200 rounded-2xl bg-slate-50/40">
                              <Bell className="w-8 h-8 text-slate-300 mx-auto mb-2" />
                              <h5 className="font-bold text-slate-600 text-xs">Aguardando notificações de eventos</h5>
                              <p className="text-slate-400 text-[10px] mt-1 pr-6 pl-6">Todas as baixas de estoque, novos orçamentos, veículos registrados e alertas de status de O.S. serão agrupados e exibidos aqui instantaneamente.</p>
                            </div>
                          ) : (
                            notificacoesPush.map(n => {
                              const badgeStyle = n.tipo === 'estoque_baixo'
                                ? 'bg-amber-50 text-amber-700 border-amber-100'
                                : n.tipo === 'orcamento'
                                ? 'bg-indigo-50 text-indigo-700 border-indigo-100'
                                : n.tipo === 'veiculo_novo'
                                ? 'bg-emerald-50 text-emerald-700 border-emerald-100'
                                : 'bg-sky-50 text-sky-700 border-sky-100';

                              const badgeText = n.tipo === 'estoque_baixo' ? 'Estoque' : n.tipo === 'orcamento' ? 'Orçamento' : n.tipo === 'veiculo_novo' ? 'Veículo' : 'Serviço';

                              return (
                                <div key={n.id} className={`p-4 border rounded-2xl flex items-start justify-between gap-4 transition relative ${n.lida ? 'bg-slate-50/50 border-slate-100 text-slate-600' : 'bg-indigo-50/15 border-indigo-100 text-slate-900 shadow-xs'}`}>
                                  <div className="flex gap-3">
                                    <div className="mt-0.5">
                                      <span className={`text-[9px] font-bold px-2 py-0.5 rounded uppercase border tracking-wider font-mono ${badgeStyle}`}>{badgeText}</span>
                                    </div>
                                    <div className="space-y-1 bg-transparent p-0 border-0 shadow-none">
                                      <div className="flex items-center gap-2">
                                        <h5 className="font-bold text-xs">{n.titulo}</h5>
                                        {!n.lida && <span className="w-1.5 h-1.5 rounded-full bg-rose-500 animate-pulse"></span>}
                                      </div>
                                      <p className="text-xs text-slate-500 leading-relaxed pr-2">{n.mensagem}</p>
                                      <span className="text-[10px] text-slate-400 block font-mono">{new Date(n.criado_em).toLocaleDateString('pt-BR')} às {new Date(n.criado_em).toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' })}</span>
                                    </div>
                                  </div>
                                </div>
                              );
                            })
                          )}
                        </div>
                      </div>

                    </div>
                  </div>
                </motion.div>
              )}

              {/* TAB 5: BD SUPABASE INTEGRATION MIGRATIONS */}
              {activeTab === 'config' && (
                <motion.div
                  key="tab_config"
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -15 }}
                  transition={{ duration: 0.15 }}
                  className="space-y-6"
                >
                  {/* SUB SELETOR DE SEÇÕES DO PERFIL */}
                  <div className="bg-slate-50 border border-slate-200/60 p-2 rounded-2xl flex flex-wrap gap-2 items-center justify-between shadow-xs">
                    <div className="text-xs text-slate-500 font-bold uppercase tracking-wider pl-1 select-none flex items-center gap-1.5">
                      <Settings className="w-3.5 h-3.5 text-indigo-500 animate-spin-slow animate-pulse" />
                      <span>Configurações & Perfil</span>
                    </div>
                    <div className="flex flex-wrap gap-1">
                      <button
                        type="button"
                        onClick={() => setActiveProfileSection('perfil')}
                        className={`flex items-center gap-1.5 px-3 py-2 rounded-xl text-xs font-bold transition-all cursor-pointer ${
                          activeProfileSection === 'perfil'
                            ? 'bg-indigo-600 text-white shadow-md scale-102 font-extrabold'
                            : 'bg-white hover:bg-slate-100 text-slate-700 border border-slate-200/60'
                        }`}
                      >
                        <User className="w-3.5 h-3.5" />
                        <span>Meu Perfil</span>
                      </button>

                      <button
                        type="button"
                        onClick={() => setActiveProfileSection('senha')}
                        className={`flex items-center gap-1.5 px-3 py-2 rounded-xl text-xs font-bold transition-all cursor-pointer ${
                          activeProfileSection === 'senha'
                            ? 'bg-indigo-600 text-white shadow-md scale-102 font-extrabold'
                            : 'bg-white hover:bg-slate-100 text-slate-700 border border-slate-200/60'
                        }`}
                      >
                        <Lock className="w-3.5 h-3.5" />
                        <span>Segurança</span>
                      </button>

                      {currentUser?.funcao === 'Administrador' && (
                        <button
                          type="button"
                          onClick={() => setActiveProfileSection('usuarios')}
                          className={`flex items-center gap-1.5 px-3 py-2 rounded-xl text-xs font-bold transition-all cursor-pointer ${
                            activeProfileSection === 'usuarios'
                              ? 'bg-indigo-600 text-white shadow-md scale-102 font-extrabold'
                              : 'bg-white hover:bg-slate-100 text-slate-700 border border-slate-200/60'
                          }`}
                        >
                          <Users className="w-3.5 h-3.5" />
                          <span>Membros & Cargos</span>
                        </button>
                      )}

                      {currentUser?.funcao === 'Administrador' && (
                        <button
                          type="button"
                          onClick={() => setActiveProfileSection('supabase')}
                          className={`flex items-center gap-1.5 px-3 py-2 rounded-xl text-xs font-bold transition-all cursor-pointer ${
                            activeProfileSection === 'supabase'
                              ? 'bg-indigo-600 text-white shadow-md scale-102 font-extrabold'
                              : 'bg-white hover:bg-slate-100 text-slate-700 border border-slate-200/60'
                          }`}
                        >
                          <Database className="w-3.5 h-3.5" />
                          <span>Banco Nuvem</span>
                        </button>
                      )}

                      {currentUser?.funcao === 'Administrador' && (
                        <button
                          type="button"
                          onClick={() => setActiveProfileSection('oficina')}
                          className={`flex items-center gap-1.5 px-3 py-2 rounded-xl text-xs font-bold transition-all cursor-pointer ${
                            activeProfileSection === 'oficina'
                              ? 'bg-indigo-600 text-white shadow-md scale-102 font-extrabold'
                              : 'bg-white hover:bg-slate-100 text-slate-700 border border-slate-200/60'
                          }`}
                        >
                          <Wrench className="w-3.5 h-3.5" />
                          <span>Minha Oficina</span>
                        </button>
                      )}
                    </div>
                  </div>

                  <AnimatePresence mode="wait">
                    {activeProfileSection === 'perfil' && (
                      <motion.div
                        key="profile_perfil"
                        initial={{ opacity: 0, y: 10 }}
                        animate={{ opacity: 1, y: 0 }}
                        exit={{ opacity: 0, y: -10 }}
                        transition={{ duration: 0.15 }}
                        className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm space-y-6 w-full"
                      >
                    <div>
                      <h3 className="text-lg font-bold tracking-tight text-slate-900 flex items-center gap-2">
                        <Settings className="w-4.5 h-4.5 text-indigo-600" />
                        Meu Perfil de Usuário
                      </h3>
                      <p className="text-sm text-slate-500">Mantenha seu nome de exibição e imagem de avatar sincronizados na nuvem Supabase ou no banco local.</p>
                    </div>

                    <form onSubmit={handleSaveProfile} className="bg-slate-50 rounded-2xl p-5 border border-slate-200/60 shadow-sm space-y-5">
                      <div className="flex flex-col md:flex-row items-center gap-6">
                        {/* Avatar Image Selection & Preview */}
                        <div className="flex flex-col items-center gap-3 shrink-0">
                          <span className="text-xs font-semibold text-slate-600 self-start md:self-center">Sua Foto de Perfil</span>
                          <div className="relative group w-24 h-24 rounded-full border-4 border-white shadow-md bg-slate-200 overflow-hidden flex items-center justify-center transition hover:shadow-lg">
                            {profileAvatarPreview ? (
                              // eslint-disable-next-line @next/next/no-img-element
                              <img
                                src={profileAvatarPreview}
                                alt="Previa do Perfil"
                                className="w-full h-full object-cover"
                              />
                            ) : (
                              <div className="w-full h-full bg-gradient-to-tr from-indigo-500 to-violet-600 text-white font-bold flex items-center justify-center text-3xl">
                                {profileName ? profileName.split(' ')[0][0].toUpperCase() : (currentUser?.email ? currentUser.email[0].toUpperCase() : '?')}
                              </div>
                            )}

                            {/* Hover overlay */}
                            <label className="absolute inset-0 bg-black/50 opacity-0 group-hover:opacity-100 transition duration-200 flex flex-col items-center justify-center text-white cursor-pointer select-none">
                              <Camera className="w-6 h-6 text-slate-200 mb-0.5" />
                              <span className="text-[10px] font-bold tracking-wide">ALTERAR</span>
                              <input
                                type="file"
                                accept="image/*"
                                className="hidden"
                                onChange={(e) => {
                                  if (e.target.files && e.target.files[0]) {
                                    const file = e.target.files[0];
                                    setProfileAvatarFile(file);
                                    setProfileAvatarPreview(URL.createObjectURL(file));
                                  }
                                }}
                              />
                            </label>
                          </div>
                          
                          {/* File status indicator of newly selected file */}
                          {profileAvatarFile && (
                            <span className="text-[10px] text-emerald-600 font-bold bg-emerald-50 px-2 py-0.5 rounded-full border border-emerald-100 flex items-center gap-1">
                              <Check className="w-3 h-3" /> Foto Selecionada
                            </span>
                          )}
                        </div>

                        {/* Name and Meta details */}
                        <div className="flex-1 w-full space-y-4">
                          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div className="space-y-1">
                              <label className="text-xs font-semibold text-slate-600 block">Nome Completo:</label>
                              <input 
                                type="text" 
                                placeholder="Seu nome completo"
                                value={profileName}
                                onChange={(e) => setProfileName(e.target.value)}
                                className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2 text-xs outline-none transition"
                                required
                              />
                            </div>
                            <div className="space-y-1">
                              <label className="text-xs font-semibold text-slate-400 block">E-mail Corporativo (Não editável):</label>
                              <input 
                                type="text" 
                                value={currentUser?.email || ''} 
                                disabled
                                className="w-full bg-slate-100 border border-slate-200 text-slate-400 rounded-xl px-3 py-2 text-xs cursor-not-allowed outline-none"
                              />
                            </div>
                          </div>

                          <div className="flex flex-wrap items-center gap-3">
                            <div className="bg-indigo-50/60 border border-indigo-150/20 px-3 py-2 rounded-xl text-indigo-900 text-xs flex-1 min-w-[140px]">
                              <span className="font-semibold block text-indigo-950 text-[10.5px]">Função / Permissões</span>
                              <span className="text-[11px] text-indigo-750 font-bold">{currentUser?.funcao || 'Mecânico'}</span>
                            </div>
                            <div className="bg-slate-100 border border-slate-150 px-3 py-2 rounded-xl text-slate-700 text-xs flex-1 min-w-[140px]">
                              <span className="font-semibold block text-slate-800 text-[10.5px]">Servidor de Dados Ativo</span>
                              <span className="text-[11px] font-mono text-slate-600 font-bold">
                                {dbMode === 'supabase' ? 'Nuvem Supabase' : 'Banco Local Off-line'}
                              </span>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div className="flex justify-end pt-3 border-t border-slate-200/60">
                        <button 
                          type="submit"
                          disabled={profileSubmitting}
                          className="w-full sm:w-auto bg-indigo-600 hover:bg-indigo-700 disabled:bg-indigo-300 text-white font-bold text-xs px-5 py-2.5 rounded-xl shadow-md flex items-center justify-center gap-2 transition"
                        >
                          {profileSubmitting ? (
                            <>
                              <RefreshCw className="w-3.5 h-3.5 animate-spin" />
                              <span>Salvando dados...</span>
                            </>
                          ) : (
                            <>
                              <Check className="w-3.5 h-3.5" />
                              <span>Atualizar Perfil</span>
                            </>
                          )}
                        </button>
                      </div>
                    </form>
                  </motion.div>
                )}

                {activeProfileSection === 'senha' && (
                  <motion.div
                    key="profile_senha"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    transition={{ duration: 0.15 }}
                    className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm space-y-6 w-full"
                  >
                    <div>
                      <h3 className="text-lg font-bold tracking-tight text-slate-900 flex items-center gap-2">
                        <Lock className="w-4.5 h-4.5 text-indigo-600" />
                        Alterar Minha Senha
                      </h3>
                      <p className="text-sm text-slate-500">
                        Cada usuário pode atualizar suas credenciais de acesso diretamente. A nova senha será sincronizada instantaneamente.
                      </p>
                    </div>

                    <form onSubmit={handleChangeMyPassword} className="bg-slate-50 rounded-2xl p-5 border border-slate-200/60 shadow-sm space-y-4">
                      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div className="space-y-1">
                          <label className="text-xs font-semibold text-slate-600 block">Nova Senha:</label>
                          <input 
                            type="password" 
                            placeholder="Mínimo 6 caracteres"
                            value={newPassword}
                            onChange={(e) => setNewPassword(e.target.value)}
                            className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2 text-xs outline-none transition font-mono"
                            required
                          />
                        </div>
                        <div className="space-y-1">
                          <label className="text-xs font-semibold text-slate-600 block">Confirmar Nova Senha:</label>
                          <input 
                            type="password" 
                            placeholder="Repita a nova senha"
                            value={confirmNewPassword}
                            onChange={(e) => setConfirmNewPassword(e.target.value)}
                            className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2 text-xs outline-none transition font-mono"
                            required
                          />
                        </div>
                      </div>

                      <div className="flex justify-end pt-3 border-t border-slate-200/60">
                        <button 
                          type="submit"
                          disabled={passwordSubmitting}
                          className="w-full sm:w-auto bg-slate-800 hover:bg-slate-950 disabled:bg-slate-400 text-white font-bold text-xs px-5 py-2.5 rounded-xl shadow-md flex items-center justify-center gap-2 transition cursor-pointer"
                        >
                          {passwordSubmitting ? (
                            <>
                              <RefreshCw className="w-3.5 h-3.5 animate-spin" />
                              <span>Salvando nova senha...</span>
                            </>
                          ) : (
                            <>
                              <Check className="w-3.5 h-3.5" />
                              <span>Gravar Nova Senha</span>
                            </>
                          )}
                        </button>
                      </div>
                    </form>
                  </motion.div>
                )}

                {activeProfileSection === 'usuarios' && currentUser?.funcao === 'Administrador' && (
                  <motion.div
                    key="profile_usuarios"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    transition={{ duration: 0.15 }}
                    className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm space-y-6 w-full"
                    id="card_user_management"
                  >
                    <div>
                      <h3 className="text-lg font-bold tracking-tight text-slate-900 flex items-center gap-2">
                        <Users className="w-4.5 h-4.5 text-indigo-600" />
                        Gerenciamento de Usuários e Controle de Cargos
                      </h3>
                      <p className="text-sm text-slate-500">
                        Visualize todos os colaboradores registrados no sistema, altere suas permissões/cargos ou mude seu próprio perfil para Administrador.
                      </p>
                    </div>

                    {/* Banner de Status + Botão de Autopromoção Rápida */}
                    <div className={`p-4 rounded-2xl border flex flex-col sm:flex-row sm:items-center justify-between gap-4 transition duration-200 ${
                      currentUser?.funcao === 'Administrador' 
                        ? 'bg-emerald-50/60 border-emerald-150/40 text-emerald-900' 
                        : 'bg-amber-50/70 border-amber-150/40 text-amber-900'
                    }`}>
                      <div className="space-y-1">
                        <div className="flex items-center gap-1.5 font-bold text-xs uppercase tracking-wider">
                          {currentUser?.funcao === 'Administrador' ? (
                            <>
                              <Crown className="w-4 h-4 text-emerald-600 animate-pulse" />
                              <span>Controle Total Ativado (Administrador)</span>
                            </>
                          ) : (
                            <>
                              <Shield className="w-4 h-4 text-amber-600" />
                              <span>Permissões de {currentUser?.funcao || 'Mecânico'}</span>
                            </>
                          )}
                        </div>
                        <p className="text-xs opacity-90 max-w-2xl leading-relaxed">
                          {currentUser?.funcao === 'Administrador' 
                            ? 'Você tem acesso de administrador total. Você pode alterar os cargos e permissões de qualquer usuário registrado na listagem abaixo.' 
                            : 'Como mecânico/supervisor, você não possui privilégios de Administrador. Use o botão de autopromoção ao lado para se tornar um Administrador e obter controle total instantaneamente.'}
                        </p>
                      </div>

                      {currentUser?.funcao !== 'Administrador' && (
                        <button
                          onClick={handlePromoteSelf}
                          className="text-xs font-bold px-4 py-2.5 rounded-xl shadow-md flex items-center justify-center gap-2 shrink-0 transition bg-indigo-600 hover:bg-indigo-700 text-white"
                        >
                          <Crown className="w-4 h-4 text-amber-300 animate-bounce" />
                          <span>Promover-me a Administrador 🎉</span>
                        </button>
                      )}
                    </div>

                    {/* Tabela de Usuários */}
                    <div className="border border-slate-200 rounded-2xl overflow-hidden bg-slate-50/50">
                      <div className="overflow-x-auto">
                        <table className="w-full text-left border-collapse">
                          <thead>
                            <tr className="bg-slate-100 border-b border-slate-200 text-slate-700 text-[11px] font-bold uppercase tracking-wider">
                              <th className="px-4 py-3">Colaborador</th>
                              <th className="px-4 py-3">E-mail</th>
                              <th className="px-4 py-3 text-center">Nível / Cargo</th>
                              <th className="px-4 py-3 text-right">Alterar Cargo</th>
                            </tr>
                          </thead>
                          <tbody className="divide-y divide-slate-150">
                            {usersList.length === 0 ? (
                              <tr>
                                <td colSpan={4} className="px-4 py-8 text-center text-xs text-slate-500 font-semibold bg-white">
                                  Nenhum usuário cadastrado ou buscando dados...
                                </td>
                              </tr>
                            ) : (
                              usersList.map((user) => {
                                const isSelf = user.id === currentUser?.id;
                                return (
                                  <tr key={user.id} className="hover:bg-white transition text-xs text-slate-800 bg-white/70">
                                    <td className="px-4 py-3.5 flex items-center gap-3">
                                      {/* Mini Avatar */}
                                      <div className="w-8 h-8 rounded-full border border-slate-200 overflow-hidden shrink-0 shadow-sm bg-slate-100 flex items-center justify-center font-bold">
                                        {user.avatar_url ? (
                                          // eslint-disable-next-line @next/next/no-img-element
                                          <img src={user.avatar_url} alt={user.nome} className="w-full h-full object-cover" />
                                        ) : (
                                          <div className="w-full h-full bg-gradient-to-tr from-indigo-500 to-violet-600 text-white flex items-center justify-center text-[11px]">
                                            {user.nome ? user.nome[0].toUpperCase() : '?'}
                                          </div>
                                        )}
                                      </div>
                                      <div>
                                        <div className="font-bold text-slate-900 flex items-center gap-1.5">
                                          {user.nome}
                                          {isSelf && (
                                            <span className="text-[9px] bg-indigo-50 text-indigo-700 px-1.5 py-0.2 rounded-full border border-indigo-150 font-extrabold uppercase">
                                              Você
                                            </span>
                                          )}
                                        </div>
                                        <span className="text-[10px] text-slate-400 font-mono">ID: {user.id.substring(0, 8)}...</span>
                                      </div>
                                    </td>
                                    <td className="px-4 py-3.5 font-mono text-slate-600 break-all">{user.email}</td>
                                    <td className="px-4 py-3.5 text-center">
                                      {user.funcao === 'Administrador' ? (
                                        <span className="inline-flex items-center gap-1 bg-red-50 text-red-700 px-2.5 py-1 rounded-full border border-red-100 font-bold text-[10.5px]">
                                          <Crown className="w-3 h-3 text-red-500" /> Administrador
                                        </span>
                                      ) : user.funcao === 'Supervisor' ? (
                                        <span className="inline-flex items-center gap-1 bg-violet-50 text-violet-700 px-2.5 py-1 rounded-full border border-violet-100 font-bold text-[10.5px]">
                                          <Shield className="w-3 h-3 text-violet-500" /> Supervisor
                                        </span>
                                      ) : (
                                        <span className="inline-flex items-center gap-1 bg-slate-50 text-slate-700 px-2.5 py-1 rounded-full border border-slate-150 font-bold text-[10.5px]">
                                          <Wrench className="w-3 h-3 text-slate-400" /> Mecânico
                                        </span>
                                      )}
                                    </td>
                                    <td className="px-4 py-3.5 text-right">
                                      <div className="flex justify-end items-center gap-2">
                                        {currentUser?.funcao !== 'Administrador' && !isSelf ? (
                                          <span className="text-[10px] text-slate-400 font-semibold italic flex items-center gap-1">
                                            <Lock className="w-3 h-3" /> Bloqueado
                                          </span>
                                        ) : (
                                          <select
                                            value={user.funcao || 'Mecânico'}
                                            onChange={(e) => handleUpdateUserRole(user.id, e.target.value)}
                                            className="bg-white border border-slate-200 rounded-xl px-2 py-1 text-[11px] font-semibold outline-none focus:border-indigo-500 transition cursor-pointer"
                                            disabled={loadingUsers}
                                          >
                                            <option value="Mecânico">Mecânico</option>
                                            <option value="Supervisor">Supervisor</option>
                                            <option value="Administrador">Administrador</option>
                                          </select>
                                        )}
                                      </div>
                                    </td>
                                  </tr>
                                );
                              })
                            )}
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </motion.div>
                )}

                {activeProfileSection === 'supabase' && currentUser?.funcao === 'Administrador' && (
                  <motion.div
                    key="profile_supabase"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    transition={{ duration: 0.15 }}
                    className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm space-y-6 w-full"
                  >
                    <div>
                      <h3 className="text-lg font-bold tracking-tight text-slate-900">Integração com Banco de Dados Supabase (PostgreSQL)</h3>
                      <p className="text-sm text-slate-500">Conecte sua aplicação a um banco de dados Supabase na nuvem para persistência permanente e compartilhada em tempo real.</p>
                    </div>

                    {/* Database Mode Switcher inside Dashboard Config Tab */}
                    <div className="bg-slate-50 border border-slate-200 rounded-2xl p-4 space-y-3.5 shadow-xs">
                      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 border-b border-slate-200 pb-2.5">
                        <div>
                          <h4 className="font-extrabold text-slate-800 text-xs uppercase tracking-wider flex items-center gap-1.5">
                            <SlidersHorizontal className="w-4 h-4 text-indigo-500" />
                            Modo Operacional do Banco de Dados
                          </h4>
                          <p className="text-[11px] text-slate-500">Selecione onde os dados do sistema serão armazenados e sincronizados.</p>
                        </div>
                        <span className={`text-[10px] font-extrabold px-2.5 py-1 rounded-full border tracking-wide select-none ${
                          dbMode === 'supabase' 
                            ? 'bg-indigo-50 text-indigo-700 border-indigo-200' 
                            : 'bg-emerald-50 text-emerald-700 border-emerald-250 animate-pulse'
                        }`}>
                          {dbMode === 'supabase' ? 'MODO NUVEM ATIVO' : 'MODO LOCAL ATIVO'}
                        </span>
                      </div>

                      <div className="flex bg-slate-100 p-1 rounded-xl max-w-md">
                        <button
                          type="button"
                          onClick={() => {
                            setDbMode('supabase');
                            if (typeof window !== 'undefined') {
                              window.localStorage.setItem('destakcar_db_mode', 'supabase');
                              triggerToast("Modo Banco em Nuvem (Supabase) ativado!");
                            }
                          }}
                          className={`flex-1 py-1.5 text-[11px] font-bold rounded-lg transition-all cursor-pointer ${
                            dbMode === 'supabase' 
                              ? 'bg-white text-indigo-700 shadow-sm' 
                              : 'text-slate-500 hover:text-slate-800'
                          }`}
                        >
                          Nuvem (Supabase)
                        </button>
                        <button
                          type="button"
                          onClick={() => {
                            setDbMode('local');
                            if (typeof window !== 'undefined') {
                              window.localStorage.setItem('destakcar_db_mode', 'local');
                              triggerToast("Modo Banco Local (Off-line) ativado!");
                            }
                          }}
                          className={`flex-1 py-1.5 text-[11px] font-bold rounded-lg transition-all cursor-pointer ${
                            dbMode === 'local' 
                              ? 'bg-white text-indigo-700 shadow-sm' 
                              : 'text-slate-500 hover:text-slate-850'
                          }`}
                        >
                          Local (Off-line)
                        </button>
                      </div>

                      {/* Diagnóstico de Latência do Banco */}
                      <div className="border-t border-slate-200/80 pt-3.5 mt-3.5 space-y-2">
                        <div className="flex items-center justify-between gap-2">
                          <div className="space-y-0.5">
                            <h5 className="text-[11px] font-extrabold text-slate-700 uppercase tracking-wider flex items-center gap-1">
                              <Terminal className="w-3.5 h-3.5 text-indigo-500" />
                              Diagnóstico de Latência
                            </h5>
                            <p className="text-[10px] text-slate-500">Verifique a velocidade de resposta do banco de dados ativo.</p>
                          </div>
                          
                          <button
                            type="button"
                            onClick={handleTestLatency}
                            disabled={latencyTesting}
                            className="bg-indigo-50 hover:bg-indigo-100 text-indigo-700 disabled:opacity-50 border border-indigo-200 font-extrabold text-[10px] px-3 py-1.5 rounded-xl flex items-center gap-1 transition shadow-xs cursor-pointer"
                          >
                            {latencyTesting ? (
                              <>
                                <RefreshCw className="w-3 h-3 animate-spin" />
                                <span>Testando...</span>
                              </>
                            ) : (
                              <>
                                <RefreshCw className="w-3 h-3" />
                                <span>Testar Conexão</span>
                              </>
                            )}
                          </button>
                        </div>

                        {latencyResult && (
                          <div className={`p-2.5 rounded-xl border text-[11px] transition-all duration-300 ${
                            latencyResult.success
                              ? 'bg-emerald-50/70 border-emerald-200 text-emerald-800 dark:bg-emerald-950/20 dark:border-emerald-800 dark:text-emerald-300'
                              : 'bg-rose-50/70 border-rose-200 text-rose-800 dark:bg-rose-950/20 dark:border-rose-800 dark:text-rose-300'
                          }`}>
                            <div className="flex items-center justify-between">
                              <span className="font-bold flex items-center gap-1">
                                {latencyResult.success ? (
                                  <>
                                    <Check className="w-3.5 h-3.5 text-emerald-600 dark:text-emerald-400" />
                                    <span>Conectado</span>
                                  </>
                                ) : (
                                  <>
                                    <AlertTriangle className="w-3.5 h-3.5 text-rose-600 dark:text-rose-400" />
                                    <span>Erro de Conexão</span>
                                  </>
                                )}
                              </span>
                              {latencyResult.success && (
                                <span className={`font-extrabold px-2 py-0.5 rounded-full text-[10px] border ${
                                  latencyResult.latencyMs! < 150
                                    ? 'bg-emerald-100 border-emerald-300 text-emerald-800 dark:bg-emerald-900/50 dark:border-emerald-700 dark:text-emerald-200'
                                    : latencyResult.latencyMs! < 500
                                    ? 'bg-amber-100 border-amber-305 text-amber-800 dark:bg-amber-900/50 dark:border-amber-700 dark:text-amber-200'
                                    : 'bg-rose-100 border-rose-300 text-rose-800 animate-pulse dark:bg-rose-900/50 dark:border-rose-700 dark:text-rose-200'
                                }`}>
                                  {latencyResult.latencyMs} ms ({latencyResult.latencyMs! < 150 ? 'Excelente' : latencyResult.latencyMs! < 500 ? 'Razoável' : 'Lento'})
                                </span>
                              )}
                            </div>
                            {latencyResult.error && (
                              <p className="mt-1 text-[10px] opacity-90 break-words font-mono bg-white/60 dark:bg-slate-900/40 p-1.5 rounded-lg border border-slate-200 dark:border-slate-800">{latencyResult.error}</p>
                            )}
                          </div>
                        )}
                      </div>
                    </div>

                    {/* Guia de Conexão: Como conectar ao Banco de Dados? */}
                    <div className="bg-slate-50 border border-slate-200 p-5 rounded-2xl space-y-3">
                      <div className="flex items-center gap-2 text-xs font-extrabold text-slate-700 uppercase tracking-widest border-b border-slate-200 pb-2">
                        <Info className="w-4 h-4 text-indigo-600 shrink-0" />
                        <span>Central de Guia de Conexão (Acesso Administrador)</span>
                      </div>
                      <p className="text-xs text-slate-600 leading-relaxed text-justify">
                        Siga o passo a passo simplificado para conectar e sincronizar seu próprio banco de dados Supabase na nuvem:
                      </p>
                      <div className="grid grid-cols-1 md:grid-cols-3 gap-3 pt-1">
                        <div className="p-3.5 bg-white border border-slate-150 rounded-xl space-y-1 shadow-xs">
                          <span className="text-[10px] uppercase tracking-wider font-extrabold text-indigo-600 font-mono">Passo 1</span>
                          <h5 className="font-bold text-slate-850 text-xs">Criar Projeto</h5>
                          <p className="text-[10.5px] text-slate-500 leading-normal">Crie uma conta gratuita em <a href="https://supabase.com" target="_blank" rel="noopener noreferrer" className="text-indigo-650 hover:underline font-semibold inline-flex items-center gap-0.5">supabase.com</a> e monte um novo projeto PostgreSQL.</p>
                        </div>
                        <div className="p-3.5 bg-white border border-slate-150 rounded-xl space-y-1 shadow-xs">
                          <span className="text-[10px] uppercase tracking-wider font-extrabold text-indigo-600 font-mono">Passo 2</span>
                          <h5 className="font-bold text-slate-850 text-xs">Rodar Script SQL</h5>
                          <p className="text-[10.5px] text-slate-500 leading-normal">Abra o <strong>SQL Editor</strong> no Supabase, copie o script completo no bloco abaixo e clique em <strong>Run</strong> para gerar as tabelas do sistema.</p>
                        </div>
                        <div className="p-3.5 bg-white border border-slate-150 rounded-xl space-y-1 shadow-xs">
                          <span className="text-[10px] uppercase tracking-wider font-extrabold text-indigo-600 font-mono">Passo 3</span>
                          <h5 className="font-bold text-slate-850 text-xs">Vincular Chaves</h5>
                          <p className="text-[10.5px] text-slate-500 leading-normal">Copie a <strong>Project URL</strong> e a <strong>Anon Key</strong> da aba API do painel Supabase e preencha no formulário abaixo.</p>
                        </div>
                      </div>
                    </div>

                    {/* Form integration settings */}
                    <form onSubmit={handleSaveDBConfig} className="bg-slate-50 rounded-2xl p-5 border border-slate-200/60 shadow-sm space-y-4">
                      <h4 className="font-bold text-slate-800 text-xs uppercase tracking-wider flex items-center gap-1.5">
                        <Database className="w-4 h-4 text-indigo-600" />
                        Acesso à API Supabase
                      </h4>
                      
                      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div className="space-y-1">
                          <label className="text-xs font-semibold text-slate-600 block">Supabase Project URL (Endpoint Web):</label>
                          <input 
                            type="url" 
                            placeholder="https://suas-credenciais.supabase.co"
                            value={supabaseUrl}
                            onChange={(e) => setSupabaseUrl(e.target.value)}
                            className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2 text-xs outline-none transition"
                            required
                          />
                        </div>
                        <div className="space-y-1">
                          <label className="text-xs font-semibold text-slate-600 block">Supabase Anon Key (Chave Pública):</label>
                          <input 
                            type="password" 
                            placeholder="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3N..."
                            value={supabaseKey}
                            onChange={(e) => setSupabaseKey(e.target.value)}
                            className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2 text-xs outline-none transition"
                            required
                          />
                        </div>
                      </div>

                      <div className="flex flex-wrap items-center justify-between gap-3 pt-3 border-t border-slate-200/60">
                        <span className="text-[10.5px] text-slate-400 font-medium">As chaves são salvas localmente no armazenamento do seu navegador para sua segurança.</span>
                        <div className="flex items-center gap-2">
                          {supabaseUrl && (
                            <button 
                              type="button"
                              onClick={handleClearDBConfig}
                              className="bg-slate-200 hover:bg-slate-300 text-slate-700 font-bold text-xs px-4 py-2 rounded-xl"
                            >
                              Carregar Local (Limpar)
                            </button>
                          )}
                          <button 
                            type="submit"
                            className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold text-xs px-5 py-2 rounded-xl shadow-md"
                          >
                            Conectar & Recarregar
                          </button>
                        </div>
                      </div>
                    </form>

                    {/* MIGRATION SQL BLOCK FOR THE CLIENT */}
                    <div className="space-y-3 col-span-1 lg:col-span-2 border-t border-slate-200/80 pt-6 mt-4">
                      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 bg-indigo-50/40 p-4 rounded-2xl border border-indigo-100/50">
                        <div>
                          <h4 className="font-bold text-slate-800 text-sm">Scripts de Migração / Tabelas no Supabase (SQL)</h4>
                          <p className="text-xs text-slate-500">Crie o banco de dados no painel Supabase rodando este código SQL de forma simples.</p>
                        </div>

                        <button 
                          onClick={() => {
                            if (typeof window !== 'undefined') {
                              navigator.clipboard.writeText(WORKSHOP_SCHEMA_SQL);
                              triggerToast('SQL Completo copiado! Cole no SQL Editor do Supabase.');
                            }
                          }}
                          className="text-[11px] font-bold text-indigo-600 bg-indigo-50 hover:bg-indigo-100 px-3.5 py-2 rounded-xl flex items-center gap-1.5 transition self-start sm:self-center shrink-0 border border-indigo-200/40 shadow-sm cursor-pointer"
                        >
                          <Copy className="w-3.5 h-3.5" />
                          <span>Copiar SQL Completo</span>
                        </button>
                      </div>

                      <div className="bg-slate-900 text-slate-100 p-4 rounded-2xl text-[10.5px] font-mono overflow-x-auto max-h-72 leading-relaxed border border-slate-800 shadow-inner">
                        <pre>{WORKSHOP_SCHEMA_SQL}</pre>
                      </div>
                    </div>
                  </motion.div>
                  )}

                  {activeProfileSection === 'oficina' && currentUser?.funcao === 'Administrador' && (
                    <motion.div
                      key="profile_oficina"
                      initial={{ opacity: 0, y: 10 }}
                      animate={{ opacity: 1, y: 0 }}
                      exit={{ opacity: 0, y: -10 }}
                      transition={{ duration: 0.15 }}
                      className="space-y-6 w-full"
                    >
                      {/* SEÇÃO PRINCIPAL 3: CABEÇALHO DA OFICINA & LOGOMARCA GERADA POR IA */}
                      <div className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm space-y-6">
                      <div>
                        <h3 className="text-lg font-bold tracking-tight text-slate-900 flex items-center gap-2">
                          <Wrench className="w-4.5 h-4.5 text-indigo-600" />
                          Cabeçalho da Oficina & Logomarca por IA
                        </h3>
                        <p className="text-sm text-slate-500">
                          Customize as credenciais de expedição do relatório da Oficina (como nome, endereço, slogan e CNPJ) e selecione ou gere o logotipo vetorial através de estilos sofisticados da nossa IA.
                        </p>
                      </div>

                      <form onSubmit={handleSaveWorkshopProfile} className="space-y-6">
                        <div className="bg-slate-50 rounded-2xl p-5 border border-slate-200/60 shadow-sm grid grid-cols-1 lg:grid-cols-2 gap-5">
                          
                          <div className="space-y-4">
                            <h4 className="font-bold text-slate-800 text-xs uppercase tracking-wider flex items-center gap-1.5 border-b border-slate-200 pb-2">
                              <span>Informações Corporativas</span>
                            </h4>

                            <div className="space-y-1">
                              <label className="text-xs font-semibold text-slate-600 block">Nome da Oficina:</label>
                              <input 
                                type="text" 
                                placeholder="ex: DestakCar Autocenter"
                                value={workshopNome}
                                onChange={(e) => setWorkshopNome(e.target.value)}
                                className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2.5 text-xs outline-none transition font-semibold"
                                required
                              />
                            </div>

                            <div className="space-y-1">
                              <label className="text-xs font-semibold text-slate-600 block">Slogan de Campanhas / Subtítulo:</label>
                              <input 
                                type="text" 
                                placeholder="ex: Sua oficina de confiança para manutenção e reparos"
                                value={workshopSlogan}
                                onChange={(e) => setWorkshopSlogan(e.target.value)}
                                className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2.5 text-xs outline-none transition"
                              />
                            </div>

                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                              <div className="space-y-1">
                                <label className="text-xs font-semibold text-slate-600 block">Telefone / WhatsApp Comercial:</label>
                                <input 
                                  type="text" 
                                  placeholder="ex: (11) 99999-9999"
                                  value={workshopTelefone}
                                  onChange={(e) => setWorkshopTelefone(e.target.value)}
                                  className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2.5 text-xs outline-none transition"
                                />
                              </div>
                              <div className="space-y-1">
                                <label className="text-xs font-semibold text-slate-600 block">CNPJ da Oficina:</label>
                                <input 
                                  type="text" 
                                  placeholder="ex: 12.345.678/0001-99"
                                  value={workshopCnpj}
                                  onChange={(e) => setWorkshopCnpj(e.target.value)}
                                  className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2.5 text-xs outline-none transition"
                                />
                              </div>
                            </div>

                            <div className="space-y-1">
                              <label className="text-xs font-semibold text-slate-600 block">Endereço Completo:</label>
                              <textarea 
                                rows={2}
                                placeholder="ex: Avenida das Nações Unidas, 1234 - São Paulo - SP"
                                value={workshopEndereco}
                                onChange={(e) => setWorkshopEndereco(e.target.value)}
                                className="w-full bg-white border border-slate-250 focus:border-indigo-500 rounded-xl px-3 py-2 text-xs outline-none transition resize-none"
                              ></textarea>
                            </div>
                          </div>

                          {/* COLUNA DIREITA: SELECIONADOR DE PRESET DE LOGOMARCA GERADO DA IA EM TEMPO REAL */}
                          <div className="space-y-4">
                            <h4 className="font-bold text-slate-800 text-xs uppercase tracking-wider flex items-center gap-1.5 border-b border-slate-200 pb-2">
                              <span>Logotipo Gerado pela IA</span>
                            </h4>

                            <p className="text-xs text-slate-500 leading-relaxed">
                              Selecione e ative um modelo de identidade visual gerada por IA. A IA do sistema criará um vetor de alta definição em tempo real na exportação do PDF.
                            </p>

                            <div className="grid grid-cols-2 gap-2">
                              {[
                                { id: 'destakcar', name: 'DestakCar S.A.', desc: 'Oficial da marca' },
                                ...(workshopLogoUrl ? [{ id: 'custom', name: 'Logo Customizado', desc: 'Item da Galeria' }] : []),
                                { id: 'modern', name: 'Modern Sleek', desc: 'Vetor esportivo' },
                                { id: 'badge', name: 'Classic Badge', desc: 'Selo corporativo' },
                                { id: 'circuit', name: 'High-Tech AI', desc: 'Elétricos & Híbridos' },
                                { id: 'speed', name: 'Speed Tuning', desc: 'Pistas de corrida' },
                                { id: 'minimal', name: 'Minimalist', desc: 'Engrenagem simples' }
                              ].map((style) => (
                                <button
                                  key={style.id}
                                  type="button"
                                  onClick={() => setWorkshopLogoStyle(style.id as any)}
                                  className={`p-2.5 rounded-xl border text-left transition duration-200 cursor-pointer ${
                                    workshopLogoStyle === style.id
                                      ? 'border-indigo-500 bg-indigo-50/50 hover:bg-indigo-50/75 text-indigo-950 font-bold'
                                      : 'border-slate-250 bg-white hover:bg-slate-50/70 text-slate-800 font-medium'
                                  }`}
                                >
                                  <span className={`text-[11px] font-bold block ${workshopLogoStyle === style.id ? 'text-indigo-700' : 'text-slate-800'}`}>{style.name}</span>
                                  <span className="text-[10px] text-slate-400 block break-words font-normal">{style.desc}</span>
                                </button>
                              ))}
                            </div>

                            {/* VEÍCULO OU LOGO PREVIEW UNIT */}
                            <div className="bg-slate-900 text-slate-100 rounded-2xl p-4 flex items-center gap-4 border border-slate-850 shadow-md">
                              {/* SVG RENDER FOR LOGO */}
                              <div className="w-14 h-14 rounded-xl shrink-0 bg-slate-800/80 border border-slate-750 flex items-center justify-center p-2 overflow-hidden">
                                {workshopLogoStyle === 'custom' && workshopLogoUrl ? (
                                  // eslint-disable-next-line @next/next/no-img-element
                                  <img src={workshopLogoUrl} alt="Logo Customizado" className="w-full h-full object-contain" />
                                ) : workshopLogoStyle === 'destakcar' ? (
                                  // eslint-disable-next-line @next/next/no-img-element
                                  <img src="/destakcar_oficial.svg" alt="DestakCar Oficial" className="w-full h-full object-contain" />
                                ) : workshopLogoStyle === 'badge' ? (
                                  <svg viewBox="0 0 100 100" className="w-full h-full fill-indigo-400">
                                    <circle cx="50" cy="50" r="45" className="fill-slate-950 stroke-indigo-500" strokeWidth="6" />
                                    <circle cx="50" cy="50" r="35" className="fill-indigo-500 stroke-white" strokeWidth="4" />
                                    <line x1="30" y1="70" x2="70" y2="30" stroke="white" strokeWidth="8" strokeLinecap="round" />
                                    <circle cx="50" cy="50" r="12" fill="white" />
                                    <circle cx="50" cy="50" r="6" fill="#6366f1" />
                                  </svg>
                                ) : workshopLogoStyle === 'circuit' ? (
                                  <svg viewBox="0 0 100 100" className="w-full h-full stroke-indigo-400 fill-none" strokeWidth="6">
                                    <polygon points="50,5 95,27.5 95,72.5 50,95 5,72.5 5,27.5" stroke="#6366f1" />
                                    <line x1="50" y1="5" x2="50" y2="95" stroke="#4f46e5" strokeWidth="3" />
                                    <line x1="5" y1="50" x2="95" y2="50" stroke="#4f46e5" strokeWidth="3" />
                                    <rect x="35" y="35" width="30" height="30" rx="5" fill="#0f172a" stroke="#f59e0b" strokeWidth="4" />
                                    <circle cx="50" cy="50" r="6" fill="#f59e0b" />
                                  </svg>
                                ) : workshopLogoStyle === 'speed' ? (
                                  <svg viewBox="0 0 100 100" className="w-full h-full fill-none">
                                    <polygon points="5,25 90,25 35,55" fill="#f43f5e" />
                                    <polygon points="15,45 100,45 45,75" fill="#4f46e5" />
                                    <polygon points="25,70 85,70 55,90" fill="#0f172a" />
                                  </svg>
                                ) : workshopLogoStyle === 'minimal' ? (
                                  <svg viewBox="0 0 100 100" className="w-full h-full stroke-slate-250 fill-none" strokeWidth="8">
                                    <circle cx="50" cy="50" r="35" stroke="#1e293b" />
                                    <line x1="50" y1="5" x2="50" y2="95" stroke="#1e293b" strokeWidth="6" />
                                    <line x1="5" y1="50" x2="95" y2="50" stroke="#1e293b" strokeWidth="6" />
                                    <circle cx="50" cy="50" r="22" fill="white" stroke="none" />
                                    <circle cx="50" cy="50" r="14" fill="#4f46e5" stroke="none" />
                                  </svg>
                                ) : (
                                  <svg viewBox="0 0 100 100" className="w-full h-full fill-indigo-500">
                                    <rect x="5" y="5" width="90" height="90" rx="10" className="fill-indigo-600" />
                                    <line x1="20" y1="30" x2="50" y2="60" stroke="white" strokeWidth="8" strokeLinecap="round" />
                                    <line x1="50" y1="60" x2="80" y2="30" stroke="white" strokeWidth="8" strokeLinecap="round" />
                                    <line x1="20" y1="50" x2="50" y2="80" stroke="white" strokeWidth="8" strokeLinecap="round" />
                                    <line x1="50" y1="80" x2="80" y2="50" stroke="white" strokeWidth="8" strokeLinecap="round" />
                                    <circle cx="50" cy="45" r="7" fill="#f59e0b" />
                                  </svg>
                                )}
                              </div>

                              <div className="flex-1 space-y-1">
                                <span className="text-[10px] uppercase font-bold tracking-widest text-indigo-400 block font-sans">Visualização da Marca</span>
                                <h4 className="font-sans font-bold text-sm text-slate-100">{workshopNome || 'Sua Oficina'}</h4>
                                <p className="text-[10.5px] italic text-slate-400 truncate max-w-[205px] leading-tight font-normal">{workshopSlogan}</p>
                              </div>
                            </div>
                          </div>

                        </div>

                        {/* DETAILED PRINT SIMULATION DECORATOR GRID */}
                        <div className="bg-slate-100/60 rounded-2xl p-4 border border-slate-200/50 space-y-3">
                          <span className="text-[10px] uppercase font-extrabold tracking-wider text-slate-500 block">Esboço em Miniatura de Expedição de PDF</span>
                          <div className="bg-white rounded-xl p-4 border border-slate-200/80 shadow-xs flex flex-col md:flex-row md:items-center justify-between gap-4 font-sans text-xs">
                            <div className="flex items-center gap-3">
                              <div className="w-10 h-10 rounded-lg bg-slate-900 border border-slate-750 flex items-center justify-center p-1 text-white shadow-xs shrink-0 font-bold overflow-hidden">
                                {workshopLogoStyle === 'custom' && workshopLogoUrl ? (
                                  // eslint-disable-next-line @next/next/no-img-element
                                  <img src={workshopLogoUrl} alt="DK" className="w-full h-full object-contain" />
                                ) : workshopLogoStyle === 'destakcar' ? (
                                  // eslint-disable-next-line @next/next/no-img-element
                                  <img src="/destakcar_oficial.svg" alt="DK" className="w-full h-full object-contain" />
                                ) : (
                                  workshopLogoStyle === 'badge' ? 'BG' : workshopLogoStyle === 'circuit' ? 'CT' : workshopLogoStyle === 'speed' ? 'SP' : workshopLogoStyle === 'minimal' ? 'MN' : 'MD'
                                )}
                              </div>
                              <div className="space-y-0.5">
                                <h5 className="font-extrabold text-slate-900 text-xs uppercase leading-tight">{workshopNome}</h5>
                                <p className="text-[10.5px] text-slate-400 italic leading-tight font-normal">{workshopSlogan}</p>
                                <p className="text-[10px] text-slate-500 font-normal">CNPJ: {workshopCnpj} | Tel: {workshopTelefone}</p>
                              </div>
                            </div>
                            <div className="bg-slate-900 text-slate-100 text-[10.5px] font-mono p-2 rounded-lg text-right shrink-0">
                              <div className="font-bold">O.S. #NÚMERO</div>
                              <div className="text-[9.5px] opacity-75 font-normal">Status: Emissão</div>
                            </div>
                          </div>
                        </div>

                        <div className="flex justify-end pt-2 border-t border-slate-100">
                          <button 
                            type="submit"
                            className="w-full sm:w-auto bg-indigo-600 hover:bg-indigo-700 text-white font-bold text-xs px-6 py-3 rounded-xl shadow-md transition flex items-center justify-center gap-2 cursor-pointer"
                          >
                            <Check className="w-4.5 h-4.5" />
                            <span>Salvar Informações da Oficina</span>
                          </button>
                        </div>
                      </form>
                    </div>

                    {/* SEÇÃO DA GALERIA DE IDENTIDADE VISUAL */}
                    <div className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm space-y-6 mt-6">
                      <div>
                        <h3 className="text-lg font-bold tracking-tight text-slate-900 flex items-center gap-2">
                          <Camera className="w-4.5 h-4.5 text-indigo-600" />
                          Galeria de Identidade Visual da Empresa
                        </h3>
                        <p className="text-sm text-slate-500">
                          Armazene e gerencie os logotipos oficiais da sua oficina nesta galeria para garantir padronização na emissão de Ordens de Serviço em PDF. Adicione novos arquivos de imagem diretamente e sem alterações.
                        </p>
                      </div>

                      {/* GRID DE LOGOS NA GALERIA */}
                      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                        
                        {/* ITEM 1: LOGO VETORIAL OFICIAL */}
                        <div className="border border-slate-200/80 bg-slate-50/50 rounded-2xl p-4 flex flex-col justify-between space-y-4 hover:shadow-xs transition">
                          <div className="space-y-3">
                            <span className="bg-blue-50 text-blue-700 font-bold text-[9px] uppercase px-2 py-0.5 rounded-full inline-block">
                              Padrão da Marca (Vetor)
                            </span>
                            <div className="w-full aspect-video bg-slate-900/90 rounded-xl flex items-center justify-center p-3 overflow-hidden border border-slate-800">
                              <img src="/destakcar_oficial.svg" alt="DestakCar S.A." className="w-full h-full object-contain" />
                            </div>
                            <div className="space-y-0.5">
                              <h4 className="font-bold text-slate-900 text-xs text-ellipsis overflow-hidden whitespace-nowrap">DestakCar S.A. Oficial</h4>
                              <p className="text-[10px] text-slate-500 leading-tight">Vetor SVG de alta definição integrado ao sistema para emissão de PDFs.</p>
                            </div>
                          </div>
                          <button
                            type="button"
                            onClick={() => {
                              setWorkshopLogoStyle('destakcar');
                              triggerToast("Definido: Vetor DestakCar S.A. Oficial configurado para a oficina.");
                            }}
                            className={`w-full py-2 rounded-xl text-[11px] font-bold transition flex items-center justify-center gap-1.5 cursor-pointer ${
                              workshopLogoStyle === 'destakcar'
                                ? 'bg-indigo-600 text-white shadow-xs'
                                : 'bg-white hover:bg-slate-50 text-slate-700 border border-slate-200'
                            }`}
                          >
                            <Check className="w-3.5 h-3.5" />
                            <span>{workshopLogoStyle === 'destakcar' ? 'Ativado na Oficina' : 'Ativar no Sistema'}</span>
                          </button>
                        </div>

                        {/* ITEM 2: APP LAUNCHER ICON */}
                        <div className="border border-slate-200/80 bg-slate-50/50 rounded-2xl p-4 flex flex-col justify-between space-y-4 hover:shadow-xs transition">
                          <div className="space-y-3">
                            <span className="bg-amber-50 text-amber-700 font-bold text-[9px] uppercase px-2 py-0.5 rounded-full inline-block">
                              Launcher / Ícone PWA
                            </span>
                            <div className="w-full aspect-video bg-slate-900/90 rounded-xl flex items-center justify-center p-3 overflow-hidden border border-slate-800">
                              <img src="/icon.svg" alt="Launcher Icon" className="w-full h-full object-contain p-2" />
                            </div>
                            <div className="space-y-0.5">
                              <h4 className="font-bold text-slate-900 text-xs text-ellipsis overflow-hidden whitespace-nowrap">Ícone Redondo do App</h4>
                              <p className="text-[10px] text-slate-500 leading-tight">Selo corporativo PWA redondo oficial da DestakCar S.A.</p>
                            </div>
                          </div>
                          <button
                            type="button"
                            onClick={() => {
                              setWorkshopLogoStyle('destakcar');
                              triggerToast("Launcher Ativo - O logotipo principal da marca já está configurado!");
                            }}
                            className="w-full py-2 rounded-xl text-[11px] font-bold bg-white hover:bg-slate-50 text-slate-700 border border-slate-200 transition flex items-center justify-center gap-1.5 cursor-pointer"
                          >
                            <Check className="w-3.5 h-3.5" />
                            <span>Ativo no Manifesto</span>
                          </button>
                        </div>

                        {/* ITEM 3: CUSTOM UPLOADED IMAGE OR PRELOAD */}
                        <div className="border border-slate-200/80 bg-slate-50/50 rounded-2xl p-4 flex flex-col justify-between space-y-4 hover:shadow-xs transition">
                          <div className="space-y-3">
                            <span className="bg-emerald-50 text-emerald-700 font-bold text-[9px] uppercase px-2 py-0.5 rounded-full inline-block">
                              Logo Original Uploadado
                            </span>
                            
                            <div className="w-full aspect-video rounded-xl flex items-center justify-center overflow-hidden border border-dashed border-slate-300 bg-white relative">
                              {workshopLogoUrl ? (
                                <div className="w-full h-full p-2 flex items-center justify-center relative group">
                                  <img src={workshopLogoUrl} alt="Logo Original" className="w-full h-full object-contain" />
                                  <button 
                                    type="button"
                                    onClick={(e) => {
                                      e.stopPropagation();
                                      setWorkshopLogoUrl(null);
                                      if (workshopLogoStyle === 'custom') {
                                        setWorkshopLogoStyle('destakcar');
                                      }
                                      triggerToast("Logotipo removido da galeria.");
                                    }}
                                    className="absolute top-1 right-1 p-1.5 rounded-lg bg-rose-600 hover:bg-rose-700 text-white transition opacity-0 group-hover:opacity-100 cursor-pointer shadow-md"
                                    title="Remover Imagem"
                                  >
                                    <Trash2 className="w-3.5 h-3.5" />
                                  </button>
                                </div>
                              ) : (
                                <div className="text-center p-3 space-y-1">
                                  <Upload className="w-5 h-5 text-slate-400 mx-auto" />
                                  <span className="text-[10px] text-slate-550 block font-semibold">Galeria Vazia</span>
                                  <span className="text-[9px] text-slate-400 block font-normal leading-tight">Faça o upload do seu arquivo original abaixo</span>
                                </div>
                              )}
                            </div>

                            <div className="space-y-0.5">
                              <h4 className="font-bold text-slate-900 text-xs text-ellipsis overflow-hidden whitespace-nowrap">Seu Logotipo Original</h4>
                              <p className="text-[10px] text-slate-500 leading-tight">Imagem direta sem transformações. Ideal para imagens JPG/PNG enviadas.</p>
                            </div>
                          </div>

                          {workshopLogoUrl ? (
                            <button
                              type="button"
                              onClick={() => {
                                setWorkshopLogoStyle('custom');
                                triggerToast("Definido: Imagem original do logotipo configurada.");
                              }}
                              className={`w-full py-2 rounded-xl text-[11px] font-bold transition flex items-center justify-center gap-1.5 cursor-pointer ${
                                workshopLogoStyle === 'custom'
                                  ? 'bg-indigo-600 text-white shadow-xs'
                                  : 'bg-white hover:bg-slate-50 text-slate-700 border border-slate-200'
                              }`}
                            >
                              <Check className="w-3.5 h-3.5" />
                              <span>{workshopLogoStyle === 'custom' ? 'Ativado na Oficina' : 'Ativar no Sistema'}</span>
                            </button>
                          ) : (
                            <label className="w-full py-2 rounded-xl text-[11px] font-bold bg-indigo-50 text-indigo-700 hover:bg-indigo-100 border border-indigo-200 transition flex items-center justify-center gap-1.5 cursor-pointer text-center">
                              <Upload className="w-3.5 h-3.5" />
                              <span>Uploade uma Imagem</span>
                              <input 
                                type="file" 
                                accept="image/*" 
                                onChange={handleWorkshopLogoUpload} 
                                className="hidden" 
                              />
                            </label>
                          )}
                        </div>
                      </div>

                      {/* AREA DROPZONE PARA UPLOAD DE NOVA IMAGEM NA GALERIA */}
                      <div 
                        onDragOver={handleDragOverLogo}
                        onDragLeave={handleDragLeaveLogo}
                        onDrop={handleDropLogo}
                        className={`border-2 border-dashed rounded-2xl p-8 text-center transition duration-250 flex flex-col items-center justify-center gap-2 cursor-pointer ${
                          isDragOverLogo 
                            ? 'border-indigo-600 bg-indigo-50/50 text-indigo-950 scale-[0.99]' 
                            : 'border-slate-250 hover:border-indigo-500 bg-slate-50/30 hover:bg-indigo-50/10 text-slate-500'
                        }`}
                      >
                        <input 
                          type="file" 
                          id="logo_gallery_input"
                          accept="image/*" 
                          onChange={handleWorkshopLogoUpload} 
                          className="hidden" 
                        />
                        <label htmlFor="logo_gallery_input" className="w-full flex flex-col items-center gap-2 cursor-pointer">
                          <div className="w-12 h-12 rounded-full bg-indigo-50 border border-indigo-100 flex items-center justify-center text-indigo-600 shadow-inner">
                            <Upload className="w-5 h-5 animate-bounce" />
                          </div>
                          <div className="space-y-1">
                            <p className="text-xs font-bold text-slate-800">Arraste seu arquivo de logo e solte para Adicionar à Galeria</p>
                            <p className="text-[10px] text-slate-400">Formatos aceitos: PNG, JPG, JPEG, SVG ou GIF de qualquer dimensão. Sem alteração na imagem original.</p>
                          </div>
                          <span className="inline-block bg-white border border-slate-200/80 px-3 py-1.5 rounded-lg text-[10px] font-bold text-slate-600 hover:bg-slate-50 hover:text-slate-800 shadow-2xs mt-1 transition">
                            Selecionar Arquivo do Computador
                          </span>
                        </label>
                      </div>
                    </div>

                    {/* Developer local data management */}
                    <div className="bg-rose-50 rounded-2xl p-4 border border-rose-100 flex items-center justify-between text-rose-900">
                      <div className="space-y-0.5 text-xs">
                        <span className="font-bold block text-rose-950">Ações de Desenvolvimento / Diagnóstico</span>
                        <p className="text-rose-700">Reinicie o banco de dados local com registros seed limpos para testar o sistema.</p>
                      </div>
                      <button 
                        onClick={handleResetLocal}
                        className="bg-rose-600 hover:bg-rose-700 text-white font-bold text-xs px-4 py-2.5 rounded-xl transition shadow-md shadow-rose-100 shrink-0"
                      >
                        Reseed LocalData
                      </button>
                    </div>

                    </motion.div>
                  )}
                  </AnimatePresence>

                </motion.div>
              )}

              {/* TAB 6: REPORTS & STATS */}
              {activeTab === 'relatorios' && (
                currentUser?.funcao === 'Mecânico' ? (
                  <motion.div
                    key="tab_relatorios_restricted"
                    initial={{ opacity: 0, scale: 0.98 }}
                    animate={{ opacity: 1, scale: 1 }}
                    exit={{ opacity: 0, scale: 0.98 }}
                    className="bg-white rounded-3xl p-12 border border-slate-200/80 shadow-md text-center flex flex-col items-center justify-center space-y-4 max-w-2xl mx-auto my-12"
                    id="restricted_report_container"
                  >
                    <div className="bg-slate-50 p-5 rounded-3xl text-slate-400 border border-slate-100 shadow-inner">
                      <Lock className="w-12 h-12 text-slate-500 animate-pulse" />
                    </div>
                    <div className="space-y-2">
                      <h3 className="text-xl font-bold tracking-tight text-slate-900 font-sans">Acesso Altamente Restrito</h3>
                      <p className="text-sm text-slate-500 leading-relaxed max-w-md">
                        Caro colaborador, seu perfil de <strong>Mecânico</strong> não possui permissões habilitadas para auditar relatórios e fluxos financeiros. 
                        Caso necessite dessa alteração, contate seu Gerente ou Administrador do sistema.
                      </p>
                    </div>
                    <button
                      onClick={() => setActiveTab('dashboard')}
                      className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-5 py-2.5 rounded-xl text-xs transition shadow-md shadow-indigo-100 mt-2"
                      id="btn_back_dashboard"
                    >
                      Voltar ao Painel Geral
                    </button>
                  </motion.div>
                ) : (
                  <motion.div
                    key="tab_relatorios"
                    initial={{ opacity: 0, y: 15 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -15 }}
                    transition={{ duration: 0.15 }}
                    className="space-y-6"
                  >
                  {/* Title Bar */}
                  <div className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
                    <div>
                      <h3 className="text-lg font-bold tracking-tight text-slate-900 font-sans flex items-center gap-2">
                        <BarChart3 className="w-5 h-5 text-indigo-600" />
                        Seção de Relatórios de Vendas
                      </h3>
                      <p className="text-xs text-slate-500">Gere relatório consolidado de vendas e faturamento de serviços por período, cliente ou tipo de serviço.</p>
                    </div>

                    <div className="flex items-center gap-2 w-full sm:w-auto">
                      <button
                        onClick={handleExportCSV}
                        className="flex-1 sm:flex-initial bg-emerald-50 hover:bg-emerald-100 text-emerald-700 font-bold px-4 py-2.5 rounded-xl border border-emerald-200 text-xs flex items-center justify-center gap-1.5 transition"
                      >
                        <FileSpreadsheet className="w-4 h-4" />
                        <span>Exportar CSV (Excel)</span>
                      </button>
                      <button
                        onClick={handleExportPDF}
                        className="flex-1 sm:flex-initial bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-4 py-2.5 rounded-xl border border-transparent text-xs flex items-center justify-center gap-1.5 transition shadow-sm shadow-indigo-100"
                      >
                        <Printer className="w-4 h-4" />
                        <span>Gerar PDF / Imprimir</span>
                      </button>
                    </div>
                  </div>

                  {/* Dynamic Filters panel */}
                  <div className="bg-white rounded-3xl p-6 border border-slate-200/80 shadow-sm space-y-4">
                    <h4 className="font-bold text-slate-700 text-xs uppercase tracking-wider flex items-center gap-1.5 border-b border-slate-100 pb-2">
                      <SlidersHorizontal className="w-4 h-4 text-indigo-600" />
                      Filtros de Pesquisa Personalizados
                    </h4>

                    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 text-xs">
                      {/* Period Filter (Start Date) */}
                      <div className="space-y-1">
                        <label className="font-bold text-slate-600 block">Data de Início</label>
                        <input
                          type="date"
                          value={reportStartDate}
                          onChange={(e) => setReportStartDate(e.target.value)}
                          className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 focus:bg-white rounded-xl px-3 py-2 outline-none transition"
                        />
                      </div>

                      {/* Period Filter (End Date) */}
                      <div className="space-y-1">
                        <label className="font-bold text-slate-600 block">Data de Fim</label>
                        <input
                          type="date"
                          value={reportEndDate}
                          onChange={(e) => setReportEndDate(e.target.value)}
                          className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 focus:bg-white rounded-xl px-3 py-2 outline-none transition"
                        />
                      </div>

                      {/* Client Filter */}
                      <div className="space-y-1">
                        <label className="font-bold text-slate-600 block">Cliente</label>
                        <select
                          value={reportClienteId}
                          onChange={(e) => setReportClienteId(e.target.value)}
                          className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 focus:bg-white rounded-xl px-3 py-2 outline-none transition cursor-pointer appearance-none"
                        >
                          <option value="todos">Todos os Clientes</option>
                          {clientes.map(c => (
                            <option key={c.id} value={c.id}>{c.nome}</option>
                          ))}
                        </select>
                      </div>

                      {/* Status Filter */}
                      <div className="space-y-1">
                        <label className="font-bold text-slate-600 block">Status de Execução</label>
                        <select
                          value={reportStatus}
                          onChange={(e) => setReportStatus(e.target.value)}
                          className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 focus:bg-white rounded-xl px-3 py-2 outline-none transition cursor-pointer appearance-none"
                        >
                          <option value="todos">Todos os Serviços</option>
                          <option value="concluido">Pago & Concluído</option>
                          <option value="em_andamento">Em Andamento</option>
                          <option value="orcamento">Apenas Orçamentos</option>
                          <option value="aguardando_pecas">Aguardando Peças</option>
                          <option value="cancelado">Cancelados</option>
                        </select>
                      </div>
                    </div>

                    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 pt-1 items-end text-xs">
                      {/* Keyword Filter */}
                      <div className="space-y-1 sm:col-span-2">
                        <label className="font-bold text-slate-600 block">Tipo de Serviço / Descrição / Veículo (Placa / Modelo)</label>
                        <div className="relative">
                          <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400" />
                          <input
                            type="text"
                            placeholder="Buscar por descrição, modelo do veículo ou placa..."
                            value={reportKeyword}
                            onChange={(e) => setReportKeyword(e.target.value)}
                            className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 focus:bg-white rounded-xl pl-9 pr-3 py-2 outline-none transition"
                          />
                        </div>
                      </div>

                      {/* Shortcut period selector buttons */}
                      <div className="sm:col-span-2 flex flex-wrap gap-2 pt-1 sm:pt-0">
                        <button
                          type="button"
                          onClick={() => {
                            const d = new Date();
                            d.setDate(1); // start of this month
                            setReportStartDate(d.toISOString().split('T')[0]);
                            setReportEndDate(new Date().toISOString().split('T')[0]);
                          }}
                          className="px-2.5 py-1.5 bg-slate-100 hover:bg-slate-200/80 text-slate-600 rounded-lg text-[10.5px] font-semibold transition"
                        >
                          Este Mês
                        </button>
                        <button
                          type="button"
                          onClick={() => {
                            const d = new Date();
                            d.setMonth(d.getMonth() - 1); // 30 days ago
                            setReportStartDate(d.toISOString().split('T')[0]);
                            setReportEndDate(new Date().toISOString().split('T')[0]);
                          }}
                          className="px-2.5 py-1.5 bg-slate-100 hover:bg-slate-200/80 text-slate-600 rounded-lg text-[10.5px] font-semibold transition"
                        >
                          Últimos 30 Dias
                        </button>
                        <button
                          type="button"
                          onClick={() => {
                            const d = new Date();
                            d.setMonth(d.getMonth() - 3); // 90 days ago
                            setReportStartDate(d.toISOString().split('T')[0]);
                            setReportEndDate(new Date().toISOString().split('T')[0]);
                          }}
                          className="px-2.5 py-1.5 bg-slate-100 hover:bg-slate-200/80 text-slate-600 rounded-lg text-[10.5px] font-semibold transition"
                        >
                          Últimos 90 Dias
                        </button>
                        <button
                          type="button"
                          onClick={() => {
                            setReportStartDate("2026-01-01");
                            setReportEndDate("2026-12-31");
                          }}
                          className="px-2.5 py-1.5 bg-slate-100 hover:bg-slate-200/80 text-slate-600 rounded-lg text-[10.5px] font-semibold transition"
                        >
                          Ano Atual
                        </button>
                        <button
                          type="button"
                          onClick={() => {
                            setReportStartDate('');
                            setReportEndDate('');
                            setReportClienteId('todos');
                            setReportStatus('todos');
                            setReportKeyword('');
                          }}
                          className="px-2.5 py-1.5 bg-rose-50 hover:bg-rose-100 text-rose-600 rounded-lg text-[10.5px] font-bold transition ml-auto"
                        >
                          Limpar Filtros
                        </button>
                      </div>
                    </div>
                  </div>

                  {/* Summary Metric Cards */}
                  <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4">
                    {/* Active filtered OS count */}
                    <div className="bg-white/85 backdrop-blur-xs rounded-2xl p-3.5 sm:p-5 border border-slate-200/60 shadow-xs flex items-center gap-2.5 sm:gap-4 min-w-0 transition hover:bg-white">
                      <div className="p-2 sm:p-3 bg-indigo-50 text-indigo-600 rounded-xl shrink-0">
                        <FileText className="w-4 h-4 sm:w-5 sm:h-5" />
                      </div>
                      <div className="min-w-0">
                        <span className="text-[9px] sm:text-[10px] text-slate-400 block font-bold uppercase tracking-wider font-sans truncate" title="Ordens de Serviço">Ordens de Serviço</span>
                        <span className="text-sm sm:text-lg font-bold text-slate-900 block truncate">{getFilteredReports().length} O.S.</span>
                      </div>
                    </div>

                    {/* Mão de Obra revenues */}
                    <div className="bg-white/85 backdrop-blur-xs rounded-2xl p-3.5 sm:p-5 border border-slate-200/60 shadow-xs flex items-center gap-2.5 sm:gap-4 min-w-0 transition hover:bg-white">
                      <div className="p-2 sm:p-3 bg-indigo-50 text-indigo-600 rounded-xl shrink-0">
                        <Wrench className="w-4 h-4 sm:w-5 sm:h-5" />
                      </div>
                      <div className="min-w-0">
                        <span className="text-[9px] sm:text-[10px] text-slate-400 block font-bold uppercase tracking-wider font-sans truncate" title="Faturamento M.O.">Faturamento M.O.</span>
                        <span className="text-sm sm:text-lg font-bold text-slate-900 block truncate" title={formatCurrency(getFilteredReports().reduce((sum, s) => sum + (s.mao_de_obra_valor || 0), 0))}>
                          {formatCurrency(getFilteredReports().reduce((sum, s) => sum + (s.mao_de_obra_valor || 0), 0))}
                        </span>
                      </div>
                    </div>

                    {/* Peças revenues */}
                    <div className="bg-white/85 backdrop-blur-xs rounded-2xl p-3.5 sm:p-5 border border-slate-200/60 shadow-xs flex items-center gap-2.5 sm:gap-4 min-w-0 transition hover:bg-white">
                      <div className="p-2 sm:p-3 bg-indigo-50 text-indigo-600 rounded-xl shrink-0">
                        <Package className="w-4 h-4 sm:w-5 sm:h-5" />
                      </div>
                      <div className="min-w-0">
                        <span className="text-[9px] sm:text-[10px] text-slate-400 block font-bold uppercase tracking-wider font-sans truncate" title="Venda de Peças">Venda de Peças</span>
                        <span className="text-sm sm:text-lg font-bold text-slate-900 block truncate" title={formatCurrency(getFilteredReports().reduce((sum, s) => sum + (s.pecas_usadas?.reduce((su, p) => su + (p.preco_venda * p.quantidade), 0) || 0), 0))}>
                          {formatCurrency(getFilteredReports().reduce((sum, s) => {
                            const sumP = s.pecas_usadas?.reduce((su, p) => su + (p.preco_venda * p.quantidade), 0) || 0;
                            return sum + sumP;
                          }, 0))}
                        </span>
                      </div>
                    </div>

                    {/* Faturamento Geral */}
                    <div className="bg-gradient-to-br from-indigo-500/90 to-indigo-600/90 backdrop-blur-xs rounded-2xl p-3.5 sm:p-5 text-white shadow-xs border border-indigo-500/20 flex items-center gap-2.5 sm:gap-4 min-w-0 transition hover:from-indigo-550 hover:to-indigo-650">
                      <div className="p-2 sm:p-3 bg-white/15 text-white rounded-xl shrink-0">
                        <DollarSign className="w-4 h-4 sm:w-5 sm:h-5" />
                      </div>
                      <div className="min-w-0">
                        <span className="text-[9px] sm:text-[10px] text-indigo-200 block font-bold uppercase tracking-wider font-sans truncate" title="Receita Consolidada">Receita Consolidada</span>
                        <span className="text-sm sm:text-lg font-extrabold font-mono block truncate" title={formatCurrency(getFilteredReports().reduce((sum, s) => sum + (s.total || 0), 0))}>
                          {formatCurrency(getFilteredReports().reduce((sum, s) => sum + (s.total || 0), 0))}
                        </span>
                      </div>
                    </div>
                  </div>

                  {/* MAIN TABLE DESIGN */}
                  <div className="bg-white rounded-3xl border border-slate-200/80 shadow-sm overflow-hidden" id="report_results_table">
                    <div className="p-5 border-b border-slate-200/80 flex items-center justify-between">
                      <h4 className="text-xs font-bold text-slate-800 uppercase tracking-widest flex items-center gap-1.5 font-sans">
                        <span>Listagem Detalhada de Vendas</span>
                        <span className="bg-indigo-50 text-indigo-700 text-[10px] lowercase px-2 py-0.5 rounded-md font-sans">
                          {getFilteredReports().length} itens filtrados
                        </span>
                      </h4>
                    </div>

                    <div className="overflow-x-auto">
                      <table className="w-full text-left border-collapse text-xs">
                        <thead>
                          <tr className="bg-slate-50 border-b border-slate-200/80 font-bold text-slate-500 uppercase tracking-wider font-sans">
                            <th className="p-4 pl-6">Código O.S.</th>
                            <th className="p-4">Cliente / Contato</th>
                            <th className="p-4">Veículo / Placa</th>
                            <th className="p-4">Data Abertura</th>
                            <th className="p-4">Status</th>
                            <th className="p-4 text-right">Mão de Obra</th>
                            <th className="p-4 text-right">Peças</th>
                            <th className="p-4 text-right pr-6">Total Geral</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-105 font-medium">
                          {getFilteredReports().length === 0 ? (
                            <tr>
                              <td colSpan={8} className="p-12 text-center text-slate-400">
                                <FileText className="w-8 h-8 text-slate-350 mx-auto mb-2.5 animate-pulse" />
                                <p className="font-semibold text-sm text-slate-500 font-sans">Nenhum serviço ou venda com esses termos.</p>
                                <p className="text-xs text-slate-400 mt-1 font-sans">Experimente alterar o período ou selecionar outros clientes.</p>
                              </td>
                            </tr>
                          ) : (
                            getFilteredReports().map((s) => {
                              const totalPecasVal = s.pecas_usadas?.reduce((sum, p) => sum + (p.preco_venda * p.quantidade), 0) || 0;
                              const statusStyles: Record<string, string> = {
                                orcamento: 'bg-slate-100 text-slate-700',
                                em_andamento: 'bg-blue-50 text-blue-700 border-blue-100',
                                aguardando_pecas: 'bg-amber-50 text-amber-700 border-amber-100',
                                concluido: 'bg-emerald-50 text-emerald-700 border-emerald-100',
                                cancelado: 'bg-rose-50 text-rose-700 border-rose-100'
                              };
                              const statusLabels: Record<string, string> = {
                                orcamento: 'Orçamento',
                                em_andamento: 'Em Execução',
                                aguardando_pecas: 'Aguardando Peças',
                                concluido: 'Pago & Concluído',
                                cancelado: 'Cancelado'
                              };

                              return (
                                <tr key={s.id} className="hover:bg-slate-50/55 transition cursor-pointer" onClick={() => { setSelectedServico(s); setActiveModal('visualizar_servico'); }}>
                                  <td className="p-4 pl-6 font-mono font-bold text-indigo-600">#{s.id.substring(0, 8).toUpperCase()}</td>
                                  <td className="p-4">
                                    <span className="font-bold text-slate-900 block font-sans">{s.cliente_nome}</span>
                                    <span className="text-slate-400 text-[10px] block mt-0.5 font-sans">
                                      {clientes.find(c => c.id === s.cliente_id)?.telefone || 'Sem telefone'}
                                    </span>
                                  </td>
                                  <td className="p-4">
                                    <span className="font-bold text-slate-800 block font-sans">{s.veiculo_modelo || 'Veículo genérico'}</span>
                                    <span className="text-[10px] text-indigo-600 font-mono font-bold uppercase tracking-widest">{s.veiculo_placa}</span>
                                  </td>
                                  <td className="p-4 text-slate-550 font-mono">{s.criado_em ? new Date(s.criado_em).toLocaleDateString('pt-BR') : 'Sem data'}</td>
                                  <td className="p-4">
                                    <span className={`px-2 py-1 rounded-full text-[9px] font-bold uppercase font-sans ${statusStyles[s.status] || 'bg-slate-100'}`}>
                                      {statusLabels[s.status] || s.status}
                                    </span>
                                  </td>
                                  <td className="p-4 text-right font-mono text-slate-600">{formatCurrency(s.mao_de_obra_valor)}</td>
                                  <td className="p-4 text-right font-mono text-slate-600">{formatCurrency(totalPecasVal)}</td>
                                  <td className="p-4 text-right font-mono text-slate-900 font-bold pr-6">{formatCurrency(s.total)}</td>
                                </tr>
                              );
                            })
                          )}
                        </tbody>
                      </table>
                    </div>
                  </div>
                </motion.div>
                )
              )}

            </AnimatePresence>
          )}
        </main>
      </div>

      {/* ==========================================
          MODALS & DRAWERS FOR ACTIONS
         ========================================== */}

      <AnimatePresence>
        
        {/* MODAL 1.5: VISUALIZAR CLIENTE */}
        {activeModal === 'visualizar_cliente' && selectedCliente && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 flex items-center justify-center p-2 sm:p-4 backdrop-blur-xs overflow-y-auto">
            <motion.div 
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-2xl p-5 sm:p-6 shadow-2xl border border-slate-200/80 space-y-5 my-auto max-h-[calc(100vh-2rem)] sm:max-h-[90%] flex flex-col"
              id="cliente_modal_details"
            >
              <div className="flex items-center justify-between shrink-0 border-b border-slate-100 pb-3">
                <div className="flex items-center gap-2">
                  <div className="w-10 h-10 bg-indigo-50 rounded-xl flex items-center justify-center text-indigo-600">
                    <User className="w-5 h-5" />
                  </div>
                  <div>
                    <h3 className="text-base font-bold text-slate-900">Ficha Informativa do Cliente</h3>
                    <p className="text-[10px] text-slate-400 font-mono">ID: {selectedCliente.id}</p>
                  </div>
                </div>
                <button onClick={() => { setActiveModal(null); setSelectedCliente(null); }} className="p-1 hover:bg-slate-100 rounded-lg text-slate-400 hover:text-slate-700">
                  <X className="w-5 h-5" />
                </button>
              </div>

              {/* Dynamic Content Body */}
              <div className="flex-1 overflow-y-auto space-y-5 pr-1 font-sans text-sm">
                
                {/* Client Meta Info Card */}
                <div className="bg-slate-50 border border-slate-200/40 rounded-2xl p-4">
                  <h4 className="text-sm font-bold text-slate-900 mb-3">{selectedCliente.nome}</h4>
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 text-xs">
                    <div className="bg-white p-2.5 rounded-xl border border-slate-200/60">
                      <span className="text-[10px] text-slate-400 block font-semibold uppercase tracking-wider mb-0.5">Telefone</span>
                      <span className="font-bold text-slate-800">{selectedCliente.telefone || 'Ainda sem telefone'}</span>
                    </div>
                    <div className="bg-white p-2.5 rounded-xl border border-slate-200/60">
                      <span className="text-[10px] text-slate-400 block font-semibold uppercase tracking-wider mb-0.5">Documento (CPF / CNPJ)</span>
                      <span className="font-bold text-slate-800">{selectedCliente.cpf_cnpj || 'Ainda sem documento'}</span>
                    </div>
                    <div className="bg-white p-2.5 rounded-xl border border-slate-200/60 sm:col-span-2">
                      <span className="text-[10px] text-slate-400 block font-semibold uppercase tracking-wider mb-0.5 font-mono">E-mail</span>
                      <span className="font-medium text-slate-800">{selectedCliente.email || 'Ainda sem e-mail cadastrado'}</span>
                    </div>
                    <div className="bg-white p-2.5 rounded-xl border border-slate-200/60 sm:col-span-2">
                      <span className="text-[10px] text-slate-400 block font-semibold uppercase tracking-wider mb-0.5">Endereço de Correspondência</span>
                      <span className="font-medium text-slate-800">{selectedCliente.endereco || 'Ainda sem endereço cadastrado'}</span>
                    </div>
                  </div>
                </div>

                {/* Section: Linked Vehicles */}
                <div>
                  <h4 className="text-xs font-bold uppercase tracking-wider text-slate-400 mb-2 flex items-center gap-1.5 font-mono">
                    <Car className="w-3.5 h-3.5 text-indigo-500" />
                    <span>Carros e Propriedades ({veiculos.filter(v => v.cliente_id === selectedCliente.id).length})</span>
                  </h4>
                  {veiculos.filter(v => v.cliente_id === selectedCliente.id).length === 0 ? (
                    <p className="text-xs text-slate-400 bg-slate-50/50 p-4 text-center rounded-xl border border-dashed border-slate-200">Não há nenhum veículo vinculado a este cliente no momento.</p>
                  ) : (
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                      {veiculos.filter(v => v.cliente_id === selectedCliente.id).map(v => (
                        <div key={v.id} className="bg-white border border-slate-200 p-3.5 rounded-2xl flex flex-col justify-between shadow-xs">
                          <div>
                            <div className="flex justify-between items-start mb-1">
                              <span className="font-bold text-slate-800 text-xs">{v.marca} {v.modelo}</span>
                              <span className="bg-indigo-50 border border-indigo-100 text-indigo-700 text-[10px] font-bold px-2 py-0.5 rounded uppercase font-mono tracking-widest">{v.placa}</span>
                            </div>
                            <p className="text-[11px] text-slate-500 mt-0.5">Cor: {v.cor} • Ano: {v.ano}</p>
                            {v.chassi && <p className="text-[10px] text-slate-400 font-mono mt-1.5 bg-slate-50 p-1.5 rounded-lg border border-slate-200">Chassi: {v.chassi}</p>}
                          </div>
                        </div>
                      ))}
                    </div>
                  )}
                </div>

                {/* Section: Service History */}
                <div>
                  <h4 className="text-xs font-bold uppercase tracking-wider text-slate-400 mb-2 flex items-center gap-1.5 font-mono">
                    <ClipboardList className="w-3.5 h-3.5 text-indigo-500" />
                    <span>Histórico de Ordens de Serviço ({servicos.filter(s => s.cliente_id === selectedCliente.id).length})</span>
                  </h4>
                  {servicos.filter(s => s.cliente_id === selectedCliente.id).length === 0 ? (
                    <p className="text-xs text-slate-400 bg-slate-50/50 p-4 text-center rounded-xl border border-dashed border-slate-200">Não há ordens de serviço ou orçamentos registrados para este cliente.</p>
                  ) : (
                    <div className="space-y-2 max-h-52 overflow-y-auto pr-1">
                      {servicos.filter(s => s.cliente_id === selectedCliente.id).map(s => {
                        const statusColors = s.status === 'concluido' 
                          ? 'bg-emerald-50 text-emerald-700 border-emerald-100' 
                          : s.status === 'em_andamento'
                          ? 'bg-sky-50 text-sky-700 border-sky-100'
                          : s.status === 'aguardando_pecas'
                          ? 'bg-amber-50 text-amber-700 border-amber-100'
                          : 'bg-slate-50 text-slate-600 border-slate-100';

                        const statusText = s.status === 'concluido' 
                          ? 'Concluido' 
                          : s.status === 'em_andamento'
                          ? 'Em Andamento'
                          : s.status === 'aguardando_pecas'
                          ? 'Aguardando Peças'
                          : 'Orçamento';

                        return (
                          <div key={s.id} className="bg-slate-50/70 border border-slate-200/60 p-3 rounded-2xl flex items-center justify-between gap-3 text-xs">
                            <div className="space-y-1 bg-transparent p-0 border-0 shadow-none">
                              <div className="flex items-center gap-2">
                                <span className="font-bold text-slate-800">O.S. #{s.id.substring(0, 6).toUpperCase()}</span>
                                <span className={`text-[10px] font-bold px-2 py-0.5 rounded-md border ${statusColors}`}>{statusText}</span>
                              </div>
                              <p className="text-slate-500 line-clamp-1">{s.descricao || 'Sem descrição'}</p>
                              <span className="text-[10px] text-slate-400 block font-mono">{new Date(s.criado_em).toLocaleDateString('pt-BR')}</span>
                            </div>
                            <div className="text-right shrink-0">
                              <p className="font-extrabold text-slate-900">R$ {Number(s.total || 0).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p>
                              <button 
                                onClick={() => {
                                  setSelectedServico(s);
                                  setActiveModal('visualizar_servico');
                                }}
                                className="text-indigo-600 hover:text-indigo-800 font-semibold text-[11px] hover:underline block mt-1 ml-auto"
                              >
                                Ver Detalhes
                              </button>
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  )}
                </div>

              </div>

              {/* Action Footer */}
              <div className="pt-3 border-t border-slate-100 flex justify-end shrink-0">
                <button
                  type="button"
                  onClick={() => { setActiveModal(null); setSelectedCliente(null); }}
                  className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold text-xs px-5 py-2.5 rounded-xl transition"
                >
                  Fechar
                </button>
              </div>
            </motion.div>
          </div>
        )}

        {/* MODAL 1: CLIENTES FORM */}
        {activeModal === 'cliente' && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 flex items-center justify-center p-2 sm:p-4 backdrop-blur-xs overflow-y-auto">
            <motion.div 
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-lg p-5 sm:p-6 shadow-2xl border border-slate-200/80 space-y-4 my-auto max-h-[calc(100vh-2rem)] sm:max-h-[90vh] overflow-y-auto"
              id="cliente_modal_form"
            >
              <div className="flex items-center justify-between">
                <h3 className="text-base font-bold text-slate-900">{modalMode === 'criar' ? 'Cadastrar Novo Cliente' : 'Editar Cadastro de Cliente'}</h3>
                <button onClick={() => setActiveModal(null)} className="p-1 hover:bg-slate-100 rounded-lg text-slate-400 hover:text-slate-700">
                  <X className="w-5 h-5" />
                </button>
              </div>

              <form onSubmit={handleSaveCliente} className="space-y-4 text-xs">
                
                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Nome do Cliente *</label>
                  <input 
                    type="text" 
                    placeholder="Ex: Carlos Eduardo de Oliveira"
                    value={formCliente.nome}
                    onChange={(e) => setFormCliente({ ...formCliente, nome: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                    required
                  />
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">CPF ou CNPJ</label>
                    <input 
                      type="text" 
                      placeholder="000.000.000-00 ou 00.000.000/0000-00"
                      value={formCliente.cpf_cnpj}
                      onChange={(e) => setFormCliente({ ...formCliente, cpf_cnpj: formatCPFOrCNPJ(e.target.value) })}
                      maxLength={18}
                      className={`w-full bg-slate-50 border rounded-xl px-3 py-2 outline-none transition-all ${
                        formCliente.cpf_cnpj 
                          ? (getCpfCnpjValidation(formCliente.cpf_cnpj).isError 
                            ? 'border-rose-300 focus:border-rose-500 ring-rose-50 focus:ring-2 bg-rose-50/10' 
                            : 'border-emerald-300 focus:border-emerald-500 ring-emerald-50 focus:ring-2 bg-emerald-50/10') 
                          : 'border-slate-200 focus:border-indigo-500'
                      }`}
                    />
                    {(() => {
                      const val = getCpfCnpjValidation(formCliente.cpf_cnpj);
                      if (!formCliente.cpf_cnpj) {
                        return <span className="text-[10px] text-slate-400 block pt-0.5 font-medium">Opcional para cadastro</span>;
                      }
                      if (val.isError) {
                        return (
                          <span className="text-[10px] text-rose-600 font-bold block pt-0.5 flex items-center gap-1">
                            <span className="w-1.5 h-1.5 rounded-full bg-rose-500 shrink-0"></span>
                            {val.message}
                          </span>
                        );
                      }
                      return (
                        <span className="text-[10px] text-emerald-600 font-bold block pt-0.5 flex items-center gap-1">
                          <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0"></span>
                          {val.message}
                        </span>
                      );
                    })()}
                  </div>
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Telefone / WhatsApp *</label>
                    <input 
                      type="text" 
                      placeholder="(11) 99999-9999"
                      value={formCliente.telefone}
                      onChange={(e) => setFormCliente({ ...formCliente, telefone: e.target.value })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                      required
                    />
                  </div>
                </div>

                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">E-mail</label>
                  <input 
                    type="email" 
                    placeholder="carlos@email.com"
                    value={formCliente.email}
                    onChange={(e) => setFormCliente({ ...formCliente, email: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                  />
                </div>

                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Endereço Completo</label>
                  <textarea 
                    placeholder="Rua, Número, Bairro, Cidade - UF"
                    value={formCliente.endereco}
                    onChange={(e) => setFormCliente({ ...formCliente, endereco: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none h-16 resize-none"
                  />
                </div>

                <div className="flex items-center justify-end gap-2 pt-2 text-xs">
                  <button type="button" onClick={() => setActiveModal(null)} className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-4 py-2 rounded-xl">
                    Cancelar
                  </button>
                  <button type="submit" className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-5 py-2 rounded-xl shadow-md">
                    Salvar Cliente
                  </button>
                </div>
              </form>
            </motion.div>
          </div>
        )}

        {/* MODAL 2: VEÍCULOS FORM */}
        {activeModal === 'veiculo' && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 flex items-center justify-center p-2 sm:p-4 backdrop-blur-xs overflow-y-auto">
            <motion.div 
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-lg p-5 sm:p-6 shadow-2xl border border-slate-200/80 space-y-4 my-auto max-h-[calc(100vh-2rem)] sm:max-h-[90vh] overflow-y-auto"
              id="veiculo_modal_form"
            >
              <div className="flex items-center justify-between">
                <h3 className="text-base font-bold text-slate-900">{modalMode === 'criar' ? 'Cadastrar Novo Veículo' : 'Editar Cadastro de Veículo'}</h3>
                <button onClick={() => setActiveModal(null)} className="p-1 hover:bg-slate-100 rounded-lg text-slate-400 hover:text-slate-700">
                  <X className="w-5 h-5" />
                </button>
              </div>

              <form onSubmit={handleSaveVeiculo} className="space-y-4 text-xs">
                
                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Proprietário / Cliente *</label>
                  <select 
                    value={formVeiculo.cliente_id}
                    onChange={(e) => setFormVeiculo({ ...formVeiculo, cliente_id: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none text-xs"
                    required
                  >
                    <option value="" disabled>Selecione um cliente...</option>
                    {clientes.map(c => (
                      <option key={c.id} value={c.id}>{c.nome}</option>
                    ))}
                  </select>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Marca do Veículo *</label>
                    <input 
                      type="text" 
                      placeholder="Ex: Honda, Chevrolet, VW"
                      value={formVeiculo.marca}
                      onChange={(e) => setFormVeiculo({ ...formVeiculo, marca: e.target.value })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                      required
                    />
                  </div>
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Modelo *</label>
                    <input 
                      type="text" 
                      placeholder="Ex: Civic DX 2.0"
                      value={formVeiculo.modelo}
                      onChange={(e) => setFormVeiculo({ ...formVeiculo, modelo: e.target.value })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                      required
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-3 gap-2">
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Placa do Veículo *</label>
                    <input 
                      type="text" 
                      placeholder="BRA2E19 ou AAA-1234"
                      value={formVeiculo.placa}
                      onChange={(e) => setFormVeiculo({ ...formVeiculo, placa: e.target.value })}
                      className={`w-full bg-slate-50 border text-slate-800 font-bold uppercase tracking-widest focus:border-indigo-500 rounded-xl px-3 py-2 outline-none text-center transition-all ${
                        formVeiculo.placa.trim() === ''
                          ? 'border-slate-200'
                          : validateBrazilianPlate(formVeiculo.placa)
                            ? 'border-emerald-500 ring-2 ring-emerald-100/50'
                            : 'border-rose-400 ring-2 ring-rose-100/50'
                      }`}
                      required
                    />
                    {formVeiculo.placa.trim() !== '' && (
                      <div className="text-[10px] font-bold mt-1 text-center">
                        {validateBrazilianPlate(formVeiculo.placa) ? (
                          <span className="text-emerald-600 bg-emerald-50 px-2.5 py-0.5 rounded-full border border-emerald-150 inline-block">✓ Padrão Válido</span>
                        ) : (
                          <span className="text-rose-650 bg-rose-50 px-2.5 py-0.5 rounded-full border border-rose-150 inline-block">✗ Formato Inválido</span>
                        )}
                      </div>
                    )}
                  </div>
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Cor</label>
                    <input 
                      type="text" 
                      placeholder="Preto"
                      value={formVeiculo.cor}
                      onChange={(e) => setFormVeiculo({ ...formVeiculo, cor: e.target.value })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                    />
                  </div>
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Ano Modelo</label>
                    <input 
                      type="number" 
                      placeholder="2018"
                      value={formVeiculo.ano}
                      onChange={(e) => setFormVeiculo({ ...formVeiculo, ano: Number(e.target.value) })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                    />
                  </div>
                </div>

                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Número do Chassi</label>
                  <input 
                    type="text" 
                    placeholder="9BH123456..."
                    value={formVeiculo.chassi}
                    onChange={(e) => setFormVeiculo({ ...formVeiculo, chassi: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                  />
                </div>

                <div className="flex items-center justify-end gap-2 pt-2 text-xs">
                  <button type="button" onClick={() => setActiveModal(null)} className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-4 py-2 rounded-xl">
                    Cancelar
                  </button>
                  <button type="submit" className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-5 py-2 rounded-xl shadow-md">
                    Vincular Carro
                  </button>
                </div>
              </form>
            </motion.div>
          </div>
        )}

        {/* MODAL 3: PEÇAS / ESTOQUE FORM */}
        {activeModal === 'peca' && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 flex items-center justify-center p-2 sm:p-4 backdrop-blur-xs overflow-y-auto">
            <motion.div 
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-lg p-5 sm:p-6 shadow-2xl border border-slate-200/80 space-y-4 my-auto max-h-[calc(100vh-2rem)] sm:max-h-[90vh] overflow-y-auto"
              id="peca_modal_form"
            >
              <div className="flex items-center justify-between">
                <h3 className="text-base font-bold text-slate-900">{modalMode === 'criar' ? 'Registrar Item no Almoxarifado' : 'Editar Propriedades da Peça'}</h3>
                <button onClick={() => setActiveModal(null)} className="p-1 hover:bg-slate-100 rounded-lg text-slate-400 hover:text-slate-700">
                  <X className="w-5 h-5" />
                </button>
              </div>

              <form onSubmit={handleSavePeca} className="space-y-4 text-xs">
                
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Código / Referência Fabricante *</label>
                    <input 
                      type="text" 
                      placeholder="Cód: PF-CIV18"
                      value={formPeca.codigo}
                      onChange={(e) => setFormPeca({ ...formPeca, codigo: e.target.value })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none font-mono"
                      required
                      disabled={modalMode === 'editar'}
                    />
                  </div>
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Categoria / Seção</label>
                    <input 
                      type="text" 
                      placeholder="Ex: Freios, Filtros, Suspensão"
                      value={formPeca.categoria}
                      onChange={(e) => setFormPeca({ ...formPeca, categoria: e.target.value })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                    />
                  </div>
                </div>

                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Descrição / Nome Comercial *</label>
                  <input 
                    type="text" 
                    placeholder="Ex: Pastilha de Freio Dianteira"
                    value={formPeca.nome}
                    onChange={(e) => setFormPeca({ ...formPeca, nome: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none"
                    required
                  />
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-3 gap-2">
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Quantidade Inicial</label>
                    <input 
                      type="number" 
                      value={formPeca.quantidade}
                      onChange={(e) => setFormPeca({ ...formPeca, quantidade: Number(e.target.value) })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 text-center"
                    />
                  </div>
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block font-sans">Limite Crítico Alerta</label>
                    <input 
                      type="number" 
                      value={formPeca.limite_minimo}
                      onChange={(e) => setFormPeca({ ...formPeca, limite_minimo: Number(e.target.value) })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 text-center"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-1">
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Preço de Custo (R$)</label>
                    <input 
                      type="number" 
                      step="0.01"
                      placeholder="0.00"
                      value={formPeca.preco_custo || ''}
                      onChange={(e) => setFormPeca({ ...formPeca, preco_custo: Number(e.target.value) })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 font-mono"
                    />
                  </div>
                  <div className="space-y-1">
                    <label className="font-bold text-indigo-700 block">Preço de Venda ao Cliente (R$)</label>
                    <input 
                      type="number" 
                      step="0.01"
                      placeholder="0.00"
                      value={formPeca.preco_venda || ''}
                      onChange={(e) => setFormPeca({ ...formPeca, preco_venda: Number(e.target.value) })}
                      className="w-full bg-indigo-50/20 border border-indigo-200 focus:border-indigo-500 rounded-xl px-3 py-2 font-mono font-bold"
                    />
                  </div>
                </div>

                <div className="flex items-center justify-end gap-2 pt-2 text-xs">
                  <button type="button" onClick={() => setActiveModal(null)} className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-4 py-2 rounded-xl">
                    Cancelar
                  </button>
                  <button type="submit" className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-5 py-2 rounded-xl shadow-md">
                    Guardar Peça
                  </button>
                </div>
              </form>
            </motion.div>
          </div>
        )}

        {/* MODAL 4: SERVIÇOS & O.S. FORM */}
        {activeModal === 'servico' && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 flex items-center justify-center p-2 sm:p-4 backdrop-blur-xs overflow-y-auto">
            <motion.div 
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-2xl p-5 sm:p-6 shadow-2xl border border-slate-200/80 space-y-4 my-auto max-h-[calc(100vh-2rem)] sm:max-h-[90vh] overflow-y-auto"
              id="servico_modal_form"
            >
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-base font-bold text-slate-900">{modalMode === 'criar' ? 'Registrar Nova Ordem de Serviço (O.S.)' : 'Modificar Detalhes de O.S.'}</h3>
                  <span className="text-[10px] text-slate-400 block font-normal">Preencha os dados e gerencie a lista de peças associadas</span>
                </div>
                <button onClick={() => setActiveModal(null)} className="p-1 hover:bg-slate-100 rounded-lg text-slate-400 hover:text-slate-700">
                  <X className="w-5 h-5" />
                </button>
              </div>

              <form onSubmit={handleSaveServico} className="space-y-4 text-xs">
                
                {/* Search helper for selection */}
                <div className="bg-indigo-50/40 border border-indigo-100/60 p-3 rounded-2xl grid grid-cols-1 sm:grid-cols-2 gap-2.5 items-center">
                  <div className="space-y-1">
                    <label className="text-[10px] uppercase font-bold text-indigo-700 block">Filtro Rápido de Proprietário/Carro</label>
                    <div className="relative">
                      <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-indigo-500" />
                      <input 
                        type="text"
                        placeholder="Nome, CPF/CNPJ, Placa do Carro..."
                        value={clienteSearch}
                        onChange={(e) => handleClienteSearchChange(e.target.value)}
                        className="w-full bg-white border border-indigo-200/60 focus:border-indigo-500 rounded-xl pl-9 pr-3 py-2 text-[11px] outline-none placeholder:text-slate-400 font-medium transition"
                      />
                    </div>
                  </div>
                  <div className="text-[10px] text-slate-500 leading-normal sm:pl-2">
                    <span className="font-semibold text-indigo-600 block mb-0.5">Dica de Busca:</span>
                    Digite o nome do cliente, CPF/CNPJ ou a placa do veículo para filtrar a lista e encontrar o registro desejado num segundo.
                  </div>
                </div>

                {/* Client and Car Association Grid */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div className="space-y-1">
                    <div className="flex items-center justify-between">
                      <label className="font-bold text-slate-600 block">Cliente Associado *</label>
                      {clienteSearch && (
                        <span className="text-[9px] text-indigo-600 font-bold bg-indigo-50 px-1.5 py-0.2 rounded">Filtrado ({
                          clientes.filter(c => {
                            const s = clienteSearch.toLowerCase();
                            const matchesClient = c.nome.toLowerCase().includes(s) ||
                              (c.cpf_cnpj && c.cpf_cnpj.toLowerCase().includes(s)) ||
                              (c.telefone && c.telefone.toLowerCase().includes(s));
                            const matchesVehicle = veiculos.some(v => 
                              v.cliente_id === c.id && (
                                v.placa.toLowerCase().includes(s) ||
                                v.modelo.toLowerCase().includes(s) ||
                                (v.marca && v.marca.toLowerCase().includes(s))
                              )
                            );
                            return matchesClient || matchesVehicle;
                          }).length
                        })</span>
                      )}
                    </div>
                    <select 
                      value={formServico.cliente_id}
                      onChange={(e) => handleServicoClienteChange(e.target.value)}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none text-xs font-medium text-slate-800"
                      required
                    >
                      <option value="" disabled>Selecione o proprietário...</option>
                      {clientes.filter(c => {
                        if (!clienteSearch) return true;
                        const s = clienteSearch.toLowerCase();
                        const matchesClient = c.nome.toLowerCase().includes(s) ||
                          (c.cpf_cnpj && c.cpf_cnpj.toLowerCase().includes(s)) ||
                          (c.telefone && c.telefone.toLowerCase().includes(s));
                        const matchesVehicle = veiculos.some(v => 
                          v.cliente_id === c.id && (
                            v.placa.toLowerCase().includes(s) ||
                            v.modelo.toLowerCase().includes(s) ||
                            (v.marca && v.marca.toLowerCase().includes(s))
                          )
                        );
                        return matchesClient || matchesVehicle;
                      }).map(c => (
                        <option key={c.id} value={c.id}>{c.nome} {c.cpf_cnpj ? `(${c.cpf_cnpj})` : ''}</option>
                      ))}
                    </select>
                  </div>

                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Veículo Associado *</label>
                    <select 
                      value={formServico.veiculo_id}
                      onChange={(e) => setFormServico({ ...formServico, veiculo_id: e.target.value })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none text-xs font-medium text-slate-800"
                      required
                    >
                      <option value="" disabled>Selecione um carro deste cliente...</option>
                      {veiculos.filter(v => v.cliente_id === formServico.cliente_id).map(v => (
                        <option key={v.id} value={v.id}>{v.marca} {v.modelo} ({v.placa})</option>
                      ))}
                    </select>

                    {formServico.cliente_id && veiculos.filter(v => v.cliente_id === formServico.cliente_id).length === 0 && (
                      <div className="text-[10px] text-amber-600 bg-amber-50/80 border border-amber-200/60 p-2 rounded-xl mt-1 flex flex-col gap-1 leading-normal">
                        <span className="font-semibold">⚠️ Este cliente não possui veículos cadastrados!</span>
                        <button
                          type="button"
                          onClick={() => {
                            setFormVeiculo({
                              marca: '',
                              modelo: '',
                              ano: new Date().getFullYear(),
                              placa: '',
                              cor: '',
                              chassi: '',
                              cliente_id: formServico.cliente_id,
                            });
                            setModalMode('criar');
                            setActiveModal('veiculo');
                          }}
                          className="text-left font-bold text-indigo-600 hover:text-indigo-700 underline flex items-center gap-1 cursor-pointer"
                        >
                          + Cadastrar veículo para este cliente agora
                        </button>
                      </div>
                    )}
                  </div>
                </div>

                {/* Problem Description */}
                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Diagnóstico Técnico / Descrição do Serviço *</label>
                  <textarea 
                    placeholder="Quais problemas o veículo apresenta? Descrição do que será feito..."
                    value={formServico.descricao}
                    onChange={(e) => setFormServico({ ...formServico, descricao: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 h-20 outline-none resize-none text-[11px]"
                    required
                  />
                </div>

                {/* Status selection and Labor Cost (Mão de Obra) */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Status de Execução O.S.</label>
                    <select
                      value={formServico.status}
                      onChange={(e) => setFormServico({ ...formServico, status: e.target.value as any })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none text-xs"
                    >
                      <option value="orcamento">Fazer Orçamento (Pendente)</option>
                      <option value="em_andamento">Execução Iniciada (Aprovado)</option>
                      <option value="aguardando_pecas">Aguardando Peças de Fornecedor</option>
                      <option value="concluido">Serviço Concluído / Integrado</option>
                      <option value="cancelado">Cancelado / Rejeitado</option>
                    </select>
                  </div>

                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block font-mono">Mão de Obra do Mecânico (R$)</label>
                    <input 
                      type="number"
                      step="0.01"
                      placeholder="0.00"
                      value={formServico.mao_de_obra_valor || ''}
                      onChange={(e) => setFormServico({ ...formServico, mao_de_obra_valor: Number(e.target.value) })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-1.8 font-mono font-bold"
                    />
                  </div>
                </div>

                {/* Seleção do Mecânico Responsável */}
                <div className="space-y-1 bg-slate-50/50 p-2.5 rounded-2xl border border-slate-200/50">
                  <label className="font-bold text-slate-700 block text-xs">Mecânico Responsável</label>
                  <select
                    value={formServico.mecanico_id || ''}
                    onChange={(e) => setFormServico({ ...formServico, mecanico_id: e.target.value })}
                    disabled={currentUser?.funcao === 'Mecânico'}
                    className="w-full bg-white border border-slate-200 focus:border-indigo-550 rounded-xl px-3 py-2 outline-none text-xs font-semibold text-slate-800 disabled:bg-slate-100 disabled:text-slate-500 transition cursor-pointer"
                  >
                    <option value="">Não atribuído (Sem Mecânico)</option>
                    {usersList.map(user => (
                      <option key={user.id} value={user.id}>
                        {user.nome} ({user.funcao}){user.id === currentUser?.id ? ' - (Você)' : ''}
                      </option>
                    ))}
                  </select>
                  {currentUser?.funcao === 'Mecânico' && (
                    <span className="text-[10px] text-slate-400 block mt-0.5">
                      🔒 Permissão limitada: Apenas Administradores ou Supervisores podem alterar o mecânico responsável.
                    </span>
                  )}
                </div>

                {/* Vistoria Checklist Section */}
                <div className="bg-slate-50 border border-slate-200/80 rounded-2xl p-4 space-y-3 dark:bg-slate-900/50">
                  <div className="flex items-center gap-1.5 text-xs font-bold text-slate-800 dark:text-slate-200 uppercase tracking-wider">
                    <CheckCheck className="w-4 h-4 text-indigo-600" />
                    <span>Checklist de Vistoria (Entrada do Veículo)</span>
                  </div>
                  
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-1">
                    <div className="space-y-1">
                      <label className="font-semibold text-slate-650 dark:text-slate-400 block">Nível de Combustível</label>
                      <select
                        value={formServico.checklist?.combustivel || 'Não Informado'}
                        onChange={(e) => setFormServico({
                          ...formServico,
                          checklist: { ...(formServico.checklist || {}), combustivel: e.target.value }
                        })}
                        className="w-full bg-white border border-slate-250 rounded-xl px-3 py-2 outline-none text-xs"
                      >
                        <option value="Não Informado">Não Informado</option>
                        <option value="Reserva">Reserva (Crítico)</option>
                        <option value="1/4">1/4 Tanque</option>
                        <option value="1/2">1/2 Tanque (Meio)</option>
                        <option value="3/4">3/4 Tanque</option>
                        <option value="Cheio">Tanque Cheio</option>
                      </select>
                    </div>

                    <div className="flex flex-col gap-2 justify-center sm:pl-4">
                      <label className="flex items-center gap-2.5 cursor-pointer font-semibold text-slate-700 dark:text-slate-350">
                        <input
                          type="checkbox"
                          checked={formServico.checklist?.riscos || false}
                          onChange={(e) => setFormServico({
                            ...formServico,
                            checklist: { ...(formServico.checklist || {}), riscos: e.target.checked }
                          })}
                          className="rounded text-indigo-600 w-4 h-4 border-slate-300 focus:ring-indigo-500"
                        />
                        <span>Pintura/Lataria Danificada (Riscos/Amassados)</span>
                      </label>

                      <label className="flex items-center gap-2.5 cursor-pointer font-semibold text-slate-700 dark:text-slate-350">
                        <input
                          type="checkbox"
                          checked={formServico.checklist?.luzPainel || false}
                          onChange={(e) => setFormServico({
                            ...formServico,
                            checklist: { ...(formServico.checklist || {}), luzPainel: e.target.checked }
                          })}
                          className="rounded text-indigo-600 w-4 h-4 border-slate-300 focus:ring-indigo-500"
                        />
                        <span>Luz de Alerta Acesa no Painel</span>
                      </label>
                    </div>
                  </div>

                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 border-t border-slate-200/50 pt-2.5">
                    <label className="flex items-center gap-2.5 cursor-pointer font-semibold text-slate-700 dark:text-slate-350">
                      <input
                        type="checkbox"
                        checked={formServico.checklist?.estepe || false}
                        onChange={(e) => setFormServico({
                          ...formServico,
                          checklist: { ...(formServico.checklist || {}), estepe: e.target.checked }
                        })}
                        className="rounded text-indigo-600 w-4 h-4 border-slate-300 focus:ring-indigo-500"
                      />
                      <span>Estepe, Macaco e Triângulo Presentes</span>
                    </label>

                    <label className="flex items-center gap-2.5 cursor-pointer font-semibold text-slate-700 dark:text-slate-350">
                      <input
                        type="checkbox"
                        checked={formServico.checklist?.documento || false}
                        onChange={(e) => setFormServico({
                          ...formServico,
                          checklist: { ...(formServico.checklist || {}), documento: e.target.checked }
                        })}
                        className="rounded text-indigo-600 w-4 h-4 border-slate-300 focus:ring-indigo-500"
                      />
                      <span>Documentação Retida com o Veículo</span>
                    </label>
                  </div>
                </div>

                {/* Dynamic Part Associations */}
                <div className="border border-slate-200/80 rounded-2xl p-4 bg-slate-50 space-y-3">
                  <div className="flex items-center justify-between">
                    <span className="font-bold text-slate-800 block text-[11.5px] uppercase tracking-wider">Peças Requisitadas do Almoxarifado</span>
                    {(pecaSearchForm || pecaCategoryForm !== 'todos') && (
                      <span className="text-[9px] text-indigo-600 font-bold bg-indigo-50 px-2 py-0.5 rounded-full border border-indigo-100">
                        Filtros de Peças Ativos
                      </span>
                    )}
                  </div>

                  {/* Inline Catalog Filters */}
                  <div className="grid grid-cols-2 gap-2 bg-slate-100/60 p-2.5 rounded-xl border border-slate-200/40">
                    <div className="space-y-1">
                      <label className="text-[9px] text-slate-550 font-bold block uppercase tracking-wide">🔍 Buscar por Nome/Código</label>
                      <input 
                        type="text"
                        placeholder="Nome da peça ou código..."
                        value={pecaSearchForm}
                        onChange={(e) => setPecaSearchForm(e.target.value)}
                        className="w-full bg-white border border-slate-200 focus:border-indigo-500 rounded-lg px-2 py-1 text-[10.5px] outline-none font-medium placeholder:font-normal"
                      />
                    </div>
                    <div className="space-y-1">
                      <label className="text-[9px] text-slate-550 font-bold block uppercase tracking-wide">📁 Categoria Geral</label>
                      <select 
                        value={pecaCategoryForm}
                        onChange={(e) => setPecaCategoryForm(e.target.value)}
                        className="w-full bg-white border border-slate-200 rounded-lg p-1 text-[10.5px] outline-none text-slate-700 font-medium"
                      >
                        <option value="todos">Todas Categorias</option>
                        {Array.from(new Set(pecas.map(p => p.categoria).filter(Boolean))).map(cat => (
                          <option key={cat} value={cat}>{cat}</option>
                        ))}
                      </select>
                    </div>
                  </div>
                  
                  <div className="flex flex-wrap items-end gap-3 bg-white p-3 rounded-xl border border-slate-100">
                    <div className="flex-1 min-w-[200px] space-y-1">
                      <div className="flex items-center justify-between">
                        <label className="text-[10px] text-slate-400 font-bold block">Escolher Peça do Catálogo</label>
                        {(pecaSearchForm || pecaCategoryForm !== 'todos') && (
                          <span className="text-[9px] text-indigo-600 font-bold font-mono">
                            {pecas.filter(p => {
                              const matchesCat = pecaCategoryForm === 'todos' || p.categoria === pecaCategoryForm;
                              const matchesSearch = !pecaSearchForm || 
                                p.nome.toLowerCase().includes(pecaSearchForm.toLowerCase()) || 
                                p.codigo.toLowerCase().includes(pecaSearchForm.toLowerCase());
                              return matchesCat && matchesSearch;
                            }).length} itens encontrados
                          </span>
                        )}
                      </div>
                      <select 
                        value={tempPecaId}
                        onChange={(e) => setTempPecaId(e.target.value)}
                        className="w-full bg-slate-50 border border-slate-200 rounded-lg p-1.5 text-xs outline-none font-medium text-slate-700"
                      >
                        <option value="">Selecione para incluir...</option>
                        {pecas.filter(p => {
                          const matchesCat = pecaCategoryForm === 'todos' || p.categoria === pecaCategoryForm;
                          const matchesSearch = !pecaSearchForm || 
                            p.nome.toLowerCase().includes(pecaSearchForm.toLowerCase()) || 
                            p.codigo.toLowerCase().includes(pecaSearchForm.toLowerCase());
                          return matchesCat && matchesSearch;
                        }).map(p => (
                          <option key={p.id} value={p.id}>{p.nome} {p.categoria ? `[${p.categoria}]` : ''} (Ref: {p.codigo}) - {formatCurrency(p.preco_venda)} [Qtd: {p.quantidade}]</option>
                        ))}
                      </select>
                    </div>

                    <div className="w-20 space-y-1">
                      <label className="text-[10px] text-slate-400 font-bold block">Qtd</label>
                      <input 
                        type="number" 
                        min="1"
                        value={tempPecaQtd}
                        onChange={(e) => setTempPecaQtd(Number(e.target.value))}
                        className="w-full bg-slate-50 border border-slate-200 rounded-lg p-1.5 text-center text-xs outline-none"
                      />
                    </div>

                    <button 
                      type="button"
                      onClick={handleAddPecaToServico}
                      className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold p-2 px-3 text-xs rounded-lg flex items-center gap-1 shrink-0 h-9"
                    >
                      <Plus className="w-4 h-4" /> Incluir
                    </button>
                  </div>

                  {/* Association list */}
                  <div className="space-y-1.5 max-h-40 overflow-y-auto">
                    {formPecasUsadas.length === 0 ? (
                      <span className="text-slate-400 font-normal italic block text-center py-2">Nenhuma peça adicionada a este orçamento ainda.</span>
                    ) : (
                      formPecasUsadas.map((pu, idx) => (
                        <div key={idx} className="bg-white p-2 px-3 rounded-xl border border-slate-150 flex items-center justify-between text-xs font-mono">
                          <div className="flex items-center gap-2">
                            <span className="bg-slate-100 text-[10px] text-slate-700 font-bold px-1.5 py-0.5 rounded">
                              {pu.quantidade}x
                            </span>
                            <span className="font-bold text-slate-800 text-[11px]">{pu.nome}</span>
                          </div>
                          
                          <div className="flex items-center gap-3">
                            <span className="text-slate-500">Vol: {formatCurrency(pu.preco_venda * pu.quantidade)}</span>
                            <button 
                              type="button" 
                              onClick={() => handleRemovePecaFromServico(idx)}
                              className="text-rose-500 hover:text-rose-700 p-1 rounded"
                            >
                              <X className="w-3.5 h-3.5" />
                            </button>
                          </div>
                        </div>
                      ))
                    )}
                  </div>
                </div>

                {/* Computational live totals indicator */}
                <div className="col-span-full border-t border-slate-100 pt-3 flex items-center justify-between">
                  <div>
                    <span className="text-slate-400 text-[10px]">Cálculo em Tempo Real</span>
                    <span className="font-medium text-slate-800 block text-xs">Mão de Obra + Peças Adicionadas</span>
                  </div>
                  <div className="text-right">
                    <span className="text-slate-400 block text-[10px] font-bold">TOTAL INTEGRADO</span>
                    <span className="text-lg font-black text-indigo-700 font-mono">{formatCurrency(getFormTotal())}</span>
                  </div>
                </div>

                <div className="flex items-center justify-end gap-2 pt-2 text-xs">
                  <button type="button" onClick={() => setActiveModal(null)} className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-4 py-2 rounded-xl">
                    Cancelar
                  </button>
                  <button type="submit" className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-6 py-2.5 rounded-xl shadow-md flex items-center gap-2">
                    <CheckCircle2 className="w-4 h-4" />
                    <span>Salvar Ordem de Serviço</span>
                  </button>
                </div>
              </form>
            </motion.div>
          </div>
        )}

        {/* MODAL 5: DETALHES & IMPRESSÃO / RECIBO DE SERVIÇO */}
        {activeModal === 'visualizar_servico' && selectedServico && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 flex items-center justify-center p-2 sm:p-4 backdrop-blur-xs overflow-y-auto print:p-0">
            <motion.div 
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-xl p-5 sm:p-8 shadow-2xl border border-slate-200 space-y-6 print:absolute print:inset-0 print:shadow-none print:border-none print:w-full print:p-0 my-auto max-h-[calc(100vh-2rem)] sm:max-h-[90vh] overflow-y-auto"
              id="print_invoice_box"
            >
              
              {/* Receipt Header */}
              <div className="flex justify-between items-start border-b border-slate-200/80 pb-4 print:pb-6 print:border-slate-300">
                <div>
                  <h2 className="text-lg font-bold text-slate-900 font-sans tracking-tight">DESTAKCAR</h2>
                  <span className="text-xs text-slate-400 block mt-0.5">Sua oficina de confiança para manutenção e reparos</span>
                  <span className="text-[10px] text-indigo-600 font-bold uppercase tracking-wider block mt-1 font-mono">RECIBO DE ORDEM DE SERVIÇO</span>
                </div>
                <div className="text-right">
                  <span className="bg-slate-900 text-white text-[11px] font-bold font-mono px-3 py-1 rounded-xl block shadow-sm uppercase">O.S. #{selectedServico.id.substring(0, 8)}</span>
                  <span className="text-[10px] text-slate-400 block mt-1">Geração: {formatDate(selectedServico.criado_em)}</span>
                </div>
              </div>

              {/* Service information elements */}
              <div className="space-y-4">
                
                {/* Stepped Status Indicator */}
                <div className="print:hidden border border-slate-200/60 bg-slate-50/50 p-4 rounded-3xl space-y-3">
                  <div className="flex justify-between items-center">
                    <span className="text-[10px] text-slate-400 font-bold uppercase tracking-wider font-mono">Progresso do Serviço</span>
                    <div>
                      {selectedServico.status === 'orcamento' && <span className="text-[10px] sm:text-[11px] font-bold text-amber-600 bg-amber-50 px-2.5 py-0.5 rounded-full border border-amber-200/50">Aguardando Aprovação</span>}
                      {selectedServico.status === 'em_andamento' && <span className="text-[10px] sm:text-[11px] font-bold text-blue-600 bg-blue-50 px-2.5 py-0.5 rounded-full border border-blue-200/50">Em Manutenção</span>}
                      {selectedServico.status === 'aguardando_pecas' && <span className="text-[10px] sm:text-[11px] font-bold text-orange-600 bg-orange-50 px-2.5 py-0.5 rounded-full border border-orange-200/50">Aguardando Peças</span>}
                      {selectedServico.status === 'concluido' && <span className="text-[10px] sm:text-[11px] font-bold text-emerald-600 bg-emerald-50 px-2.5 py-0.5 rounded-full border border-emerald-200/50">Concluído & Pronto</span>}
                      {selectedServico.status === 'cancelado' && <span className="text-[10px] sm:text-[11px] font-bold text-rose-600 bg-rose-50 px-2.5 py-0.5 rounded-full border border-rose-200/50">O.S. Cancelada</span>}
                    </div>
                  </div>

                  {selectedServico.status === 'cancelado' ? (
                    <div className="bg-rose-50 border border-rose-100 text-rose-700 rounded-2xl p-3 flex items-center gap-2.5">
                      <AlertTriangle className="w-4 h-4 text-rose-600 shrink-0 animate-pulse" />
                      <div>
                        <p className="font-bold text-xs">Esta Ordem de Serviço foi Cancelada/Rejeitada</p>
                        <p className="text-[10px] text-rose-500/90 leading-normal">Os materiais não foram faturados e a execução está suspensa permanentemente.</p>
                      </div>
                    </div>
                  ) : (
                    <div className="relative flex items-center justify-between pt-2">
                      {/* Connecting background Line with nested progress fill bar */}
                      <div className="absolute top-[13px] left-8 right-8 h-1 bg-slate-200 rounded -z-0 overflow-hidden">
                        {/* Dynamic matching progress fill bar */}
                        <div 
                          className="h-full bg-indigo-600 rounded transition-all duration-500" 
                          style={{ 
                            width: 
                              selectedServico.status === 'orcamento' ? '0%' : 
                              selectedServico.status === 'concluido' ? '100%' : '50%' 
                          }} 
                        />
                      </div>

                      {/* Step 1: Orçamento */}
                      <div className="flex flex-col items-center gap-1 z-10">
                        <div className={`w-7 h-7 rounded-full flex items-center justify-center border font-bold text-xs shadow-xs transition-all duration-300 ${
                          selectedServico.status === 'orcamento' 
                            ? 'bg-amber-100 border-amber-500 text-amber-700 ring-4 ring-amber-500/10' 
                            : 'bg-indigo-600 border-indigo-600 text-white'
                        }`}>
                          {selectedServico.status === 'orcamento' ? '1' : '✓'}
                        </div>
                        <span className={`text-[9px] sm:text-[10px] font-bold ${
                          selectedServico.status === 'orcamento' ? 'text-amber-700' : 'text-slate-600'
                        }`}>Orçamento</span>
                      </div>

                      {/* Step 2: Execução / Aguardando */}
                      <div className="flex flex-col items-center gap-1 z-10">
                        <div className={`w-7 h-7 rounded-full flex items-center justify-center border font-bold text-xs shadow-xs transition-all duration-300 ${
                          selectedServico.status === 'orcamento'
                            ? 'bg-white border-slate-200 text-slate-400'
                            : selectedServico.status === 'concluido'
                              ? 'bg-indigo-600 border-indigo-600 text-white'
                              : selectedServico.status === 'aguardando_pecas'
                                ? 'bg-orange-100 border-orange-500 text-orange-700 ring-4 ring-orange-500/10'
                                : 'bg-blue-100 border-blue-500 text-blue-700 ring-4 ring-blue-500/10'
                        }`}>
                          {selectedServico.status === 'concluido' ? '✓' : '2'}
                        </div>
                        <span className={`text-[9px] sm:text-[10px] font-bold ${
                          selectedServico.status === 'orcamento'
                            ? 'text-slate-400'
                            : selectedServico.status === 'aguardando_pecas'
                              ? 'text-orange-700'
                              : selectedServico.status === 'concluido'
                                ? 'text-slate-600'
                                : 'text-blue-700'
                        }`}>
                          {selectedServico.status === 'aguardando_pecas' ? 'Aguard. Peças' : 'Em Execução'}
                        </span>
                      </div>

                      {/* Step 3: Concluido */}
                      <div className="flex flex-col items-center gap-1 z-10">
                        <div className={`w-7 h-7 rounded-full flex items-center justify-center border font-bold text-xs shadow-xs transition-all duration-300 ${
                          selectedServico.status === 'concluido'
                            ? 'bg-emerald-100 border-emerald-500 text-emerald-700 ring-4 ring-emerald-500/10'
                            : 'bg-white border-slate-200 text-slate-400'
                        }`}>
                          3
                        </div>
                        <span className={`text-[9px] sm:text-[10px] font-bold ${
                          selectedServico.status === 'concluido' ? 'text-emerald-700' : 'text-slate-400'
                        }`}>Concluído</span>
                      </div>
                    </div>
                  )}
                </div>

                {/* Modal quick status actions */}
                <div className="print:hidden border border-indigo-150/45 bg-indigo-50/15 p-3.5 rounded-3xl space-y-2">
                  <div className="flex items-center gap-1.5 text-[10px] font-extrabold text-indigo-700 uppercase tracking-widest pl-0.5">
                    <Wrench className="w-3.5 h-3.5 text-indigo-600" />
                    <span>Ações Rápidas de Status</span>
                  </div>
                  <div className="flex flex-wrap gap-1.5 pt-0.5">
                    <button
                      type="button"
                      onClick={() => {
                        handleUpdateStatus(selectedServico.id, 'orcamento');
                        setSelectedServico({ ...selectedServico, status: 'orcamento' });
                      }}
                      className={`flex-1 min-w-[90px] py-1.5 px-2 rounded-xl border text-[9.5px] font-bold uppercase transition-all duration-150 flex items-center justify-center gap-1 cursor-pointer active:scale-97 ${
                        selectedServico.status === 'orcamento'
                          ? 'bg-amber-100 border-amber-300 text-amber-850 font-extrabold ring-3 ring-amber-500/10'
                          : 'bg-white border-slate-200 text-slate-600 hover:bg-slate-50'
                      }`}
                    >
                      <span>Orçamento</span>
                    </button>
                    <button
                      type="button"
                      onClick={() => {
                        handleUpdateStatus(selectedServico.id, 'em_andamento');
                        setSelectedServico({ ...selectedServico, status: 'em_andamento' });
                      }}
                      className={`flex-1 min-w-[90px] py-1.5 px-2 rounded-xl border text-[9.5px] font-bold uppercase transition-all duration-150 flex items-center justify-center gap-1 cursor-pointer active:scale-97 ${
                        selectedServico.status === 'em_andamento'
                          ? 'bg-indigo-100 border-indigo-300 text-indigo-900 font-extrabold ring-3 ring-indigo-500/10'
                          : 'bg-indigo-600 border-indigo-700 text-white hover:bg-indigo-700 hover:border-indigo-800 font-extrabold shadow-xs hover:shadow-sm'
                      }`}
                    >
                      {selectedServico.status === 'em_andamento' && <span className="w-1.5 h-1.5 bg-indigo-600 rounded-full shrink-0 animate-ping"></span>}
                      <span>Iniciar</span>
                    </button>
                    <button
                      type="button"
                      onClick={() => {
                        handleUpdateStatus(selectedServico.id, 'aguardando_pecas');
                        setSelectedServico({ ...selectedServico, status: 'aguardando_pecas' });
                      }}
                      className={`flex-1 min-w-[90px] py-1.5 px-2 rounded-xl border text-[9.5px] font-bold uppercase transition-all duration-150 flex items-center justify-center gap-1 cursor-pointer active:scale-97 ${
                        selectedServico.status === 'aguardando_pecas'
                          ? 'bg-amber-100 border-amber-300 text-amber-900 font-extrabold ring-3 ring-amber-500/10'
                          : 'bg-white border-slate-200 text-slate-600 hover:bg-slate-50'
                      }`}
                    >
                      <span>Peças</span>
                    </button>
                    <button
                      type="button"
                      onClick={() => {
                        handleUpdateStatus(selectedServico.id, 'concluido');
                        setSelectedServico({ ...selectedServico, status: 'concluido' });
                      }}
                      className={`flex-1 min-w-[90px] py-1.5 px-2 rounded-xl border text-[9.5px] font-bold uppercase transition-all duration-150 flex items-center justify-center gap-1 cursor-pointer active:scale-97 ${
                        selectedServico.status === 'concluido'
                          ? 'bg-emerald-100 border-emerald-300 text-emerald-900 font-extrabold ring-3 ring-emerald-500/10'
                          : 'bg-white border-slate-200 text-slate-650 hover:bg-slate-50 hover:border-emerald-250 hover:text-emerald-800'
                      }`}
                    >
                      <span>✓ Concluir</span>
                    </button>
                    <button
                      type="button"
                      onClick={() => {
                        handleUpdateStatus(selectedServico.id, 'cancelado');
                        setSelectedServico({ ...selectedServico, status: 'cancelado' });
                      }}
                      className={`py-1.5 px-2.5 rounded-xl border text-[9.5px] font-bold uppercase transition-all duration-150 flex items-center justify-center gap-1 cursor-pointer active:scale-97 ${
                        selectedServico.status === 'cancelado'
                          ? 'bg-rose-100 border-rose-300 text-rose-800 font-extrabold ring-3 ring-rose-500/10'
                          : 'bg-white border-slate-200 text-rose-500 hover:bg-rose-50 hover:border-rose-200'
                      }`}
                      title="Cancelar Ordem de Serviço"
                    >
                      <span>Cancelar</span>
                    </button>
                  </div>
                </div>

                {/* Client / Car section details */}
                <div className="grid grid-cols-2 gap-4 text-xs print:grid-cols-2 print:gap-6 print:text-center">
                  <div className="bg-slate-50 border border-slate-100 p-3.5 rounded-2xl print:bg-slate-50/50 print:border-slate-300 print:flex print:flex-col print:items-center print:justify-center print:p-5">
                    <span className="text-[9px] text-slate-400 font-bold block uppercase mb-1 font-mono tracking-wider print:text-[10px] print:text-slate-500">Cliente</span>
                    <span className="font-extrabold text-slate-900 block print:text-sm print:font-black">{selectedServico.cliente_nome}</span>
                    {clientes.find(c => c.id === selectedServico.cliente_id)?.telefone && (
                      <span className="text-slate-500 block text-[10px] mt-0.5 print:text-xs">Contato: {clientes.find(c => c.id === selectedServico.cliente_id)?.telefone}</span>
                    )}
                  </div>

                  <div className="bg-slate-50 border border-slate-100 p-3.5 rounded-2xl print:bg-slate-50/50 print:border-slate-300 print:flex print:flex-col print:items-center print:justify-center print:p-5">
                    <span className="text-[9px] text-slate-400 font-bold block uppercase mb-1 font-mono tracking-wider print:text-[10px] print:text-slate-500">Veículo do Cliente</span>
                    <span className="font-extrabold text-slate-900 block print:text-sm print:font-black">{selectedServico.veiculo_modelo}</span>
                    <span className="text-indigo-600 block text-[10px] font-mono tracking-widest uppercase mt-0.5 font-bold print:text-xs print:text-indigo-700">PLACA: {selectedServico.veiculo_placa}</span>
                  </div>
                </div>

                {/* Diagnostics */}
                <div className="bg-slate-50 border border-slate-100 p-4 rounded-3xl text-xs space-y-1">
                  <span className="text-[9px] text-slate-400 font-bold block uppercase font-mono tracking-wider">Laudo / Descrição dos Trabalhos solicitados</span>
                  <p className="text-slate-700 leading-relaxed font-normal whitespace-pre-wrap">{selectedServico.descricao}</p>
                </div>

                {/* Vistoria Checklist Display */}
                <div className="bg-slate-50 border border-slate-100 p-4 rounded-3xl text-xs space-y-3 dark:bg-slate-900/40">
                  <span className="text-[9px] text-slate-400 font-bold block uppercase font-mono tracking-wider">Vistoria e Checklist de Entrada</span>
                  
                  <div className="grid grid-cols-2 sm:grid-cols-3 gap-2.5 text-[11px]">
                    <div className="flex items-center gap-1.5 font-medium text-slate-750">
                      <span className="w-1.5 h-1.5 rounded-full bg-indigo-500"></span>
                      <span>Combustível: <strong>{selectedServico.checklist?.combustivel || 'Não Informado'}</strong></span>
                    </div>

                    <div className="flex items-center gap-1.5 font-medium text-slate-750">
                      <div className={`w-3.5 h-3.5 rounded border flex items-center justify-center text-[8px] font-bold ${
                        selectedServico.checklist?.riscos ? 'bg-amber-100 border-amber-400 text-amber-700' : 'bg-slate-100 border-slate-300 text-slate-400'
                      }`}>
                        {selectedServico.checklist?.riscos ? '✓' : ' '}
                      </div>
                      <span>Pintura c/ Riscos</span>
                    </div>

                    <div className="flex items-center gap-1.5 font-medium text-slate-750">
                      <div className={`w-3.5 h-3.5 rounded border flex items-center justify-center text-[8px] font-bold ${
                        selectedServico.checklist?.luzPainel ? 'bg-rose-100 border-rose-400 text-rose-700' : 'bg-slate-100 border-slate-300 text-slate-400'
                      }`}>
                        {selectedServico.checklist?.luzPainel ? '✓' : ' '}
                      </div>
                      <span>Luz Painel Acesa</span>
                    </div>

                    <div className="flex items-center gap-1.5 font-medium text-slate-750">
                      <div className={`w-3.5 h-3.5 rounded border flex items-center justify-center text-[8px] font-bold ${
                        selectedServico.checklist?.estepe ? 'bg-emerald-100 border-emerald-400 text-emerald-700' : 'bg-slate-100 border-slate-300 text-slate-400'
                      }`}>
                        {selectedServico.checklist?.estepe ? '✓' : ' '}
                      </div>
                      <span>Estepe/Macaco Presentes</span>
                    </div>

                    <div className="flex items-center gap-1.5 font-medium text-slate-750">
                      <div className={`w-3.5 h-3.5 rounded border flex items-center justify-center text-[8px] font-bold ${
                        selectedServico.checklist?.documento ? 'bg-indigo-100 border-indigo-400 text-indigo-700' : 'bg-slate-100 border-slate-300 text-slate-400'
                      }`}>
                        {selectedServico.checklist?.documento ? '✓' : ' '}
                      </div>
                      <span>Docs com Veículo</span>
                    </div>
                  </div>
                </div>

                {/* List of associated parts used */}
                <div className="space-y-2">
                  <span className="text-[9px] text-slate-400 font-bold block uppercase font-mono tracking-wider">Detalhamento Financeiro (Peças & Horas de Trabalho)</span>
                  
                  <div className="border border-slate-200/80 rounded-2xl overflow-hidden shadow-inner">
                    <table className="w-full text-left text-xs border-collapse">
                      <thead>
                        <tr className="bg-slate-50 text-[10px] uppercase text-slate-400 font-bold border-b border-slate-200/80">
                          <th className="p-2 px-3">Item / Peça</th>
                          <th className="p-2 text-center">Preço Unit.</th>
                          <th className="p-2 text-center">Quant.</th>
                          <th className="p-2 text-right px-3">Subtotal</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-100 font-mono text-[11px] text-slate-700 font-medium">
                        
                        {/* Labor Row */}
                        <tr className="bg-white">
                          <td className="p-2 px-3 font-bold">Serviço de Mão de Obra do Mecânico</td>
                          <td className="p-2 text-center">-</td>
                          <td className="p-2 text-center">1</td>
                          <td className="p-2 text-right px-3 font-bold text-slate-900">{formatCurrency(selectedServico.mao_de_obra_valor)}</td>
                        </tr>

                        {/* Pieces parts mapped */}
                        {selectedServico.pecas_usadas?.map((pec, index) => (
                          <tr key={index} className="bg-white">
                            <td className="p-2 px-3 font-normal text-slate-600">{pec.nome}</td>
                            <td className="p-2 text-center">{formatCurrency(pec.preco_venda)}</td>
                            <td className="p-2 text-center">{pec.quantidade}</td>
                            <td className="p-2 text-right px-3 text-slate-900 font-bold">{formatCurrency(pec.preco_venda * pec.quantidade)}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>

                {/* Printable Totals panel */}
                <div className="bg-slate-900/85 backdrop-blur-xs text-white rounded-2xl p-4 sm:p-5 flex flex-col sm:flex-row justify-between items-center gap-3 sm:gap-4 border border-slate-800/50">
                  <div className="text-center sm:text-left w-full sm:w-auto">
                    <span className="text-[9px] sm:text-[10px] text-slate-400 block uppercase font-mono tracking-wider">STATUS DE QUITAÇÃO DA O.S.</span>
                    <span className="text-[11px] sm:text-xs font-bold uppercase tracking-wider block mt-0.5 text-indigo-200">
                      {selectedServico.status === 'concluido' ? '✓ Pago & Concluído' : 'Orçamento / Não finalizado'}
                    </span>
                  </div>
                  <div className="text-center sm:text-right w-full sm:w-auto border-t border-slate-800/60 pt-2.5 sm:pt-0 sm:border-t-0">
                    <span className="text-[9px] sm:text-[10px] text-slate-400 block uppercase font-mono tracking-wider">TOTAL DA O.S.</span>
                    <span className="text-lg sm:text-xl font-black font-mono tracking-tight text-emerald-400">{formatCurrency(selectedServico.total)}</span>
                  </div>
                </div>

                {/* Sign lines hidden in software, visible ONLY on print */}
                <div className="hidden print:grid grid-cols-2 gap-12 pt-16 text-center text-xs">
                  <div className="border-t border-slate-400/80 pt-2 font-medium">
                    <p className="font-bold text-slate-800">Assinatura do Autorizado</p>
                    <span className="text-[10px] text-slate-400 font-mono">DestakCar Workshop</span>
                  </div>
                  <div className="border-t border-slate-400/80 pt-2 font-medium">
                    <p className="font-bold text-slate-800">Assinatura Proprietário</p>
                    <span className="text-[10px] text-slate-400">{selectedServico.cliente_nome}</span>
                  </div>
                </div>

              </div>

              {/* print controls */}
              <div className="flex flex-col sm:flex-row sm:items-center justify-between pt-4 border-t border-slate-200/80 print:hidden gap-3 text-xs">
                <div className="flex flex-wrap items-center gap-2">
                  <button 
                    onClick={() => {
                      const clientObj = clientes.find(c => c.id === selectedServico.cliente_id);
                      const partsSum = selectedServico.pecas_usadas?.reduce((sum, p) => sum + (p.preco_venda * p.quantidade), 0) || 0;
                      const partsList = selectedServico.pecas_usadas?.map(p => `• _${p.nome}_ (x${p.quantidade}): R$ ${(p.preco_venda * p.quantidade).toFixed(2)}`).join('\n') || '• _Nenhuma peça_';
                      
                      const msg = `🚗 *Orçamento/O.S. Oficina DestakCar* 🚗\n\n*O.S. Código:* #${selectedServico.id.substring(0, 8).toUpperCase()}\n*Cliente:* ${selectedServico.cliente_nome}\n*Veículo:* ${selectedServico.veiculo_modelo} (Placa: *${selectedServico.veiculo_placa}*)\n\n🔧 *Serviços Solicitados:*\n_${selectedServico.descricao}_\n\n📦 *Peças Utilizadas:*\n${partsList}\n\n💳 *Detalhamento:*\n• Mão de Obra: R$ ${selectedServico.mao_de_obra_valor.toFixed(2)}\n• Total de Peças: R$ ${partsSum.toFixed(2)}\n\n💰 *VALOR TOTAL:* *R$ ${selectedServico.total.toFixed(2)}*\n\n_Qualquer dúvida, estamos à disposição para esclarecimentos. Obrigado pela preferência!_`;
                      
                      if (clientObj?.telefone) {
                        const sanitizedPhone = clientObj.telefone.replace(/\D/g, '');
                        window.open(`https://api.whatsapp.com/send?phone=55${sanitizedPhone}&text=${encodeURIComponent(msg)}`, '_blank');
                      } else {
                        navigator.clipboard.writeText(msg);
                        triggerToast("Resumo copiado! Cliente sem telefone cadastrado.");
                      }
                    }}
                    className="bg-emerald-600 hover:bg-emerald-700 text-white font-bold px-3 py-2 rounded-xl shadow-sm flex items-center gap-1.5 transition cursor-pointer"
                    title="Enviar orçamento formatado via WhatsApp"
                    id="btn_share_os_whatsapp"
                  >
                    <Share2 className="w-3.5 h-3.5" />
                    <span>WhatsApp</span>
                  </button>

                  <button 
                    onClick={() => {
                      const partsSum = selectedServico.pecas_usadas?.reduce((sum, p) => sum + (p.preco_venda * p.quantidade), 0) || 0;
                      const partsList = selectedServico.pecas_usadas?.map(p => `• ${p.nome} (x${p.quantidade}): R$ ${(p.preco_venda * p.quantidade).toFixed(2)}`).join('\n') || '• Nenhuma peça';
                      const text = `Orçamento DestakCar\nO.S. #${selectedServico.id.substring(0, 8).toUpperCase()}\nCliente: ${selectedServico.cliente_nome}\nVeículo: ${selectedServico.veiculo_modelo} (${selectedServico.veiculo_placa})\n\nLaudo/Trabalhos:\n${selectedServico.descricao}\n\nRelação de Peças:\n${partsList}\n\nValores:\n- Mão de Obra: R$ ${selectedServico.mao_de_obra_valor.toFixed(2)}\n- Total de Peças: R$ ${partsSum.toFixed(2)}\nTOTAL GERAL: R$ ${selectedServico.total.toFixed(2)}`;
                      navigator.clipboard.writeText(text);
                      triggerToast("Resumo copiado com sucesso!");
                    }}
                    className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-3 py-2 rounded-xl transition cursor-pointer flex items-center gap-1.5"
                    title="Copiar texto estruturado da O.S."
                    id="btn_copy_os_text"
                  >
                    <Copy className="w-3.5 h-3.5" />
                    <span>Copiar Texto</span>
                  </button>
                </div>

                <div className="flex items-center gap-1.5 ml-auto">
                  <button onClick={() => setActiveModal(null)} className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-3.5 py-2 rounded-xl transition cursor-pointer">
                    Fechar
                  </button>
                  <button 
                    onClick={async () => {
                      try {
                        const relatedCli = clientes.find(c => c.id === selectedServico.cliente_id);
                        const relatedVeic = veiculos.find(v => v.id === selectedServico.veiculo_id);
                        await downloadPDFOrdemServico(selectedServico, {
                          telefone: relatedCli?.telefone,
                          cpf_cnpj: relatedCli?.cpf_cnpj,
                          endereco: relatedCli?.endereco,
                          veiculoMarca: relatedVeic?.marca,
                          veiculoAno: relatedVeic?.ano,
                          veiculoCor: relatedVeic?.cor
                        });
                        triggerToast('Orçamento PDF baixado com sucesso!');
                      } catch (err: any) {
                        console.error('Erro ao gerar PDF:', err);
                        triggerToast('Erro ao exportar PDF.');
                      }
                    }} 
                    className="bg-emerald-600 hover:bg-emerald-700 text-white font-bold px-3.5 py-2 rounded-xl shadow-md flex items-center gap-1.5 transition cursor-pointer"
                    id="btn_download_os_pdf"
                  >
                    <FileText className="w-3.5 h-3.5" />
                    <span className="hidden sm:inline">Baixar PDF</span>
                  </button>
                  <button onClick={handlePrintService} className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-3.5 py-2 rounded-xl shadow-md flex items-center gap-1.5 transition cursor-pointer">
                    <Printer className="w-3.5 h-3.5" />
                    <span className="hidden sm:inline">Imprimir</span>
                  </button>
                </div>
              </div>

            </motion.div>
          </div>
        )}

        {/* MODAL DE CONFIRMAÇÃO PERSONALIZADO */}
        {confirmDialog && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 flex items-center justify-center p-4 backdrop-blur-xs">
            <motion.div 
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-sm p-6 shadow-2xl border border-slate-200/80 space-y-4"
              id="custom_confirm_dialog"
            >
              <div className="flex items-center gap-3 text-rose-600">
                <div className="p-2.5 bg-rose-50 rounded-xl">
                  <Trash2 className="w-6 h-6" />
                </div>
                <h3 className="text-base font-bold text-slate-900">{confirmDialog.title}</h3>
              </div>
              
              <p className="text-xs text-slate-500 leading-relaxed font-normal">
                {confirmDialog.message}
              </p>

              <div className="flex items-center justify-end gap-2.5 pt-2 text-xs">
                <button 
                  type="button" 
                  onClick={() => setConfirmDialog(null)} 
                  className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-4 py-2.5 rounded-xl transition"
                >
                  Cancelar
                </button>
                <button 
                  type="button" 
                  onClick={() => {
                    confirmDialog.onConfirm();
                  }} 
                  className="bg-rose-600 hover:bg-rose-700 text-white font-bold px-5 py-2.5 rounded-xl shadow-md shadow-rose-100 transition"
                  id="confirm_modal_btn"
                >
                  {confirmDialog.confirmText || 'Confirmar'}
                </button>
              </div>
            </motion.div>
          </div>
        )}

        {/* MODAL DE PRÉ-VISUALIZAÇÃO DE IMPRESSÃO DO RELATÓRIO DO CONSOLIDADO */}
        {reportPrintMode && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 overflow-y-auto p-4 md:p-8 backdrop-blur-xs flex items-start justify-center print:bg-white print:p-0 print:block" id="report_print_preview_modal">
            <motion.div
              initial={{ scale: 0.98, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.98, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-4xl p-8 shadow-2xl border border-slate-200 space-y-6 print:absolute print:inset-0 print:shadow-none print:border-none print:w-full print:p-0 my-6 animate-fade-in"
            >
              {/* Receipt Header */}
              <div className="flex justify-between items-start border-b border-slate-200 pb-5 print:pb-6 print:border-slate-300">
                <div>
                  <h2 className="text-xl font-black text-slate-900 font-sans tracking-tight">DESTAKCAR</h2>
                  <span className="text-xs text-slate-400 block mt-0.5 font-sans">Sua oficina de confiança para manutenção e reparos</span>
                  <span className="text-[10px] text-indigo-600 font-bold uppercase tracking-wider block mt-1 font-mono">RELATÓRIO CONSOLIDADO DE VENDAS E SERVIÇOS</span>
                </div>
                <div className="text-right text-xs">
                  <span className="text-slate-400 font-medium block font-sans">Emissão</span>
                  <span className="font-bold text-slate-800 font-mono">{new Date().toLocaleString('pt-BR')}</span>
                  <span className="text-[10px] text-indigo-600 font-bold block uppercase font-mono tracking-widest mt-1">SISTEMA WORKSHOP SUITE</span>
                </div>
              </div>

              {/* Applied Filters Metadata box */}
              <div className="bg-slate-50 border border-slate-100 p-4 rounded-2xl grid grid-cols-1 md:grid-cols-3 gap-4 text-xs font-sans print:bg-slate-50">
                <div>
                  <span className="text-[9px] text-slate-400 font-bold block uppercase mb-0.5 font-mono tracking-wider font-sans">Período de Análise</span>
                  <span className="font-bold text-slate-800">
                    {reportStartDate ? new Date(reportStartDate + 'T00:00:00').toLocaleDateString('pt-BR') : 'Início'} a {reportEndDate ? new Date(reportEndDate + 'T00:00:00').toLocaleDateString('pt-BR') : 'Fim'}
                  </span>
                </div>
                <div>
                  <span className="text-[9px] text-slate-400 font-bold block uppercase mb-0.5 font-mono tracking-wider font-sans">Filtro de Cliente</span>
                  <span className="font-bold text-slate-800">
                    {reportClienteId === 'todos' ? 'Todos os Clientes' : clientes.find(c => c.id === reportClienteId)?.nome || 'Cliente Selecionado'}
                  </span>
                </div>
                <div>
                  <span className="text-[9px] text-slate-400 font-bold block uppercase mb-0.5 font-mono tracking-wider font-sans">Filtro de Status / Palavra-chave</span>
                  <span className="font-bold text-slate-800 uppercase font-sans">
                    {reportStatus === 'todos' ? 'Todos os Status' : reportStatus} 
                    {reportKeyword ? ` / "${reportKeyword}"` : ''}
                  </span>
                </div>
              </div>

              {/* Statistics KPIs */}
              <div className="grid grid-cols-4 gap-4 text-xs">
                <div className="bg-slate-50 border border-slate-100 p-3.5 rounded-2xl text-center print:bg-white print:border-slate-350">
                  <span className="text-[9px] text-slate-400 font-bold block uppercase mb-0.5 font-mono">Total de O.S.</span>
                  <span className="text-lg font-black text-slate-900 font-mono">{getFilteredReports().length}</span>
                </div>
                <div className="bg-slate-50 border border-slate-100 p-3.5 rounded-2xl text-center print:bg-white print:border-slate-350">
                  <span className="text-[9px] text-slate-400 font-bold block uppercase mb-0.5 font-mono">Faturamento M.O.</span>
                  <span className="text-lg font-black text-slate-900 font-mono">
                    {formatCurrency(getFilteredReports().reduce((sum, s) => sum + (s.mao_de_obra_valor || 0), 0))}
                  </span>
                </div>
                <div className="bg-slate-50 border border-slate-100 p-3.5 rounded-2xl text-center print:bg-white print:border-slate-350">
                  <span className="text-[9px] text-slate-400 font-bold block uppercase mb-0.5 font-mono">Venda de Peças</span>
                  <span className="text-lg font-black text-slate-900 font-mono">
                    {formatCurrency(getFilteredReports().reduce((sum, s) => {
                      const sumP = s.pecas_usadas?.reduce((su, p) => su + (p.preco_venda * p.quantidade), 0) || 0;
                      return sum + sumP;
                    }, 0))}
                  </span>
                </div>
                <div className="bg-slate-950 text-white p-3.5 rounded-2xl text-center print:bg-white print:text-black print:border print:border-slate-400">
                  <span className="text-[9px] text-slate-300 font-bold block uppercase mb-0.5 font-mono print:text-slate-400">Receita Total</span>
                  <span className="text-lg font-black font-mono">
                    {formatCurrency(getFilteredReports().reduce((sum, s) => sum + (s.total || 0), 0))}
                  </span>
                </div>
              </div>

              {/* Table details for printing */}
              <div className="space-y-2">
                <span className="text-[9px] text-slate-400 font-bold block uppercase font-mono tracking-wider font-sans">Relação Consolidada dos Registros</span>
                <div className="border border-slate-200 rounded-2xl overflow-hidden shadow-inner print:rounded-none">
                  <table className="w-full text-left text-[10px] border-collapse print:text-[8px]">
                    <thead>
                      <tr className="bg-slate-50 text-[9px] uppercase text-slate-400 font-bold border-b border-slate-200">
                        <th className="p-2.5 pl-4 font-sans">Código</th>
                        <th className="p-2.5 font-sans">Cliente</th>
                        <th className="p-2.5 font-sans">Modelo / Placa</th>
                        <th className="p-2.5 font-sans">Abertura</th>
                        <th className="p-2.5 font-sans">Status</th>
                        <th className="p-2.5 text-right font-sans">Mão de Obra</th>
                        <th className="p-2.5 text-right font-sans">Peças</th>
                        <th className="p-2.5 text-right pr-4 font-sans font-sans">Total Geral</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-slate-150 font-medium text-slate-700">
                      {getFilteredReports().length === 0 ? (
                        <tr>
                          <td colSpan={8} className="p-6 text-center text-slate-450 font-sans">Nenhum registro para exibir neste relatório.</td>
                        </tr>
                      ) : (
                        getFilteredReports().map((s) => {
                          const sPartsVal = s.pecas_usadas?.reduce((sum, p) => sum + (p.preco_venda * p.quantidade), 0) || 0;
                          const statusLabels: Record<string, string> = {
                            orcamento: 'Orcamento',
                            em_andamento: 'Em Execucao',
                            aguardando_pecas: 'Aguard. Pecas',
                            concluido: 'Concluido',
                            cancelado: 'Cancelado'
                          };
                          return (
                            <tr key={s.id} className="bg-white">
                              <td className="p-2 pl-4 font-mono font-bold text-slate-900">#{s.id.substring(0, 8).toUpperCase()}</td>
                              <td className="p-2 font-bold text-slate-800 font-sans">{s.cliente_nome}</td>
                              <td className="p-2 font-sans">
                                <span className="block">{s.veiculo_modelo}</span>
                                <span className="text-[8px] text-indigo-600 font-mono font-bold uppercase">{s.veiculo_placa}</span>
                              </td>
                              <td className="p-2 font-mono">{s.criado_em ? new Date(s.criado_em).toLocaleDateString('pt-BR') : ''}</td>
                              <td className="p-2 uppercase font-mono text-[8px] font-bold">{statusLabels[s.status] || s.status}</td>
                              <td className="p-2 text-right font-mono text-slate-600 font-medium">{formatCurrency(s.mao_de_obra_valor)}</td>
                              <td className="p-2 text-right font-mono text-slate-600 font-medium">{formatCurrency(sPartsVal)}</td>
                              <td className="p-2 text-right font-mono text-slate-900 font-bold pr-4">{formatCurrency(s.total)}</td>
                            </tr>
                          );
                        })
                      )}
                    </tbody>
                  </table>
                </div>
              </div>

              {/* Printing Controls and bottom metadata */}
              <div className="flex items-center justify-between pt-4 border-t border-slate-200 print:hidden text-xs">
                <span className="text-slate-400 font-medium font-sans">Esta janela mostra exatamente como ficará a folha impressa (A4) ou documento PDF.</span>
                <div className="flex items-center gap-2">
                  <button onClick={() => setReportPrintMode(false)} className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-4 py-2.5 rounded-xl transition font-sans">
                    Fechar Pré-Visualização
                  </button>
                  <button onClick={() => {
                    try {
                      window.print();
                    } catch (e) {
                      triggerToast("Impressora bloqueada!");
                    }
                  }} className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-5 py-2.5 rounded-xl shadow-md flex items-center gap-1.5 transition shadow-indigo-100 font-sans">
                    <Printer className="w-4 h-4" />
                    <span>Realizar Impressão</span>
                  </button>
                </div>
              </div>
            </motion.div>
          </div>
        )}

        {/* MODAL 6: ALERTAS DE REVISÃO FORM */}
        {activeModal === 'alerta_revisao' && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 flex items-center justify-center p-2 sm:p-4 backdrop-blur-xs overflow-y-auto">
            <motion.div 
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-lg p-5 sm:p-6 shadow-2xl border border-slate-200/80 space-y-4 my-auto max-h-[calc(100vh-2rem)] sm:max-h-[90vh] overflow-y-auto"
              id="alerta_revisao_modal_form"
            >
              <div className="flex items-center justify-between">
                <h3 className="text-base font-bold text-slate-900">
                  {modalMode === 'criar' ? 'Agendar Próxima Manutenção' : 'Editar Alerta de Revisão'}
                </h3>
                <button onClick={() => setActiveModal(null)} className="p-1 hover:bg-slate-100 rounded-lg text-slate-400 hover:text-slate-700">
                  <X className="w-5 h-5" />
                </button>
              </div>

              <form onSubmit={handleSaveAlerta} className="space-y-4 text-xs font-sans">
                
                {/* Cliente Selector */}
                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Cliente / Dono do Veículo *</label>
                  <select 
                    value={formAlerta.cliente_id}
                    onChange={(e) => {
                      const cid = e.target.value;
                      // Dynamically filter matching vehicles and pick the first one
                      const matched = veiculos.filter(v => v.cliente_id === cid);
                      setFormAlerta({ 
                        ...formAlerta, 
                        cliente_id: cid,
                        veiculo_id: matched[0]?.id || '' 
                      });
                    }}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none text-xs"
                    required
                  >
                    <option value="" disabled>Selecione o Cliente...</option>
                    {clientes.map(c => (
                      <option key={c.id} value={c.id}>{c.nome}</option>
                    ))}
                  </select>
                </div>

                {/* Veículo Selector (FILTERED BY THE SELECTED CLIENT!) */}
                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Veículo Relacionado *</label>
                  <select 
                    value={formAlerta.veiculo_id}
                    onChange={(e) => setFormAlerta({ ...formAlerta, veiculo_id: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none text-xs"
                    disabled={!formAlerta.cliente_id}
                    required
                  >
                    {!formAlerta.cliente_id ? (
                      <option value="">Selecione um cliente primeiro...</option>
                    ) : (
                      <>
                        <option value="" disabled>Selecione o Veículos...</option>
                        {veiculos.filter(v => v.cliente_id === formAlerta.cliente_id).map(v => (
                          <option key={v.id} value={v.id}>{v.marca} {v.modelo} (Placa: {v.placa})</option>
                        ))}
                        {veiculos.filter(v => v.cliente_id === formAlerta.cliente_id).length === 0 && (
                          <option value="" disabled>Nenhum veículo cadastrado para este cliente!</option>
                        )}
                      </>
                    )}
                  </select>
                </div>

                {/* Tipo de Revisão Selector */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">Tipo de Manutenção *</label>
                    <input 
                      type="text"
                      list="revisoes_sugestivas"
                      placeholder="Ex: Troca de Óleo de Motor"
                      value={formAlerta.tipo_revisao}
                      onChange={(e) => setFormAlerta({ ...formAlerta, tipo_revisao: e.target.value })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none text-xs"
                      required
                    />
                    <datalist id="revisoes_sugestivas">
                      <option value="Troca de Óleo e Filtros" />
                      <option value="Revisão de Freios Dianteiro/Traseiro" />
                      <option value="Substituição da Correia Dentada" />
                      <option value="Geometria, Alinhamento e Balanceamento" />
                      <option value="Revisão Geral Preventiva (Suspensão e Motor)" />
                      <option value="Troca do Fluido de Arrefecimento" />
                      <option value="Substituição de Velas e Cabos" />
                    </datalist>
                  </div>

                  {/* Odômetro Meta */}
                  <div className="space-y-1">
                    <label className="font-bold text-slate-600 block">KM Limite (Opcional)</label>
                    <input 
                      type="number" 
                      placeholder="Ex: 50000"
                      value={formAlerta.km_alerta || ''}
                      onChange={(e) => setFormAlerta({ ...formAlerta, km_alerta: e.target.value })}
                      className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-1.5 outline-none font-mono text-xs"
                    />
                  </div>
                </div>

                {/* Data Limite */}
                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Data Limite da Revisão *</label>
                  <input 
                    type="date"
                    value={formAlerta.data_alerta}
                    onChange={(e) => setFormAlerta({ ...formAlerta, data_alerta: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-1.5 outline-none font-mono text-xs"
                    required
                  />
                </div>

                {/* Descrição / Observações */}
                <div className="space-y-1">
                  <label className="font-bold text-slate-600 block">Recomendações e Descrição do Alerta</label>
                  <textarea 
                    rows={2}
                    placeholder="Descrição sobre peças envolvidas ou avisos adicionais..."
                    value={formAlerta.descricao}
                    onChange={(e) => setFormAlerta({ ...formAlerta, descricao: e.target.value })}
                    className="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-xl px-3 py-2 outline-none text-xs"
                  />
                </div>

                {/* Actions bottom */}
                <div className="flex items-center justify-end gap-2 pt-2">
                  <button 
                    type="button" 
                    onClick={() => setActiveModal(null)} 
                    className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-4 py-2 rounded-xl transition cursor-pointer"
                  >
                    Cancelar
                  </button>
                  <button 
                    type="submit" 
                    className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-5 py-2 rounded-xl shadow-md cursor-pointer transition"
                  >
                    Agendar Alerta
                  </button>
                </div>
              </form>
            </motion.div>
          </div>
        )}

        {/* MODAL 7: WHATSAPP NOTIFIER PREVIEW DISPATCHER */}
        {notifyingAlerta && (
          <div className="fixed inset-0 bg-slate-900/60 z-50 flex items-center justify-center p-2 sm:p-4 backdrop-blur-xs overflow-y-auto">
            <motion.div 
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="bg-white rounded-3xl w-full max-w-md p-5 sm:p-6 shadow-2xl border border-slate-200 space-y-4 my-auto max-h-[calc(100vh-2rem)] sm:max-h-[90vh] overflow-y-auto"
              id="whatsapp_notification_modal"
            >
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <div className="bg-emerald-100 text-emerald-700 p-1 rounded-lg">
                    <MessageSquare className="w-5 h-5 shrink-0" />
                  </div>
                  <h3 className="text-sm font-extrabold text-slate-900">Visualizar Notificação WhatsApp</h3>
                </div>
                <button onClick={() => setNotifyingAlerta(null)} className="p-1 hover:bg-slate-100 rounded-lg text-slate-400 hover:text-slate-700">
                  <X className="w-5 h-5" />
                </button>
              </div>

              <div className="space-y-4 font-sans text-xs">
                <p className="text-slate-500 text-[11px] leading-relaxed">
                  Para uma melhor comunicação, preparamos um modelo de mensagem exclusivo adaptado para os dados do veículo do seu cliente. Clique em Enviar para disparar ou marque como enviado.
                </p>

                {/* Pseudo-phone bubble container */}
                <div className="bg-[#efeae2] border border-slate-200 rounded-2xl p-4.5 space-y-2 relative overflow-hidden">
                  <div className="absolute top-0 left-0 right-0 h-1 bg-emerald-600" />
                  <div className="bg-white rounded-xl rounded-tl-none p-3 shadow-xs max-w-[90%] text-slate-800 leading-relaxed relative border border-slate-100 font-medium">
                    <p className="whitespace-pre-line font-medium leading-relaxed text-[11.5px] text-slate-700">
                      {`Olá, *${clientes.find(c => c.id === notifyingAlerta.cliente_id)?.nome || 'Cliente'}*! Aqui é da *Oficina Destakcar* 🚗\n\nLembramos que está na hora de realizar a manutenção preventiva de *${notifyingAlerta.tipo_revisao}* do seu veículo *${
                        veiculos.find(v => v.id === notifyingAlerta.veiculo_id) 
                          ? `${veiculos.find(v => v.id === notifyingAlerta.veiculo_id)?.marca} ${veiculos.find(v => v.id === notifyingAlerta.veiculo_id)?.modelo} (Placa: ${veiculos.find(v => v.id === notifyingAlerta.veiculo_id)?.placa})`
                          : 'cadastrado'
                      }*.\n\n📅 *Data Prevista:* ${new Date(notifyingAlerta.data_alerta + 'T12:00:00').toLocaleDateString('pt-BR')} ${notifyingAlerta.km_alerta ? `\n🛣️ *KM Limite:* ${Number(notifyingAlerta.km_alerta).toLocaleString('pt-BR')} KM` : ''}\n\nA revisão preventiva evita quebras inesperadas, mantendo a valorização do seu automóvel. Vamos agendar para qual dia e horário esta semana?\n\nFicamos no seu aguardo! 😊`}
                    </p>
                    <span className="text-[9px] text-slate-400 font-mono text-right block mt-1.5 font-semibold">10:42 ✓✓</span>
                  </div>
                </div>

                {/* Buttons block */}
                <div className="flex flex-col sm:flex-row gap-2 pt-2 sm:justify-end">
                  <button 
                    type="button" 
                    onClick={() => setNotifyingAlerta(null)} 
                    className="bg-slate-100 hover:bg-slate-200 text-slate-700 font-extrabold px-4 py-2.5 rounded-xl transition cursor-pointer order-last sm:order-first"
                  >
                    Fechar
                  </button>
                  <button 
                    type="button"
                    onClick={() => confirmNotificationSent(notifyingAlerta.id)}
                    className="bg-slate-900 hover:bg-indigo-950 text-white font-extrabold px-4 py-2.5 rounded-xl transition cursor-pointer text-center"
                  >
                    Apenas Marcar como Notificado
                  </button>
                  <button 
                    type="button"
                    onClick={() => {
                      const clientObj = clientes.find(c => c.id === notifyingAlerta.cliente_id);
                      if (clientObj?.telefone) {
                        const sanitizedPhone = clientObj.telefone.replace(/\D/g, '');
                        const msg = `Olá, *${clientObj.nome}*! Aqui é da *Oficina Destakcar* 🚗\n\nLembramos que está na hora de realizar a manutenção preventiva de *${notifyingAlerta.tipo_revisao}* do seu veículo *${
                          veiculos.find(v => v.id === notifyingAlerta.veiculo_id) 
                            ? `${veiculos.find(v => v.id === notifyingAlerta.veiculo_id)?.marca} ${veiculos.find(v => v.id === notifyingAlerta.veiculo_id)?.modelo} (Placa: ${veiculos.find(v => v.id === notifyingAlerta.veiculo_id)?.placa})`
                            : 'cadastrado'
                        }*.\n\n📅 *Data Prevista:* ${new Date(notifyingAlerta.data_alerta + 'T12:00:00').toLocaleDateString('pt-BR')}${notifyingAlerta.km_alerta ? `\n🛣️ *KM Limite:* ${Number(notifyingAlerta.km_alerta).toLocaleString('pt-BR')} KM` : ''}\n\nA revisão preventiva evita quebras inesperadas. Vamos agendar para qual dia e horário esta semana?`;
                        
                        window.open(`https://api.whatsapp.com/send?phone=55${sanitizedPhone}&text=${encodeURIComponent(msg)}`, '_blank');
                      } else {
                        triggerToast("Cliente não possui telefone cadastrado!");
                      }
                      confirmNotificationSent(notifyingAlerta.id);
                    }}
                    className="bg-emerald-605 hover:bg-emerald-700 text-white font-extrabold px-4 py-2.5 rounded-xl transition cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <Share2 className="w-4 h-4" />
                    <span>Abrir & Enviar no WhatsApp</span>
                  </button>
                </div>
              </div>
            </motion.div>
          </div>
        )}

      </AnimatePresence>

      {/* BARRA DE NAVEGAÇÃO INFERIOR PARA DISPOSITIVOS MÓVEIS */}
      <div className="fixed bottom-0 left-0 right-0 z-40 bg-white/95 border-t border-slate-200/85 backdrop-blur-md shadow-[0_-8px_30px_rgb(0,0,0,0.06)] px-2 py-1.5 pb-safe lg:hidden print:hidden" id="mobile_bottom_nav">
        {/* Click shield backer to close "Mais" folder */}
        {mobileMoreOpen && (
          <div 
            className="fixed inset-0 bg-slate-900/5 z-30 transition-opacity" 
            onClick={() => setMobileMoreOpen(false)}
          />
        )}

        <div className="max-w-md mx-auto flex items-center justify-around relative">
          
          {/* Popover Menu for "Mais" Options */}
          <AnimatePresence>
            {mobileMoreOpen && (
              <motion.div
                initial={{ opacity: 0, y: 15, scale: 0.95 }}
                animate={{ opacity: 1, y: 0, scale: 1 }}
                exit={{ opacity: 0, y: 10, scale: 0.95 }}
                className="absolute bottom-16 right-4 w-52 bg-white rounded-2xl border border-slate-200/95 p-2.5 shadow-2xl z-40 space-y-1"
                id="mobile_more_popover"
              >
                <div className="px-3 py-1 text-[10px] uppercase tracking-wider font-extrabold text-slate-400 font-sans border-b border-slate-100 mb-1">
                  Mais Opções
                </div>
                             <button
                               onClick={() => {
                                 if (currentUser?.funcao === 'Mecânico') {
                                   triggerToast("Acesso Negado: O módulo de 'Relatórios Financeiros' é de uso exclusivo de Administradores e Supervisores.");
                                   return;
                                 }
                                 setActiveTab('relatorios');
                                 setSearchQuery('');
                                 setMobileMoreOpen(false);
                               }}
                               className={`w-full flex items-center gap-2.5 px-3 py-2 rounded-xl text-left text-xs font-semibold tracking-tight transition ${
                                 currentUser?.funcao === 'Mecânico'
                                   ? 'opacity-50 text-slate-400 cursor-not-allowed'
                                   : activeTab === 'relatorios'
                                     ? 'bg-indigo-50 text-indigo-700 font-bold'
                                     : 'text-slate-700 hover:bg-slate-50'
                               }`}
                             >
                               <BarChart3 className="w-4 h-4 text-indigo-600" />
                               <span>Relatórios Gerenciais</span>
                               {currentUser?.funcao === 'Mecânico' && <Lock className="w-3.5 h-3.5 ml-auto text-slate-450" />}
                             </button>
                <button
                  onClick={() => {
                    if (currentUser?.funcao === 'Mecânico') {
                      triggerToast("Acesso Negado: O módulo de 'Alertas de Revisão' é de uso exclusivo de Administradores e Supervisores.");
                      return;
                    }
                    setActiveTab('alertas');
                    setSearchQuery('');
                    setMobileMoreOpen(false);
                  }}
                  className={`w-full flex items-center gap-2.5 px-3 py-2 rounded-xl text-left text-xs font-semibold tracking-tight transition ${
                    currentUser?.funcao === 'Mecânico'
                      ? 'opacity-50 text-slate-400 cursor-not-allowed'
                      : activeTab === 'alertas'
                        ? 'bg-indigo-50 text-indigo-700 font-bold'
                        : 'text-slate-700 hover:bg-slate-50'
                  }`}
                >
                  <Bell className="w-4 h-4 text-amber-500" />
                  <span>Alertas de Revisão</span>
                  {currentUser?.funcao === 'Mecânico' && <Lock className="w-3.5 h-3.5 ml-auto text-slate-450" />}
                </button>
                <button
                  onClick={() => {
                    setActiveTab('config');
                    setSearchQuery('');
                    setMobileMoreOpen(false);
                  }}
                  className={`w-full flex items-center gap-2.5 px-3 py-2 rounded-xl text-left text-xs font-semibold tracking-tight transition ${
                    activeTab === 'config'
                      ? 'bg-indigo-50 text-indigo-700 font-bold'
                      : 'text-slate-700 hover:bg-slate-50'
                  }`}
                >
                  <Settings className="w-4 h-4 text-indigo-600" />
                  <span>Configurações & Perfil</span>
                </button>
              </motion.div>
            )}
          </AnimatePresence>

          {/* Tab 1: Dashboard */}
          <button
            onClick={() => {
              setActiveTab('dashboard');
              setSearchQuery('');
              setMobileMoreOpen(false);
            }}
            className={`flex flex-col items-center justify-center flex-1 py-1 px-2 rounded-2xl text-[10px] font-bold tracking-tight transition relative ${
              activeTab === 'dashboard'
                ? 'text-indigo-600'
                : 'text-slate-400 hover:text-slate-600'
            }`}
            id="mobile_tab_dashboard"
          >
            <TrendingUp className="w-5 h-5 mb-0.5 transition-transform active:scale-90" />
            <span>Início</span>
            {activeTab === 'dashboard' && (
              <motion.div 
                layoutId="activeMobileTabIndicator" 
                className="absolute bottom-0 w-6 h-0.75 bg-indigo-600 rounded-full" 
              />
            )}
          </button>

          {/* Tab 2: Clientes */}
          {currentUser?.funcao !== 'Mecânico' && (
            <button
              onClick={() => {
                setActiveTab('clientes');
                setSearchQuery('');
                setMobileMoreOpen(false);
              }}
              className={`flex flex-col items-center justify-center flex-1 py-1 px-2 rounded-2xl text-[10px] font-bold tracking-tight transition relative ${
                activeTab === 'clientes'
                  ? 'text-indigo-600'
                  : 'text-slate-400 hover:text-slate-600'
              }`}
              id="mobile_tab_clientes"
            >
              <Users className="w-5 h-5 mb-0.5 transition-transform active:scale-90" />
              <span>Clientes</span>
              {activeTab === 'clientes' && (
                <motion.div 
                  layoutId="activeMobileTabIndicator" 
                  className="absolute bottom-0 w-6 h-0.75 bg-indigo-600 rounded-full" 
                />
              )}
            </button>
          )}

          {/* Tab 3: Serviços */}
          <button
            onClick={() => {
              setActiveTab('servicos');
              setSearchQuery('');
              setMobileMoreOpen(false);
            }}
            className={`flex flex-col items-center justify-center flex-1 py-1 px-2 rounded-2xl text-[10px] font-bold tracking-tight transition relative ${
              activeTab === 'servicos'
                ? 'text-indigo-600'
                : 'text-slate-400 hover:text-slate-600'
            }`}
            id="mobile_tab_servicos"
          >
            <ClipboardList className="w-5 h-5 mb-0.5 transition-transform active:scale-90" />
            <span>Serviços</span>
            {activeTab === 'servicos' && (
              <motion.div 
                layoutId="activeMobileTabIndicator" 
                className="absolute bottom-0 w-6 h-0.75 bg-indigo-600 rounded-full" 
              />
            )}
          </button>

          {/* Tab 4: Estoque */}
          {currentUser?.funcao !== 'Mecânico' && (
            <button
              onClick={() => {
                setActiveTab('estoque');
                setSearchQuery('');
                setStockCategoryFilter('todos');
                setMobileMoreOpen(false);
              }}
              className={`flex flex-col items-center justify-center flex-1 py-1 px-2 rounded-2xl text-[10px] font-bold tracking-tight transition relative ${
                activeTab === 'estoque'
                  ? 'text-indigo-600'
                  : 'text-slate-400 hover:text-slate-600'
              }`}
              id="mobile_tab_estoque"
            >
              <div className="relative">
                <Package className="w-5 h-5 mb-0.5 transition-transform active:scale-90" />
                {stats && stats.pecasBaixoEstoque > 0 && (
                  <span className="absolute -top-1.5 -right-2 bg-amber-500 text-white font-bold text-[8px] leading-tight px-1 py-0.5 rounded-full animate-bounce">
                    {stats.pecasBaixoEstoque}
                  </span>
                )}
              </div>
              <span>Estoque</span>
              {activeTab === 'estoque' && (
                <motion.div 
                  layoutId="activeMobileTabIndicator" 
                  className="absolute bottom-0 w-6 h-0.75 bg-indigo-600 rounded-full" 
                />
              )}
            </button>
          )}

          {/* Tab 5: Mais */}
          <button
            onClick={() => {
              setMobileMoreOpen(!mobileMoreOpen);
            }}
            className={`flex flex-col items-center justify-center flex-1 py-1 px-2 rounded-2xl text-[10px] font-bold tracking-tight transition relative ${
              activeTab === 'relatorios' || activeTab === 'config' || activeTab === 'alertas' || mobileMoreOpen
                ? 'text-indigo-600'
                : 'text-slate-400 hover:text-slate-600'
            }`}
            id="mobile_tab_mais"
          >
            <SlidersHorizontal className="w-5 h-5 mb-0.5 transition-transform active:scale-90" />
            <span>Mais</span>
            {(activeTab === 'relatorios' || activeTab === 'config' || activeTab === 'alertas') && (
              <motion.div 
                layoutId="activeMobileTabIndicator" 
                className="absolute bottom-0 w-6 h-0.75 bg-indigo-600 rounded-full" 
              />
            )}
          </button>

        </div>
      </div>
      </>
      )}

    </div>
  );
}
