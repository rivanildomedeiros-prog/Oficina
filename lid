import { Servico } from './database';

export async function downloadPDFOrdemServico(
  servico: Servico,
  extraDetails?: {
    telefone?: string;
    cpf_cnpj?: string;
    endereco?: string;
    veiculoMarca?: string;
    veiculoAno?: number | string;
    veiculoCor?: string;
  }
) {
  // Safe dynamic import of jsPDF for Next.js SSR compatibility
  const { jsPDF } = await import('jspdf');

  const doc = new jsPDF({
    orientation: 'portrait',
    unit: 'mm',
    format: 'a4',
  });

  // Helper values
  const pageHeight = doc.internal.pageSize.getHeight();
  const pageWidth = doc.internal.pageSize.getWidth();
  const margin = 15;
  const contentWidth = pageWidth - (margin * 2); // 180mm

  // Colors Palette
  const primaryColorHex = '#4F46E5'; // Indigo
  const slate900Hex = '#0F172A'; // Slate 900
  const slate500Hex = '#64748B'; // Slate 500
  const grayCardHex = '#F8FAFC'; // Light Gray Background
  const borderColorHex = '#E2E8F0'; // Borders

  // Currency Formatter
  const formatBRL = (val: number) => {
    return new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(val);
  };

  // Date Formatter
  const formatISO = (isoStr?: string) => {
    if (!isoStr) return '-';
    try {
      return new Date(isoStr).toLocaleDateString('pt-BR') + ' ' + new Date(isoStr).toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' });
    } catch (_) {
      return isoStr;
    }
  };

  let cy = 10; // Current Y offset

  // Load custom workshop metadata and AI logo style dynamically from localStorage
  const workshop: {
    nome: string;
    slogan: string;
    telefone: string;
    endereco: string;
    cnpj: string;
    logoStyle: string;
    logoUrl?: string;
  } = {
    nome: 'DESTAKCAR',
    slogan: 'Sua oficina de confiança para manutenção e reparos',
    telefone: '(11) 99999-9999',
    endereco: 'Av. das Nações Unidas, 1234 - São Paulo - SP',
    cnpj: '12.345.678/0001-99',
    logoStyle: 'modern',
    logoUrl: undefined
  };

  if (typeof window !== 'undefined') {
    const raw = window.localStorage.getItem('destakcar_oficina_perfil');
    if (raw) {
      try {
        const parsed = JSON.parse(raw);
        if (parsed.nome) workshop.nome = parsed.nome.trim();
        if (parsed.slogan) workshop.slogan = parsed.slogan.trim();
        if (parsed.telefone) workshop.telefone = parsed.telefone.trim();
        if (parsed.endereco) workshop.endereco = parsed.endereco.trim();
        if (parsed.cnpj) workshop.cnpj = parsed.cnpj.trim();
        if (parsed.logoStyle) workshop.logoStyle = parsed.logoStyle;
        if (parsed.logoUrl) workshop.logoUrl = parsed.logoUrl;
      } catch (_) {}
    }
  }

  // 1. TOP INDIGO DECORATIVE BAR
  doc.setFillColor(79, 70, 229); // Primary Indigo
  doc.rect(0, cy, pageWidth, 5, 'F');
  cy += 10;

  // 2. DRAW AI-GENERATED VECTOR LOGO STYLES IN THE HEADER
  const lx = margin;
  const ly = cy;
  const logoSize = 18;

  if (workshop.logoStyle === 'custom' && workshop.logoUrl) {
    try {
      doc.addImage(workshop.logoUrl, 'PNG', lx, ly, logoSize, logoSize);
    } catch (_) {
      doc.setFillColor(30, 58, 138);
      doc.circle(lx + logoSize / 2, ly + logoSize / 2, logoSize / 2, 'F');
    }
  } else if (workshop.logoStyle === 'badge') {
    doc.setFillColor(15, 23, 42);
    doc.circle(lx + logoSize / 2, ly + logoSize / 2, logoSize / 2, 'F');
    doc.setFillColor(79, 70, 229);
    doc.circle(lx + logoSize / 2, ly + logoSize / 2, (logoSize / 2) - 1.5, 'F');
    doc.setDrawColor(255, 255, 255);
    doc.setLineWidth(1.2);
    doc.line(lx + 5, ly + 13, lx + 13, ly + 5); 
    doc.setFillColor(255, 255, 255);
    doc.circle(lx + logoSize / 2, ly + logoSize / 2, 2.5, 'F');
    doc.setFillColor(79, 70, 229);
    doc.circle(lx + logoSize / 2, ly + logoSize / 2, 1.2, 'F');
    doc.setFillColor(251, 191, 36);
    doc.circle(lx + 5, ly + 5, 0.6, 'F');
    doc.circle(lx + 13, ly + 13, 0.6, 'F');
  } else if (workshop.logoStyle === 'circuit') {
    doc.setDrawColor(79, 70, 229);
    doc.setLineWidth(0.8);
    const pts = [
      [lx + logoSize / 2, ly],
      [lx + logoSize, ly + 4.5],
      [lx + logoSize, ly + 13.5],
      [lx + logoSize / 2, ly + logoSize],
      [lx, ly + 13.5],
      [lx, ly + 4.5]
    ];
    for (let i = 0; i < 6; i++) {
      const next = pts[(i + 1) % 6];
      doc.line(pts[i][0], pts[i][1], next[0], next[1]);
    }
    doc.setDrawColor(99, 102, 241);
    doc.setLineWidth(0.35);
    doc.line(lx + logoSize / 2, ly, lx + logoSize / 2, ly + logoSize);
    doc.line(lx, ly + logoSize / 2, lx + logoSize, ly + logoSize / 2);
    doc.setFillColor(15, 23, 42);
    doc.rect(lx + 6, ly + 6, 6, 6, 'F');
    doc.setFillColor(251, 191, 36);
    doc.circle(lx + logoSize / 2, ly + logoSize / 2, 1.5, 'F');
  } else if (workshop.logoStyle === 'speed') {
    doc.setFillColor(244, 63, 94);
    doc.triangle(lx, ly + 5, lx + 15, ly + 5, lx + 5, ly + 11, 'F');
    doc.setFillColor(79, 70, 229);
    doc.triangle(lx + 3, ly + 10, lx + 18, ly + 10, lx + 8, ly + 16, 'F');
    doc.setFillColor(15, 23, 42);
    doc.triangle(lx + 6, ly + 15, lx + 15, ly + 15, lx + 10, ly + 18, 'F');
  } else if (workshop.logoStyle === 'minimal') {
    doc.setDrawColor(15, 23, 42);
    doc.setLineWidth(1.8);
    doc.circle(lx + logoSize / 2, ly + logoSize / 2, (logoSize / 2) - 1.5, 'S');
    doc.setLineWidth(1.0);
    doc.line(lx + logoSize / 2, ly, lx + logoSize / 2, ly + logoSize);
    doc.line(lx, ly + logoSize / 2, lx + logoSize, ly + logoSize / 2);
    doc.setFillColor(255, 255, 255);
    doc.circle(lx + logoSize / 2, ly + logoSize / 2, 4, 'F');
    doc.setFillColor(79, 70, 229);
    doc.circle(lx + logoSize / 2, ly + logoSize / 2, 2.5, 'F');
  } else if (workshop.logoStyle === 'destakcar') {
    // Official DestakCar Logo vector mapping in jsPDF
    const cx = lx + logoSize / 2;
    const cy = ly + logoSize / 2;
    
    // Draw 8 Gear teeth around the circle to create the custom mechanical gear shape
    doc.setFillColor(30, 58, 138); // Official Dark Blue
    const teethOffsets = [
      [0, -8.5], [6, -6], [8.5, 0], [6, 6],
      [0, 8.5], [-6, 6], [-8.5, 0], [-6, -6]
    ];
    teethOffsets.forEach(([tx, ty]) => {
      doc.circle(cx + tx, cy + ty, 1.5, 'F');
    });

    // Piston Outer Gear rim
    doc.circle(cx, cy, 7.5, 'F');
    // Gear Inner plate (white background)
    doc.setFillColor(255, 255, 255);
    doc.circle(cx, cy, 6.2, 'F');
    // Inner Orange accent ring
    doc.setDrawColor(249, 115, 22); // Orange inner ring
    doc.setLineWidth(0.2);
    doc.circle(cx, cy, 5.0, 'S');

    // Central Piston (Pistão em Metal Cromado)
    // Connecting Rod (Biela)
    doc.setDrawColor(148, 163, 184); // Chrome silver
    doc.setLineWidth(1.0);
    doc.line(cx, cy - 2, cx, cy + 4);
    doc.setFillColor(148, 163, 184);
    doc.circle(cx, cy + 4, 1.2, 'F'); // Bottom collar of rod

    // Piston Crown / Head (Cabeça do Pistão)
    doc.setFillColor(148, 163, 184); // Chrome silver header
    doc.roundedRect(cx - 3.2, cy - 5.5, 6.4, 3.8, 0.4, 0.4, 'F');
    
    // Micro ring segment grooves
    doc.setDrawColor(30, 41, 59); // Metallic dark line
    doc.setLineWidth(0.35);
    doc.line(cx - 2.8, cy - 4.5, cx + 2.8, cy - 4.5);
    doc.line(cx - 2.8, cy - 3.7, cx + 2.8, cy - 3.7);
    doc.line(cx - 2.8, cy - 2.9, cx + 2.8, cy - 2.9);

    // Aerodynamic trailing wings (pointing right)
    // Wing 1: Top silver wing blade
    doc.setFillColor(203, 213, 225); // Silver wing
    doc.triangle(cx + 4, cy - 4.5, cx + 18, cy - 7.5, cx + 9, cy - 1.5, 'F');
    
    // Wing 2: Middle orange wing blade
    doc.setFillColor(249, 115, 22); // Flame orange
    doc.triangle(cx + 4.5, cy - 1.5, cx + 16, cy + 1, cx + 8, cy + 2, 'F');
    
    // Wing 3: Bottom deep blue blade
    doc.setFillColor(30, 58, 138); // Dark blue wing
    doc.triangle(cx + 4, cy + 1.2, cx + 13, cy + 5, cx + 7.5, cy + 4.2, 'F');
  } else {
    doc.setFillColor(79, 70, 229);
    doc.roundedRect(lx, ly, logoSize, logoSize, 1.8, 1.8, 'F');
    doc.setDrawColor(255, 255, 255);
    doc.setLineWidth(1.0);
    doc.line(lx + 3, ly + 5, lx + 9, ly + 11);
    doc.line(lx + 9, ly + 11, lx + 15, ly + 5);
    doc.line(lx + 3, ly + 9, lx + 9, ly + 15);
    doc.line(lx + 9, ly + 15, lx + 15, ly + 9);
    doc.setFillColor(251, 191, 36);
    doc.circle(lx + 9, ly + 8.5, 1.2, 'F');
  }

  // 3. TITLE AND ADRESS METADATA (OFFSET PAST THE LOGO)
  const metaX = margin + logoSize + 4;

  doc.setTextColor(15, 23, 42);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(18);
  doc.text(workshop.nome, metaX, cy + 3.8);
  
  doc.setTextColor(100, 116, 139);
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(7.5);
  doc.text(workshop.slogan, metaX, cy + 7.4);

  doc.setTextColor(51, 65, 85);
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(7);
  doc.text(`CNPJ: ${workshop.cnpj}  |  Tel/WhatsApp: ${workshop.telefone}`, metaX, cy + 11.2);
  
  const addressLines = doc.splitTextToSize(`Endereço: ${workshop.endereco}`, pageWidth - margin - metaX - 52);
  doc.text(addressLines, metaX, cy + 14.8);

  // 4. O.S. SUMMARY OVERVIEW CODE BOX (TOP RIGHT ACCENT CARD)
  const infoBoxWidth = 48;
  const infoBoxHeight = 16;
  const infoBoxX = pageWidth - margin - infoBoxWidth;
  
  doc.setFillColor(15, 23, 42);
  doc.roundedRect(infoBoxX, cy, infoBoxWidth, infoBoxHeight, 2, 2, 'F');

  doc.setTextColor(255, 255, 255);
  doc.setFont('courier', 'bold');
  doc.setFontSize(9.5);
  const codeLabel = `O.S. #${servico.id.substring(0, 8).toUpperCase()}`;
  doc.text(codeLabel, infoBoxX + 3.5, cy + 5);

  doc.setTextColor(148, 163, 184);
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(6.5);
  const statusLabels: Record<string, string> = {
    orcamento: 'SITUAÇÃO: AJUSTE / ORÇAMENTO',
    em_andamento: 'SITUAÇÃO: EM MANUTENÇÃO',
    aguardando_pecas: 'SITUAÇÃO: RETIDO / AGUARD. PEÇAS',
    concluido: 'SITUAÇÃO: PAGO / CONCLUÍDO',
    cancelado: 'SITUAÇÃO: ARQUIVADO / CANCELADO'
  };
  const exactStatus = statusLabels[servico.status] || `SITUAÇÃO: ${servico.status.toUpperCase()}`;
  doc.text(exactStatus, infoBoxX + 3.5, cy + 9);

  doc.setTextColor(255, 255, 255);
  doc.text(`Emissão: ${formatISO(servico.criado_em)}`, infoBoxX + 3.5, cy + 12.8);

  // Increment current offset
  cy += 20;

  // Thin clean separation line
  doc.setDrawColor(226, 232, 240);
  doc.setLineWidth(0.35);
  doc.line(margin, cy, pageWidth - margin, cy);
  cy += 7;

  // 3. INFORMATION CARDS (CLIENT & VEHICLE SIDE-BY-SIDE)
  const cardWidth = (contentWidth - 6) / 2; // ~87mm each
  const cardHeight = 32;

  // Left card: Client Info Box
  doc.setFillColor(248, 250, 252); // Soft light gray card bg
  doc.roundedRect(margin, cy, cardWidth, cardHeight, 3, 3, 'F');
  doc.setDrawColor(241, 245, 249);
  doc.roundedRect(margin, cy, cardWidth, cardHeight, 3, 3, 'S');

  doc.setTextColor(79, 70, 229);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(8);
  doc.text('CLIENTE', margin + 5, cy + 6);

  doc.setTextColor(15, 23, 42);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(10);
  const cliNome = doc.splitTextToSize(servico.cliente_nome || 'Cliente Desconhecido', cardWidth - 10);
  doc.text(cliNome, margin + 5, cy + 12);

  doc.setTextColor(100, 116, 139);
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(8.5);
  let extraClientY = cy + 18;
  if (extraDetails?.telefone) {
    doc.text(`Contato: ${extraDetails.telefone}`, margin + 5, extraClientY);
    extraClientY += 4.5;
  }
  if (extraDetails?.cpf_cnpj) {
    doc.text(`CPF/CNPJ: ${extraDetails.cpf_cnpj}`, margin + 5, extraClientY);
  }

  // Right card: Vehicle Info Box
  const rx = margin + cardWidth + 6;
  doc.setFillColor(248, 250, 252);
  doc.roundedRect(rx, cy, cardWidth, cardHeight, 3, 3, 'F');
  doc.roundedRect(rx, cy, cardWidth, cardHeight, 3, 3, 'S');

  doc.setTextColor(79, 70, 229);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(8);
  doc.text('VEÍCULO DO CLIENTE', rx + 5, cy + 6);

  doc.setTextColor(15, 23, 42);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(10);
  doc.text(servico.veiculo_modelo || 'Modelo Desconhecido', rx + 5, cy + 12);

  doc.setTextColor(79, 70, 229);
  doc.setFont('courier', 'bold');
  doc.setFontSize(9.5);
  doc.text(`PLACA: ${servico.veiculo_placa || 'N/A'}`, rx + 5, cy + 18);

  doc.setTextColor(100, 116, 139);
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(8.5);
  let vSpecs = '';
  if (extraDetails?.veiculoMarca) vSpecs += extraDetails.veiculoMarca;
  if (extraDetails?.veiculoCor) vSpecs += (vSpecs ? ' • ' : '') + extraDetails.veiculoCor;
  if (extraDetails?.veiculoAno) vSpecs += (vSpecs ? ' • ' : '') + extraDetails.veiculoAno;
  if (vSpecs) {
    doc.text(vSpecs, rx + 5, cy + 24);
  }

  cy += cardHeight + 6;

  // 4. WORK DIAGNOSTICS / DESCRIPTION BOX
  doc.setFillColor(248, 250, 252);
  
  const descText = servico.descricao || 'Nenhuma descrição detalhada informada.';
  const wrappedDesc = doc.splitTextToSize(descText, contentWidth - 10);
  const descBoxHeight = Math.max(14, wrappedDesc.length * 4.5 + 10);

  doc.roundedRect(margin, cy, contentWidth, descBoxHeight, 3, 3, 'F');
  doc.setDrawColor(241, 245, 249);
  doc.roundedRect(margin, cy, contentWidth, descBoxHeight, 3, 3, 'S');

  doc.setTextColor(79, 70, 229);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(8);
  doc.text('LAUDO TÉCNICO / SERVIÇOS SOLICITADOS', margin + 5, cy + 6);

  doc.setTextColor(51, 65, 85);
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(9);
  doc.text(wrappedDesc, margin + 5, cy + 12);

  cy += descBoxHeight + 6;

  // 4.5 CHECKLIST DE VISTORIA DE ENTRADA
  const checklist = servico.checklist || {};
  const checklistItems = [
    { key: 'combustivel', label: 'Combustível: ' + (checklist.combustivel || 'N/A') },
    { key: 'riscos', label: 'Pintura/Lataria: ' + (checklist.riscos ? 'C/ Riscos' : 'Sem Danos') },
    { key: 'luzPainel', label: 'Luz Injeção/Painel: ' + (checklist.luzPainel ? 'Acesa' : 'Sem Alerta') },
    { key: 'estepe', label: 'Estepe/Macaco: ' + (checklist.estepe ? 'Ok' : 'Ausente') },
    { key: 'documento', label: 'Docs do Carro: ' + (checklist.documento ? 'Retidos' : 'C/ Cliente') }
  ];

  doc.setFillColor(248, 250, 252);
  const checklistBoxHeight = 15;
  doc.roundedRect(margin, cy, contentWidth, checklistBoxHeight, 2, 2, 'F');
  doc.setDrawColor(241, 245, 249);
  doc.roundedRect(margin, cy, contentWidth, checklistBoxHeight, 2, 2, 'S');

  doc.setTextColor(79, 70, 229);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(7.5);
  doc.text('VISTORIA / CHECKLIST DE ENTRADA DO VEÍCULO', margin + 4, cy + 4);

  doc.setTextColor(71, 85, 105);
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(7.5);

  const itemWidth = (contentWidth - 8) / 5;
  checklistItems.forEach((item, index) => {
    const ix = margin + 4 + (index * itemWidth);
    
    doc.setDrawColor(79, 70, 229);
    doc.setLineWidth(0.25);
    doc.setFillColor(255, 255, 255);
    doc.rect(ix, cy + 7, 2.5, 2.5, 'DF');

    let isChecked = false;
    if (item.key === 'combustivel' && checklist.combustivel && checklist.combustivel !== 'Não Informado') isChecked = true;
    if (item.key === 'riscos' && checklist.riscos) isChecked = true;
    if (item.key === 'luzPainel' && checklist.luzPainel) isChecked = true;
    if (item.key === 'estepe' && checklist.estepe) isChecked = true;
    if (item.key === 'documento' && checklist.documento) isChecked = true;

    if (isChecked) {
      doc.setFillColor(79, 70, 229);
      doc.rect(ix + 0.5, cy + 7.5, 1.5, 1.5, 'F');
    }

    const itemLabelLines = doc.splitTextToSize(item.label, itemWidth - 4);
    doc.text(itemLabelLines, ix + 4, cy + 9);
  });

  cy += checklistBoxHeight + 5;

  // 5. DETAILED FINANCE TABLE (PARTS AND LABOR)
  doc.setTextColor(15, 23, 42);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(8);
  doc.text('DETALHAMENTO DOS VALORES (MÃO DE OBRA E PEÇAS UTILIZADAS)', margin, cy);
  cy += 3;

  // Table header
  doc.setFillColor(15, 23, 42); // Black header border
  doc.rect(margin, cy, contentWidth, 7.5, 'F');

  doc.setTextColor(255, 255, 255);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(8);
  doc.text('Descrição do Item / Peça Aplicada', margin + 4, cy + 5);
  doc.text('Preço Unit.', margin + 100, cy + 5);
  doc.text('Quant.', margin + 132, cy + 5, { align: 'center' });
  doc.text('Valor Total', margin + contentWidth - 4, cy + 5, { align: 'right' });
  cy += 7.5;

  // Table Body Rows
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(8.5);

  let showHighlight = false;

  const drawRow = (desc: string, unitStr: string, qtyStr: string, totalStr: string) => {
    // Background highlight alternating
    if (showHighlight) {
      doc.setFillColor(248, 250, 252);
      doc.rect(margin, cy, contentWidth, 7, 'F');
    }
    showHighlight = !showHighlight;

    // Draw bottom border for the row
    doc.setDrawColor(241, 245, 249);
    doc.setLineWidth(0.2);
    doc.line(margin, cy + 7, margin + contentWidth, cy + 7);

    doc.setTextColor(30, 41, 59);
    doc.text(desc, margin + 4, cy + 4.8);
    doc.text(unitStr, margin + 100, cy + 4.8);
    doc.text(qtyStr, margin + 132, cy + 4.8, { align: 'center' });
    doc.setTextColor(15, 23, 42);
    doc.text(totalStr, margin + contentWidth - 4, cy + 4.8, { align: 'right' });
    cy += 7;
  };

  // Mão de Obra Row first
  drawRow('Serviço de Mão de Obra Mecânica / Serviços Gerais', '-', '1', formatBRL(servico.mao_de_obra_valor));

  // Parts list
  if (servico.pecas_usadas && servico.pecas_usadas.length > 0) {
    servico.pecas_usadas.forEach((pu) => {
      const subtotalVal = pu.preco_venda * pu.quantidade;
      drawRow(pu.nome, formatBRL(pu.preco_venda), String(pu.quantidade), formatBRL(subtotalVal));
    });
  } else {
    // If no parts, draw an indicating row
    drawRow('Nenhuma peça sobressalente aplicada nesta ordem.', '-', '0', '-');
  }

  cy += 6;

  // 6. SUM TOTAL ACCENT BANNER
  doc.setFillColor(15, 23, 42); // slate 900
  doc.roundedRect(margin, cy, contentWidth, 14, 2, 2, 'F');

  // Left banner: Status Text
  doc.setTextColor(203, 213, 225); // slate-300
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(7);
  doc.text('SITUAÇÃO DE PAGAMENTO DA O.S.', margin + 5, cy + 5.2);
  
  doc.setTextColor(255, 255, 255);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(10);
  const statusLabel = servico.status === 'concluido' ? 'PAGO & CONCLUÍDO' : 'EM ORÇAMENTO / PENDENTE';
  doc.text(statusLabel, margin + 5, cy + 10);

  // Right banner: Total Money Sum
  doc.setTextColor(203, 213, 225); // slate 300
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(7);
  doc.text('TOTAL DO ORÇAMENTO', margin + contentWidth - 5, cy + 5.2, { align: 'right' });

  doc.setTextColor(255, 255, 255);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(13);
  doc.text(formatBRL(servico.total), margin + contentWidth - 5, cy + 11, { align: 'right' });

  cy += 24;

  // Check if signatures could bleed over the footer, if yes increase/split page, though on standard A4 it fits perfectly
  // Signature Lines Block
  doc.setDrawColor(148, 163, 184); // slate-400
  doc.setLineWidth(0.35);

  const sigWidth = 65;
  const leftSigX = margin + 10;
  const rightSigX = margin + contentWidth - sigWidth - 10;

  doc.line(leftSigX, cy, leftSigX + sigWidth, cy);
  doc.line(rightSigX, cy, rightSigX + sigWidth, cy);

  doc.setTextColor(30, 41, 59);
  doc.setFont('helvetica', 'bold');
  doc.setFontSize(8.5);
  doc.text('Responsável Técnico / Mecânico', leftSigX + (sigWidth / 2), cy + 4, { align: 'center' });
  doc.text('Autorização do Proprietário', rightSigX + (sigWidth / 2), cy + 4, { align: 'center' });

  doc.setTextColor(148, 163, 184);
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(7.5);
  doc.text('DestakCar Workshop Suite', leftSigX + (sigWidth / 2), cy + 8, { align: 'center' });
  const clientRepresent = servico.cliente_nome || 'Cliente';
  doc.text(clientRepresent, rightSigX + (sigWidth / 2), cy + 8, { align: 'center' });

  // Save / Trigger Download
  const cleanOSNumber = servico.id.substring(0, 8).toUpperCase();
  const filename = `Ordem_Servico_DestakCar_${cleanOSNumber}.pdf`;
  doc.save(filename);
}

import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

/**
 * Validação de CPF e CNPJ com dígitos verificadores e máscaras de input
 */

export function validateCPF(cpf: string): boolean {
  const clean = cpf.replace(/\D/g, '');
  if (clean.length !== 11) return false;

  // Evita padrões repetitivos bobos (ex: 111.111.111-11)
  if (/^(\d)\1{10}$/.test(clean)) return false;

  // Validação do primeiro dígito
  let sum = 0;
  for (let i = 0; i < 9; i++) {
    sum += parseInt(clean.charAt(i), 10) * (10 - i);
  }
  let rev = 11 - (sum % 11);
  if (rev === 10 || rev === 11) rev = 0;
  if (rev !== parseInt(clean.charAt(9), 10)) return false;

  // Validação do segundo dígito
  sum = 0;
  for (let i = 0; i < 10; i++) {
    sum += parseInt(clean.charAt(i), 10) * (11 - i);
  }
  rev = 11 - (sum % 11);
  if (rev === 10 || rev === 11) rev = 0;
  if (rev !== parseInt(clean.charAt(10), 10)) return false;

  return true;
}

export function validateCNPJ(cnpj: string): boolean {
  const clean = cnpj.replace(/\D/g, '');
  if (clean.length !== 14) return false;

  // Evita padrões repetitivos bobos
  if (/^(\d)\1{13}$/.test(clean)) return false;

  // Validação do primeiro dígito
  let size = clean.length - 2;
  let numbers = clean.substring(0, size);
  const digits = clean.substring(size);
  let sum = 0;
  let pos = size - 7;
  for (let i = size; i >= 1; i--) {
    sum += parseInt(numbers.charAt(size - i), 10) * pos--;
    if (pos < 2) pos = 9;
  }
  let result = sum % 11 < 2 ? 0 : 11 - (sum % 11);
  if (result !== parseInt(digits.charAt(0), 10)) return false;

  // Validação do segundo dígito
  size = size + 1;
  numbers = clean.substring(0, size);
  sum = 0;
  pos = size - 7;
  for (let i = size; i >= 1; i--) {
    sum += parseInt(numbers.charAt(size - i), 10) * pos--;
    if (pos < 2) pos = 9;
  }
  result = sum % 11 < 2 ? 0 : 11 - (sum % 11);
  if (result !== parseInt(digits.charAt(1), 10)) return false;

  return true;
}

export function formatCPFOrCNPJ(value: string): string {
  // Limpa tudo que não é número
  const digits = value.replace(/\D/g, '');
  
  if (digits.length <= 11) {
    // Máscara CPF: 000.000.000-00
    let r = digits;
    if (r.length > 3) r = r.substring(0, 3) + '.' + r.substring(3);
    if (r.length > 7) r = r.substring(0, 7) + '.' + r.substring(7);
    if (r.length > 11) r = r.substring(0, 11) + '-' + r.substring(11, 13);
    return r;
  } else {
    // Máscara CNPJ: 00.000.000/0000-00
    let r = digits.substring(0, 14);
    if (r.length > 2) r = r.substring(0, 2) + '.' + r.substring(2);
    if (r.length > 6) r = r.substring(0, 6) + '.' + r.substring(6);
    if (r.length > 10) r = r.substring(0, 10) + '/' + r.substring(10);
    if (r.length > 15) r = r.substring(0, 15) + '-' + r.substring(15);
    return r;
  }
}

export function getCpfCnpjValidation(value: string): {
  isValid: boolean;
  isError: boolean;
  type: 'CPF' | 'CNPJ' | null;
  message: string;
} {
  const digits = value.replace(/\D/g, '');
  if (!digits) {
    return { isValid: true, isError: false, type: null, message: 'Opcional' };
  }

  if (digits.length <= 11) {
    if (digits.length < 11) {
      return { isValid: false, isError: true, type: 'CPF', message: 'CPF incompleto (mínimo 11 dígitos)' };
    }
    const valid = validateCPF(digits);
    return {
      isValid: valid,
      isError: !valid,
      type: 'CPF',
      message: valid ? 'CPF válido' : 'CPF inválido (erro de dígito verificador)'
    };
  } else {
    if (digits.length < 14) {
      return { isValid: false, isError: true, type: 'CNPJ', message: 'CNPJ incompleto (mínimo 14 dígitos)' };
    }
    const valid = validateCNPJ(digits);
    return {
      isValid: valid,
      isError: !valid,
      type: 'CNPJ',
      message: valid ? 'CNPJ válido' : 'CNPJ inválido (erro de dígito verificador)'
    };
  }
}

import { createClient } from '@supabase/supabase-js';

// Types and Interfaces
export interface Cliente {
  id: string;
  nome: string;
  email: string;
  telefone: string;
  cpf_cnpj: string;
  endereco: string;
  criado_em: string;
}

export interface Veiculo {
  id: string;
  cliente_id: string;
  placa: string;
  modelo: string;
  marca: string;
  ano: number;
  cor: string;
  chassi: string;
  criado_em: string;
  // Join property for convenient display
  cliente_nome?: string;
}

export interface Peca {
  id: string;
  nome: string;
  codigo: string;
  quantidade: number;
  preco_custo: number;
  preco_venda: number;
  categoria: string;
  limite_minimo: number;
  criado_em: string;
  fornecedor?: string;
}

export interface PecaUsada {
  peca_id: string;
  nome: string;
  quantidade: number;
  preco_venda: number;
}

export interface Servico {
  id: string;
  cliente_id: string;
  veiculo_id: string;
  descricao: string;
  status: 'orcamento' | 'em_andamento' | 'aguardando_pecas' | 'concluido' | 'cancelado';
  mao_de_obra_valor: number;
  pecas_usadas: PecaUsada[];
  total: number;
  criado_em: string;
  finalizado_em?: string;
  mecanico_id?: string | null;
  mecanico_nome?: string;
  checklist?: Record<string, any>;
  // Join properties
  cliente_nome?: string;
  veiculo_placa?: string;
  veiculo_modelo?: string;
}

// Initial Mock Seed Data for LocalStorage Mode
const SEED_CLIENTES: Cliente[] = [
  {
    id: 'c1',
    nome: 'João de Souza Silva',
    email: 'joao.silva@hotmail.com',
    telefone: '(11) 98765-4321',
    cpf_cnpj: '123.456.789-00',
    endereco: 'Avenida Paulista, 1000, Apto 54 - Bela Vista, São Paulo - SP',
    criado_em: '2026-05-15T14:30:00Z',
  },
  {
    id: 'c2',
    nome: 'Mariana Oliveira Pinto',
    email: 'mari.oliveira@outlook.com',
    telefone: '(21) 99888-7766',
    cpf_cnpj: '987.654.321-11',
    endereco: 'Rua das Flores, 45 - Botafogo, Rio de Janeiro - RJ',
    criado_em: '2026-05-18T09:15:00Z',
  },
  {
    id: 'c3',
    nome: 'Carlos Eduardo Souza',
    email: 'carlos.edu.souza@gmail.com',
    telefone: '(31) 97777-6655',
    cpf_cnpj: '111.222.333-44',
    endereco: 'Avenida Amazonas, 2500 - Centro, Belo Horizonte - MG',
    criado_em: '2026-05-20T11:45:00Z',
  },
];

const SEED_VEICULOS: Veiculo[] = [
  {
    id: 'v1',
    cliente_id: 'c1',
    placa: 'BRA2E19',
    modelo: 'Civic LX 2.0',
    marca: 'Honda',
    ano: 2018,
    cor: 'Cinza Metálico',
    chassi: '9BH123456789012AA',
    criado_em: '2026-05-15T14:45:00Z',
  },
  {
    id: 'v2',
    cliente_id: 'c2',
    placa: 'RIO1A23',
    modelo: 'Onix Hatch LTZ 1.0 Turbo',
    marca: 'Chevrolet',
    ano: 2020,
    cor: 'Branco Summit',
    chassi: '9BG987654321098BB',
    criado_em: '2026-05-18T09:30:00Z',
  },
  {
    id: 'v3',
    cliente_id: 'c3',
    placa: 'BHZ9X88',
    modelo: 'Compass Longitude 2.0 Flex',
    marca: 'Jeep',
    ano: 2021,
    cor: 'Preto Carbono',
    chassi: '9BD111222333444CC',
    criado_em: '2026-05-20T12:00:00Z',
  },
];

const SEED_PECAS: Peca[] = [
  {
    id: 'p1',
    nome: 'Pastilha de Freio Dianteira',
    codigo: 'PF-CIV18',
    quantidade: 12,
    preco_custo: 85.0,
    preco_venda: 145.0,
    categoria: 'Freios',
    limite_minimo: 5,
    criado_em: '2026-05-10T10:00:00Z',
  },
  {
    id: 'p2',
    nome: 'Filtro de Óleo Lubrificante',
    codigo: 'FO-UNI',
    quantidade: 25,
    preco_custo: 18.0,
    preco_venda: 38.0,
    categoria: 'Filtros',
    limite_minimo: 10,
    criado_em: '2026-05-10T10:05:00Z',
  },
  {
    id: 'p3',
    nome: 'Óleo Sintético 5W30 (Frasco 1L)',
    codigo: 'OL-5W30',
    quantidade: 3, // Próximo ao limite para alertar o dashboard!
    preco_custo: 28.0,
    preco_venda: 52.0,
    categoria: 'Lubrificantes',
    limite_minimo: 15,
    criado_em: '2026-05-10T10:10:00Z',
  },
  {
    id: 'p4',
    nome: 'Amortecedor Dianteiro Cofap',
    codigo: 'AM-DIR',
    quantidade: 4,
    preco_custo: 220.0,
    preco_venda: 390.0,
    categoria: 'Suspensão',
    limite_minimo: 3,
    criado_em: '2026-05-10T10:15:00Z',
  },
  {
    id: 'p5',
    nome: 'Correia Dentada Gates',
    codigo: 'CD-GM',
    quantidade: 8,
    preco_custo: 45.0,
    preco_venda: 89.0,
    categoria: 'Motor',
    limite_minimo: 4,
    criado_em: '2026-05-10T10:20:00Z',
  },
];

const SEED_SERVICOS: Servico[] = [
  {
    id: 's1',
    cliente_id: 'c1',
    veiculo_id: 'v1',
    descricao: 'Revisão geral dos 60,000 km. Troca de pastilhas de freio dianteiras e substituição do óleo lubrificante de motor com respectivo filtro.',
    status: 'em_andamento',
    mao_de_obra_valor: 150.0,
    pecas_usadas: [
      { peca_id: 'p1', nome: 'Pastilha de Freio Dianteira', quantidade: 1, preco_venda: 145.0 },
      { peca_id: 'p3', nome: 'Óleo Sintético 5W30 (Frasco 1L)', quantidade: 4, preco_venda: 52.0 },
      { peca_id: 'p2', nome: 'Filtro de Óleo Lubrificante', quantidade: 1, preco_venda: 38.0 },
    ],
    total: 541.0, // 150 + 145 + (4 * 52) + 38 = 150 + 145 + 208 + 38 = 541
    criado_em: '2026-05-28T10:00:00Z',
  },
  {
    id: 's2',
    cliente_id: 'c2',
    veiculo_id: 'v2',
    descricao: 'Identificação de barulho na suspensão dianteira. Necessária troca dos amortecedores dianteiros.',
    status: 'orcamento',
    mao_de_obra_valor: 250.0,
    pecas_usadas: [
      { peca_id: 'p4', nome: 'Amortecedor Dianteiro Cofap', quantidade: 2, preco_venda: 390.0 },
    ],
    total: 1030.0, // 250 + 780 = 1030
    criado_em: '2026-05-29T14:30:00Z',
  },
  {
    id: 's3',
    cliente_id: 'c3',
    veiculo_id: 'v3',
    descricao: 'Substituição preventiva da correia dentada do motor.',
    status: 'concluido',
    mao_de_obra_valor: 180.0,
    pecas_usadas: [
      { peca_id: 'p5', nome: 'Correia Dentada Gates', quantidade: 1, preco_venda: 89.0 },
    ],
    total: 269.0, // 180 + 89
    criado_em: '2026-05-25T08:00:00Z',
    finalizado_em: '2026-05-25T11:45:00Z',
  },
];

// Helper to check if credentials exist or are loaded from localStorage
export function getSupabaseCredentials() {
  if (typeof window === 'undefined') return { url: '', key: '' };
  
  const savedUrl = window.localStorage.getItem('destakcar_supabase_url') || window.localStorage.getItem('distakcar_supabase_url') || process.env.NEXT_PUBLIC_SUPABASE_URL || '';
  const savedKey = window.localStorage.getItem('destakcar_supabase_key') || window.localStorage.getItem('distakcar_supabase_key') || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';
  
  return { url: savedUrl, key: savedKey };
}

// Cache for the Supabase Client singleton to prevent parallel refresh races
let cachedClient: any = null;
let cachedUrl = '';
let cachedKey = '';

// Get standard Supabase JS client if available
export function getSupabaseClient() {
  const { url, key } = getSupabaseCredentials();
  if (url && key && url !== 'MY_SUPABASE_URL' && key !== 'MY_SUPABASE_ANON_KEY') {
    if (cachedClient && cachedUrl === url && cachedKey === key) {
      return cachedClient;
    }
    try {
      cachedClient = createClient(url, key);
      cachedUrl = url;
      cachedKey = key;
      return cachedClient;
    } catch (e) {
      console.error('Falha ao criar cliente Supabase:', e);
    }
  }
  return null;
}

// Check database mode
export function getDatabaseMode(): 'supabase' | 'local' {
  if (typeof window !== 'undefined') {
    const savedMode = window.localStorage.getItem('destakcar_db_mode');
    if (savedMode === 'local' || savedMode === 'supabase') {
      return savedMode as 'supabase' | 'local';
    }
  }
  const { url, key } = getSupabaseCredentials();
  if (url && key) {
    return 'supabase';
  }
  return 'local';
}

export interface Usuario {
  id: string;
  email: string;
  nome: string;
  criado_em: string;
  funcao?: string;
  avatar_url?: string;
  senha?: string;
}

// Register user
export async function signUpUser(email: string, password: string, nome: string, funcao?: string): Promise<Usuario> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const chosenFuncao = funcao || 'Mecânico';

  if (isLocal || !client) {
    const newUser: Usuario = {
      id: typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : Math.random().toString(36).substring(2, 9),
      email: email.trim().toLowerCase(),
      nome,
      criado_em: new Date().toISOString(),
      funcao: chosenFuncao,
      senha: password,
      avatar_url: ''
    };
    const usuarios = getLocalStorageData<Usuario>('usuarios', []);
    if (usuarios.some(u => u.email.trim().toLowerCase() === email.trim().toLowerCase())) {
      throw new Error("Este e-mail já foi registrado no banco local.");
    }
    usuarios.push(newUser);
    saveLocalStorageData('usuarios', usuarios);
    
    // Auto-login locally
    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(newUser));
    }
    return newUser;
  }

  // Supabase Direct Table-based user registration
  try {
    const { data: existingUser, error: checkErr } = await client
      .from('usuarios')
      .select('email')
      .eq('email', email.trim().toLowerCase())
      .maybeSingle();

    if (checkErr) {
      const hint = " (DICA: Se seu banco de dados no Supabase é novo, você precisa criar as tabelas do sistema primeiro. Abra o SQL Editor no painel do Supabase, vá em Configurações (ícone de engrenagem) no canto superior direito do app, copie o código SQL Completo e execute-o. Se as tabelas já existem mas estão desatualizadas, certifique-se de executar no SQL Editor: \n\nALTER TABLE public.usuarios ADD COLUMN IF NOT EXISTS senha VARCHAR(255);\nALTER TABLE public.usuarios ADD COLUMN IF NOT EXISTS avatar_url TEXT;\n)";
      throw new Error("Erro de conexão ao banco de dados: " + checkErr.message + "\n\n" + hint);
    }
    if (existingUser) {
      throw new Error("Este e-mail já está cadastrado no sistema.");
    }

    const newId = typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : 'u-' + Math.random().toString(36).substring(2, 15);
    const newUserRecord: Usuario = {
      id: newId,
      email: email.trim().toLowerCase(),
      nome,
      funcao: chosenFuncao,
      senha: password,
      avatar_url: '',
      criado_em: new Date().toISOString()
    };

    const { error: insertErr } = await client
      .from('usuarios')
      .insert([newUserRecord]);

    if (insertErr) {
      const hint = " (DICA: Certifique-se de que a tabela public.usuarios possui as colunas 'senha' e 'avatar_url'. Execute o seguinte comando no SQL Editor do seu painel Supabase para criá-las se necessário:\n\nALTER TABLE public.usuarios ADD COLUMN IF NOT EXISTS senha VARCHAR(255);\nALTER TABLE public.usuarios ADD COLUMN IF NOT EXISTS avatar_url TEXT;\n)";
      throw new Error("Erro ao salvar usuário na tabela: " + insertErr.message + "\n\n" + hint);
    }

    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(newUserRecord));
    }
    return newUserRecord;
  } catch (err: any) {
    const msg = err.message || '';
    if (msg.includes('Failed to fetch') || msg.includes('fetch') || msg.toLowerCase().includes('rate limit') || msg.includes('limit') || msg.includes('network') || msg.includes('unreachable')) {
      throw new Error(`${err.message} (DICA: Se seu banco Supabase estiver instável ou indisposto, use o modo "Local (Off-line)" para acessar imediatamente).`);
    }
    throw err;
  }
}

// Login user
export async function signInUser(email: string, password: string): Promise<Usuario> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();

  if (isLocal || !client) {
    const usuarios = getLocalStorageData<Usuario>('usuarios', []);
    let matching = usuarios.find(u => u.email.trim().toLowerCase() === email.trim().toLowerCase());
    
    if (!matching) {
      if (email.trim().toLowerCase() === 'admin@destakcar.com' && password === 'admin123') {
        const defaultAdmin: Usuario = {
          id: 'admin-local-1',
          email: 'admin@destakcar.com',
          nome: 'Administrador Local',
          funcao: 'Administrador',
          senha: 'admin123',
          criado_em: new Date().toISOString(),
          avatar_url: ''
        };
        usuarios.push(defaultAdmin);
        saveLocalStorageData('usuarios', usuarios);
        matching = defaultAdmin;
      } else if (email.trim().toLowerCase() === 'rivanildomedeiros@gmail.com' && password === '123456') {
        const defaultUser: Usuario = {
          id: 'rivanildo-local-1',
          email: 'rivanildomedeiros@gmail.com',
          nome: 'Rivanildo Silva de Medeiros',
          funcao: 'Administrador',
          senha: '123456',
          criado_em: new Date().toISOString(),
          avatar_url: ''
        };
        usuarios.push(defaultUser);
        saveLocalStorageData('usuarios', usuarios);
        matching = defaultUser;
      } else {
        throw new Error("Usuário não cadastrado localmente. Caso queira, faça o cadastro offline ou use as credenciais de primeiro acesso (e-mail: rivanildomedeiros@gmail.com / senha: 123456).");
      }
    }
    
    if (matching.senha !== password) {
      throw new Error("Senha incorreta.");
    }
    
    // Set current active user session locally
    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(matching));
    }
    return matching;
  }

  // Supabase Custom Table authentication
  try {
    const { data: user, error } = await client
      .from('usuarios')
      .select('*')
      .eq('email', email.trim().toLowerCase())
      .maybeSingle();

    if (error) {
      const hint = " (DICA: Se seu banco de dados no Supabase é novo, certifique-se de criar as tabelas copiando o script SQL Completo no menu Configurações (ícone de engrenagem) e executando-o no SQL Editor do Supabase. Se o banco já existia, certifique-se de adicionar as colunas do sistema de login executando:\n\nALTER TABLE public.usuarios ADD COLUMN IF NOT EXISTS senha VARCHAR(255);\nALTER TABLE public.usuarios ADD COLUMN IF NOT EXISTS avatar_url TEXT;\n)";
      throw new Error("Erro ao conectar à tabela do banco de dados: " + error.message + "\n\n" + hint);
    }

    let matchingUser = user;

    if (!matchingUser) {
      // Automatic seed of default admin if they log in with standard credentials
      if (email.trim().toLowerCase() === 'admin@destakcar.com' && password === 'admin123') {
        const newAdmin: Usuario = {
          id: 'a0000000-0000-0000-0000-000000000001',
          email: 'admin@destakcar.com',
          nome: 'Administrador Hub',
          funcao: 'Administrador',
          senha: 'admin123',
          avatar_url: '',
          criado_em: new Date().toISOString()
        };
        const { error: insertErr } = await client
          .from('usuarios')
          .insert([newAdmin]);
          
        if (insertErr) {
          console.warn("Falha ao cadastrar admin padrão no Supabase:", insertErr.message);
        }
        matchingUser = newAdmin;
      } else if (email.trim().toLowerCase() === 'rivanildomedeiros@gmail.com' && password === '123456') {
        const newRivanildo: Usuario = {
          id: 'a0000000-0000-0000-0000-000000000002',
          email: 'rivanildomedeiros@gmail.com',
          nome: 'Rivanildo Silva de Medeiros',
          funcao: 'Administrador',
          senha: '123456',
          avatar_url: '',
          criado_em: new Date().toISOString()
        };
        const { error: insertErr } = await client
          .from('usuarios')
          .insert([newRivanildo]);
          
        if (insertErr) {
          console.warn("Falha ao cadastrar Rivanildo no Supabase:", insertErr.message);
        }
        matchingUser = newRivanildo;
      } else {
        throw new Error("Usuário não cadastrado nesta base ou credenciais inválidas. Como alternativa, tente usar seu e-mail rivanildomedeiros@gmail.com e senha 123456.");
      }
    }

    if (matchingUser.senha && matchingUser.senha !== password) {
      throw new Error("Senha incorreta.");
    }

    // Set current user session locally
    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(matchingUser));
    }
    return matchingUser as Usuario;
  } catch (err: any) {
    const msg = err.message || '';
    if (msg.includes('Failed to fetch') || msg.includes('fetch') || msg.toLowerCase().includes('rate limit') || msg.includes('limit') || msg.includes('network')) {
      throw new Error(`${err.message} (DICA: Se seu banco Supabase na nuvem estiver inacessível, use o modo "Local (Off-line)" no switcher para logar com o admin padrão: "admin@destakcar.com" / senha "admin123").`);
    }
    throw err;
  }
}

// Logout user
export async function signOutUser(): Promise<void> {
  if (typeof window !== 'undefined') {
    window.localStorage.removeItem('destakcar_usuario_atual');
  }
  const client = getSupabaseClient();
  if (client) {
    try {
      await client.auth.signOut();
    } catch (_) {}
  }
}

// Get current active user session
export async function getCurrentUser(): Promise<Usuario | null> {
  if (typeof window !== 'undefined') {
    const raw = window.localStorage.getItem('destakcar_usuario_atual');
    if (raw) {
      try {
        return JSON.parse(raw) as Usuario;
      } catch (_) {}
    }
  }
  return null;
}

// Update user profile information (fullname and optionally uploading an avatar to Supabase Storage or localStorage fallback)
export async function updateUserProfile(nome: string, avatarFile: File | null): Promise<Usuario> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();

  // Get active user from localStorage first
  let currentUserLocal: Usuario | null = null;
  if (typeof window !== 'undefined') {
    const raw = window.localStorage.getItem('destakcar_usuario_atual');
    if (raw) {
      try {
        currentUserLocal = JSON.parse(raw) as Usuario;
      } catch (_) {}
    }
  }

  if (!currentUserLocal) {
    throw new Error("Nenhum usuário ativo para atualização.");
  }

  if (isLocal || !client) {
    const u: Usuario = {
      ...currentUserLocal,
      nome,
    };
    
    if (avatarFile) {
      const base64 = await new Promise<string>((resolve) => {
        const reader = new FileReader();
        reader.onloadend = () => resolve(reader.result as string);
        reader.readAsDataURL(avatarFile);
      });
      u.avatar_url = base64;
    }

    if (typeof window !== 'undefined') {
      window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(u));
      const list = getLocalStorageData<Usuario>('usuarios', []);
      const idx = list.findIndex(item => item.id === u.id);
      if (idx !== -1) {
        list[idx] = u;
        saveLocalStorageData('usuarios', list);
      }
    }
    return u;
  }

  // Supabase Mode - Direct table updating
  let avatarUrl = currentUserLocal.avatar_url || '';

  if (avatarFile) {
    try {
      const fileExt = avatarFile.name.split('.').pop() || 'png';
      const filePath = `${currentUserLocal.id}/avatar-${Date.now()}.${fileExt}`;

      // Upload file to 'avatars' bucket
      const { error: uploadErr } = await client.storage
        .from('avatars')
        .upload(filePath, avatarFile, { upsert: true });

      if (uploadErr) {
        console.warn("Storage upload failed, attempting to create bucket first:", uploadErr.message);
        try {
          await client.storage.createBucket('avatars', { public: true });
        } catch (_) {}
        
        const { error: retryErr } = await client.storage
          .from('avatars')
          .upload(filePath, avatarFile, { upsert: true });
        
        if (retryErr) {
          throw new Error("Erro ao enviar imagem para o Supabase Storage: " + retryErr.message);
        }
      }

      const { data: { publicUrl } } = client.storage
        .from('avatars')
        .getPublicUrl(filePath);

      avatarUrl = publicUrl;
    } catch (storageErr: any) {
      console.warn("Storage error, falling back to base64:", storageErr);
      const base64 = await new Promise<string>((resolve) => {
        const reader = new FileReader();
        reader.onloadend = () => resolve(reader.result as string);
        reader.readAsDataURL(avatarFile);
      });
      avatarUrl = base64;
    }
  }

  // Update directly on public.usuarios table
  const { error: dbErr } = await client
    .from('usuarios')
    .update({ nome: nome, avatar_url: avatarUrl })
    .eq('id', currentUserLocal.id);

  if (dbErr) {
    throw new Error("Erro ao salvar no banco de dados Supabase: " + dbErr.message);
  }

  const resultUser: Usuario = {
    ...currentUserLocal,
    nome: nome,
    avatar_url: avatarUrl
  };

  // Sync with local session tracker
  if (typeof window !== 'undefined') {
    window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(resultUser));
  }

  return resultUser;
}

// Fetch all registered users
export async function fetchUsuarios(): Promise<Usuario[]> {
  const isLocal = getDatabaseMode() === 'local';
  if (isLocal) {
    const list = getLocalStorageData<Usuario>('usuarios', []);
    if (list.length === 0) {
      // Seed default admin and Rivanildo if list is empty
      const defaultAdmin: Usuario = {
        id: 'admin-local-1',
        email: 'admin@destakcar.com',
        nome: 'Administrador Local',
        funcao: 'Administrador',
        senha: 'admin123',
        criado_em: new Date().toISOString(),
        avatar_url: ''
      };
      const defaultRivanildo: Usuario = {
        id: 'rivanildo-local-1',
        email: 'rivanildomedeiros@gmail.com',
        nome: 'Rivanildo Silva de Medeiros',
        funcao: 'Administrador',
        senha: '123456',
        criado_em: new Date().toISOString(),
        avatar_url: ''
      };
      const seeds = [defaultAdmin, defaultRivanildo];
      saveLocalStorageData('usuarios', seeds);
      return seeds;
    }
    // Backward compatibility check: if admin is there but Rivanildo isn't in there yet, let's inject him
    if (!list.some(u => u.email.trim().toLowerCase() === 'rivanildomedeiros@gmail.com')) {
      list.push({
        id: 'rivanildo-local-1',
        email: 'rivanildomedeiros@gmail.com',
        nome: 'Rivanildo Silva de Medeiros',
        funcao: 'Administrador',
        senha: '123456',
        criado_em: new Date().toISOString(),
        avatar_url: ''
      });
      saveLocalStorageData('usuarios', list);
    }
    return list;
  }

  const client = getSupabaseClient();
  if (!client) return [];

  try {
    const { data, error } = await client
      .from('usuarios')
      .select('*')
      .order('nome', { ascending: true });

    if (error) {
      console.warn('Erro ao buscar usuários do Supabase:', error.message);
      return [];
    }
    return data || [];
  } catch (err) {
    console.warn('Erro inesperado ao buscar usuários do Supabase:', err);
    return [];
  }
}

// Update user role / position (função)
export async function updateUsuarioFuncao(id: string, funcao: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  if (isLocal) {
    const list = getLocalStorageData<Usuario>('usuarios', []);
    const idx = list.findIndex(item => item.id === id);
    if (idx !== -1) {
      list[idx].funcao = funcao;
      saveLocalStorageData('usuarios', list);
      
      // Also update currently active user if they updated themselves
      if (typeof window !== 'undefined') {
        const raw = window.localStorage.getItem('destakcar_usuario_atual');
        if (raw) {
          const curr = JSON.parse(raw) as Usuario;
          if (curr.id === id) {
            curr.funcao = funcao;
            window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(curr));
          }
        }
      }
      return true;
    }
    return false;
  }

  const client = getSupabaseClient();
  if (!client) throw new Error("Supabase não configurado.");

  // Direct table update of public.usuarios table
  const { error } = await client
    .from('usuarios')
    .update({ funcao: funcao })
    .eq('id', id);

  if (error) {
    throw new Error("Erro ao atualizar cargo no banco: " + error.message);
  }

  // Synchronize localStorage session tracking if current active user is the one changed
  if (typeof window !== 'undefined') {
    const raw = window.localStorage.getItem('destakcar_usuario_atual');
    if (raw) {
      try {
        const curr = JSON.parse(raw) as Usuario;
        if (curr.id === id) {
          curr.funcao = funcao;
          window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(curr));
        }
      } catch (_) {}
    }
  }

  return true;
}

// Request password reset email
export async function resetPasswordForEmail(email: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  if (isLocal) {
    throw new Error("Não é possível recuperar senha no banco local por e-mail. Utilize a senha padrão.");
  }

  const client = getSupabaseClient();
  if (!client) {
    throw new Error("Supabase não configurado. Por favor, especifique o Endpoint Web e a Chave nas Configurações.");
  }
  const origin = typeof window !== 'undefined' ? window.location.origin : '';
  try {
    const { error } = await client.auth.resetPasswordForEmail(email, {
      redirectTo: origin ? `${origin}/` : undefined,
    });
    if (error) throw new Error(error.message);
    return true;
  } catch (err: any) {
    const msg = err.message || '';
    if (msg.includes('Failed to fetch') || msg.includes('fetch') || msg.toLowerCase().includes('rate limit') || msg.includes('limit') || msg.includes('network') || msg.includes('unreachable') || msg.includes('NetworkError')) {
      throw new Error(`${err.message} (DICA: Se o limite de redefinições por e-mail do Supabase foi atingido, mude para o modo "Local (Off-line)" logo acima para acessar o sistema offline instantaneamente com o e-mail "admin@destakcar.com" e senha "admin123").`);
    }
    throw err;
  }
}

// Update password
export async function updateUserPassword(password: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  if (isLocal) {
    if (typeof window !== 'undefined') {
      const raw = window.localStorage.getItem('destakcar_usuario_atual');
      if (raw) {
        try {
          const u = JSON.parse(raw) as Usuario;
          const list = getLocalStorageData<Usuario>('usuarios', []);
          const idx = list.findIndex(item => item.id === u.id);
          if (idx !== -1) {
            list[idx].senha = password;
            saveLocalStorageData('usuarios', list);
            
            // Also update current active session's password reference
            u.senha = password;
            window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(u));
          }
          return true;
        } catch (_) {}
      }
    }
    return true;
  }

  const client = getSupabaseClient();
  if (!client) {
    throw new Error("Supabase não configurado. Por favor, especifique o Endpoint Web e a Chave nas Configurações.");
  }

  // Update in public.usuarios table
  if (typeof window !== 'undefined') {
    const raw = window.localStorage.getItem('destakcar_usuario_atual');
    if (raw) {
      try {
        const u = JSON.parse(raw) as Usuario;
        const { error } = await client
          .from('usuarios')
          .update({ senha: password })
          .eq('id', u.id);

        if (error) {
          throw new Error("Erro ao atualizar senha no banco: " + error.message);
        }

        // Also update local active session with new password
        u.senha = password;
        window.localStorage.setItem('destakcar_usuario_atual', JSON.stringify(u));
        return true;
      } catch (err: any) {
        throw new Error(err?.message || String(err));
      }
    }
  }
  
  throw new Error("Nenhum usuário ativo para atualizar a senha.");
}

// Helper to load item from localStorage or seed
function getLocalStorageData<T>(key: string, seed: T[]): T[] {
  if (typeof window === 'undefined') return seed;
  const raw = window.localStorage.getItem(`destakcar_${key}`) || window.localStorage.getItem(`distakcar_${key}`);
  if (!raw) {
    window.localStorage.setItem(`destakcar_${key}`, JSON.stringify(seed));
    return seed;
  }
  try {
    return JSON.parse(raw);
  } catch (e) {
    return seed;
  }
}

function saveLocalStorageData<T>(key: string, data: T[]): void {
  if (typeof window === 'undefined') return;
  window.localStorage.setItem(`destakcar_${key}`, JSON.stringify(data));
}

// API Unified Library

export async function clearAllLocalDatabase() {
  if (typeof window === 'undefined') return;
  window.localStorage.removeItem('destakcar_clientes');
  window.localStorage.removeItem('destakcar_veiculos');
  window.localStorage.removeItem('destakcar_pecas');
  window.localStorage.removeItem('destakcar_servicos');
  window.localStorage.removeItem('distakcar_clientes');
  window.localStorage.removeItem('distakcar_veiculos');
  window.localStorage.removeItem('distakcar_pecas');
  window.localStorage.removeItem('distakcar_servicos');
  // Trigger a page reload to reseed
  window.location.reload();
}

// ==========================================
// CLIENTES CRUD
// ==========================================

export async function fetchClientes(): Promise<Cliente[]> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    return getLocalStorageData<Cliente>('clientes', SEED_CLIENTES).sort((a, b) => a.nome.localeCompare(b.nome));
  }
  try {
    const { data, error } = await client
      .from('clientes')
      .select('*')
      .order('nome', { ascending: true });
    if (error) {
      console.warn("Erro ao buscar clientes no Supabase, usando dados locais de fallback:", error.message);
      return getLocalStorageData<Cliente>('clientes', SEED_CLIENTES).sort((a, b) => a.nome.localeCompare(b.nome));
    }
    return data as Cliente[];
  } catch (err: any) {
    console.warn("Erro inesperado ao buscar clientes no Supabase, usando dados locais de fallback:", err);
    return getLocalStorageData<Cliente>('clientes', SEED_CLIENTES).sort((a, b) => a.nome.localeCompare(b.nome));
  }
}

export async function createCliente(cliente: Omit<Cliente, 'id' | 'criado_em'>): Promise<Cliente> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    const list = getLocalStorageData<Cliente>('clientes', SEED_CLIENTES);
    const novo: Cliente = {
      ...cliente,
      id: typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : Math.random().toString(36).substring(2, 9),
      criado_em: new Date().toISOString()
    };
    list.unshift(novo);
    saveLocalStorageData('clientes', list);
    return novo;
  }
  const { data, error } = await client
    .from('clientes')
    .insert([cliente])
    .select();
  if (error) {
    throw new Error("Erro ao criar cliente no Supabase: " + error.message);
  }
  if (!data || !data[0]) {
    throw new Error("Resposta inesperada do banco de dados ao salvar cliente.");
  }
  return data[0] as Cliente;
}

export async function updateCliente(id: string, updates: Partial<Cliente>): Promise<Cliente> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    const list = getLocalStorageData<Cliente>('clientes', SEED_CLIENTES);
    const index = list.findIndex(c => c.id === id);
    if (index !== -1) {
      list[index] = { ...list[index], ...updates };
      saveLocalStorageData('clientes', list);
      return list[index];
    }
    throw new Error('Cliente não encontrado localmente.');
  }
  const { data, error } = await client
    .from('clientes')
    .update(updates)
    .eq('id', id)
    .select();
  if (error) {
    throw new Error("Erro ao atualizar cliente no Supabase: " + error.message);
  }
  if (!data || !data[0]) {
    throw new Error("Cliente não encontrado ou erro ao persistir modificações.");
  }
  return data[0] as Cliente;
}

export async function deleteCliente(id: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  
  // Clean up local storage data anyway, to be robust
  if (typeof window !== 'undefined') {
    try {
      const list = getLocalStorageData<Cliente>('clientes', SEED_CLIENTES);
      const filtrados = list.filter(c => c.id !== id);
      saveLocalStorageData('clientes', filtrados);

      // Clean up related vehicles locally as well
      const veiculos = getLocalStorageData<any>('veiculos', []);
      const veiculosFiltrados = veiculos.filter((v: any) => v.cliente_id !== id);
      saveLocalStorageData('veiculos', veiculosFiltrados);

      // Clean up local alerts for this client
      const rawAlerts = window.localStorage.getItem('destakcar_alertas_revisao');
      if (rawAlerts) {
        const parsedAlerts = JSON.parse(rawAlerts);
        if (Array.isArray(parsedAlerts)) {
          const filteredAlerts = parsedAlerts.filter((a: any) => a.cliente_id !== id);
          window.localStorage.setItem('destakcar_alertas_revisao', JSON.stringify(filteredAlerts));
        }
      }
    } catch (localErr) {
      console.warn("Erro ao limpar dados locais do cliente excluído:", localErr);
    }
  }

  if (isLocal || !client) {
    return true;
  }

  // UUID verification: If not a valid UUID format, Supabase will throw a Bad Request (22P02 invalid input syntax)
  const uuidPattern = /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/;
  if (!uuidPattern.test(id)) {
    return true; // Impossível existir no Supabase se não for UUID válido
  }

  // Pre-emptively cascade related entities manually to prevent any foreign key "Bad Request" or restrict issues
  try {
    // 1. Obter todos os veículos associados ao cliente
    const { data: veiculosData, error: veiculosFetchError } = await client
      .from('veiculos')
      .select('id')
      .eq('cliente_id', id);

    if (veiculosFetchError) {
      console.warn("Aviso ao buscar veículos vinculados ao cliente:", veiculosFetchError.message);
    }

    if (!veiculosFetchError && veiculosData && veiculosData.length > 0) {
      const veiculoIds = veiculosData.map((v: any) => v.id);
      
      // Dissociar referências de veículos de ordens de serviço
      const { error: osVeiculoErr } = await client
        .from('ordens_servico')
        .update({ veiculo_id: null })
        .in('veiculo_id', veiculoIds);
      if (osVeiculoErr) {
        console.warn("Aviso ao desassociar veículos das ordens de serviço:", osVeiculoErr.message);
      }

      // Dissociar referências de veículos de serviços legacy
      const { error: servicosVeiculoErr } = await client
        .from('servicos')
        .update({ veiculo_id: null })
        .in('veiculo_id', veiculoIds);
      if (servicosVeiculoErr) {
        console.warn("Aviso ao desassociar veículos dos serviços legacy:", servicosVeiculoErr.message);
      }
    }

    // 2. Dissociar referências diretas de cliente em ordens de serviço e serviços
    const { error: osClienteErr } = await client
      .from('ordens_servico')
      .update({ cliente_id: null })
      .eq('cliente_id', id);
    if (osClienteErr) {
      console.warn("Aviso ao desassociar cliente das ordens de serviço:", osClienteErr.message);
    }

    const { error: servicosClienteErr } = await client
      .from('servicos')
      .update({ cliente_id: null })
      .eq('cliente_id', id);
    if (servicosClienteErr) {
      console.warn("Aviso ao desassociar cliente dos serviços legacy:", servicosClienteErr.message);
    }

    // 3. Deletar os veículos pertencentes ao cliente
    const { error: deleteVeiculosErr } = await client
      .from('veiculos')
      .delete()
      .eq('cliente_id', id);
    if (deleteVeiculosErr) {
      console.warn("Aviso ao excluir veículos vinculados na nuvem:", deleteVeiculosErr.message);
    }
  } catch (err) {
    console.warn("Aviso ao rodar cascateador manual de exclusão de cliente:", err);
  }

  const { error } = await client
    .from('clientes')
    .delete()
    .eq('id', id);

  if (error) {
    const errorDetails = [
      error.message,
      error.code ? `[Código: ${error.code}]` : '',
      error.details ? `[Detalhes: ${error.details}]` : '',
      error.hint ? `[Dica: ${error.hint}]` : ''
    ].filter(Boolean).join(' - ');
    throw new Error("Erro ao excluir cliente no Supabase: " + errorDetails);
  }
  return true;
}


// ==========================================
// VEICULOS CRUD
// ==========================================

export async function fetchVeiculos(): Promise<Veiculo[]> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const getLocalFallback = () => {
    const veiculos = getLocalStorageData<Veiculo>('veiculos', SEED_VEICULOS);
    const clientes = getLocalStorageData<Cliente>('clientes', SEED_CLIENTES);
    return veiculos.map(v => ({
      ...v,
      cliente_nome: clientes.find(c => c.id === v.cliente_id)?.nome || 'Cliente Desconhecido'
    }));
  };

  if (isLocal || !client) {
    return getLocalFallback();
  }
  try {
    const { data, error } = await client
      .from('veiculos')
      .select('*, clientes(nome)');
    if (error) {
      console.warn("Erro ao buscar veículos no Supabase, usando dados locais de fallback:", error.message);
      return getLocalFallback();
    }
    return (data || []).map((v: any) => ({
      ...v,
      cliente_nome: v.clientes ? v.clientes.nome : 'Cliente Desconhecido',
    })) as Veiculo[];
  } catch (err: any) {
    console.warn("Erro inesperado ao buscar veículos no Supabase, usando dados locais de fallback:", err);
    return getLocalFallback();
  }
}

export async function createVeiculo(veiculo: Omit<Veiculo, 'id' | 'criado_em'>): Promise<Veiculo> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    const list = getLocalStorageData<Veiculo>('veiculos', SEED_VEICULOS);
    const novo: Veiculo = {
      ...veiculo,
      id: typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : Math.random().toString(36).substring(2, 9),
      criado_em: new Date().toISOString()
    };
    list.unshift(novo);
    saveLocalStorageData('veiculos', list);
    const clientes = getLocalStorageData<Cliente>('clientes', SEED_CLIENTES);
    novo.cliente_nome = clientes.find(c => c.id === veiculo.cliente_id)?.nome || 'Cliente Desconhecido';
    return novo;
  }
  const { data, error } = await client
    .from('veiculos')
    .insert([veiculo])
    .select();
  if (error) {
    throw new Error("Erro ao cadastrar veículo no Supabase: " + error.message);
  }
  if (!data || !data[0]) {
    throw new Error("Resposta inesperada do banco de dados ao salvar veículo.");
  }
  // Fetch names to return enriched
  const { data: cData } = await client.from('clientes').select('nome').eq('id', veiculo.cliente_id).single();
  return {
    ...data[0],
    cliente_nome: cData?.nome || 'Cliente Desconhecido',
  } as Veiculo;
}

export async function updateVeiculo(id: string, updates: Partial<Veiculo>): Promise<Veiculo> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    const list = getLocalStorageData<Veiculo>('veiculos', SEED_VEICULOS);
    const index = list.findIndex(v => v.id === id);
    if (index !== -1) {
      list[index] = { ...list[index], ...updates };
      saveLocalStorageData('veiculos', list);
      const clientes = getLocalStorageData<Cliente>('clientes', SEED_CLIENTES);
      list[index].cliente_nome = clientes.find(c => c.id === list[index].cliente_id)?.nome || 'Cliente Desconhecido';
      return list[index];
    }
    throw new Error('Veículo não encontrado localmente.');
  }
  const { data, error } = await client
    .from('veiculos')
    .update(updates)
    .eq('id', id)
    .select();
  if (error) {
    throw new Error("Erro ao atualizar veículo no Supabase: " + error.message);
  }
  if (!data || !data[0]) {
    throw new Error("Veículo não encontrado ou erro ao persistir modificações.");
  }
  const { data: cData } = await client.from('clientes').select('nome').eq('id', data[0].cliente_id).single();
  return {
    ...data[0],
    cliente_nome: cData?.nome || 'Cliente Desconhecido',
  } as Veiculo;
}

export async function deleteVeiculo(id: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    const list = getLocalStorageData<Veiculo>('veiculos', SEED_VEICULOS);
    const filtrados = list.filter(v => v.id !== id);
    saveLocalStorageData('veiculos', filtrados);
    return true;
  }

  try {
    // Dissociar referências deste veículo em ordens de serviço e serviços legacy
    await client
      .from('ordens_servico')
      .update({ veiculo_id: null })
      .eq('veiculo_id', id);

    await client
      .from('servicos')
      .update({ veiculo_id: null })
      .eq('veiculo_id', id);
  } catch (err) {
    console.warn("Aviso ao rodar desvinculador cascateado para veículo:", err);
  }

  const { error } = await client
    .from('veiculos')
    .delete()
    .eq('id', id);
  if (error) {
    throw new Error("Erro ao excluir veículo no Supabase: " + error.message);
  }
  return true;
}


// ==========================================
// PECAS / ESTOQUE CRUD
// ==========================================

export async function fetchPecas(): Promise<Peca[]> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    return getLocalStorageData<Peca>('pecas', SEED_PECAS).sort((a, b) => a.nome.localeCompare(b.nome));
  }
  try {
    const { data, error } = await client
      .from('pecas')
      .select('*')
      .order('nome', { ascending: true });
    if (error) {
      console.warn("Erro ao buscar peças no Supabase, usando dados locais de fallback:", error.message);
      return getLocalStorageData<Peca>('pecas', SEED_PECAS).sort((a, b) => a.nome.localeCompare(b.nome));
    }
    return data as Peca[];
  } catch (err: any) {
    console.warn("Erro inesperado ao buscar peças no Supabase, usando dados locais de fallback:", err);
    return getLocalStorageData<Peca>('pecas', SEED_PECAS).sort((a, b) => a.nome.localeCompare(b.nome));
  }
}

export async function createPeca(peca: Omit<Peca, 'id' | 'criado_em'>): Promise<Peca> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    const list = getLocalStorageData<Peca>('pecas', SEED_PECAS);
    const novo: Peca = {
      ...peca,
      id: typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : Math.random().toString(36).substring(2, 9),
      criado_em: new Date().toISOString()
    };
    list.unshift(novo);
    saveLocalStorageData('pecas', list);
    return novo;
  }
  // Excluir o campo 'fornecedor' antes de enviar ao Supabase, pois ele não existe na tabela "pecas" física
  const { fornecedor, ...dbPeca } = peca;
  const { data, error } = await client
    .from('pecas')
    .insert([dbPeca])
    .select();
  if (error) {
    throw new Error("Erro ao criar peça no Supabase: " + error.message);
  }
  if (!data || !data[0]) {
    throw new Error("Resposta inesperada do banco de dados ao salvar peça.");
  }
  return {
    ...data[0],
    fornecedor: peca.fornecedor
  } as Peca;
}

export async function updatePeca(id: string, updates: Partial<Peca>): Promise<Peca> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    const list = getLocalStorageData<Peca>('pecas', SEED_PECAS);
    const index = list.findIndex(p => p.id === id);
    if (index !== -1) {
      list[index] = { ...list[index], ...updates };
      saveLocalStorageData('pecas', list);
      return list[index];
    }
    throw new Error('Peça não encontrada localmente.');
  }
  // Excluir o campo 'fornecedor' antes de enviar ao Supabase, pois ele não existe na tabela "pecas" física
  const { fornecedor, ...dbUpdates } = updates;
  const { data, error } = await client
    .from('pecas')
    .update(dbUpdates)
    .eq('id', id)
    .select();
  if (error) {
    throw new Error("Erro ao atualizar peça no Supabase: " + error.message);
  }
  if (!data || !data[0]) {
    throw new Error("Peça não encontrada ou erro ao persistir modificações.");
  }
  return {
    ...data[0],
    fornecedor: updates.fornecedor
  } as Peca;
}

export async function deletePeca(id: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  if (isLocal || !client) {
    const list = getLocalStorageData<Peca>('pecas', SEED_PECAS);
    const filtrados = list.filter(p => p.id !== id);
    saveLocalStorageData('pecas', filtrados);
    return true;
  }

  try {
    // Dissociar referências deste item em "os_itens" para evitar violação de foreign key
    await client
      .from('os_itens')
      .update({ peca_id: null })
      .eq('peca_id', id);
  } catch (err) {
    console.warn("Aviso ao desvincular peça de itens de O.S.:", err);
  }

  const { error } = await client
    .from('pecas')
    .delete()
    .eq('id', id);
  if (error) {
    throw new Error("Erro ao excluir peça no Supabase: " + error.message);
  }
  return true;
}

// ==========================================
// SERVICOS / ORÇAMENTOS CRUD
// ==========================================

export async function fetchServicos(): Promise<Servico[]> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const getLocalFallback = () => {
    const list = getLocalStorageData<Servico>('servicos', SEED_SERVICOS);
    const clientes = getLocalStorageData<Cliente>('clientes', SEED_CLIENTES);
    const veiculos = getLocalStorageData<Veiculo>('veiculos', SEED_VEICULOS);
    return list.map(s => ({
      ...s,
      cliente_nome: clientes.find(c => c.id === s.cliente_id)?.nome || 'Cliente Desconhecido',
      veiculo_placa: veiculos.find(v => v.id === s.veiculo_id)?.placa || 'Placa Desconhecida',
      veiculo_modelo: veiculos.find(v => v.id === s.veiculo_id)?.modelo || 'Modelo Desconhecido'
    })).sort((a, b) => new Date(b.criado_em).getTime() - new Date(a.criado_em).getTime());
  };

  if (isLocal || !client) {
    return getLocalFallback();
  }

  try {
    const { data, error } = await client
      .from('ordens_servico')
      .select('*, clientes(nome), veiculos(placa, modelo), usuarios(nome), os_itens(id, peca_id, quantidade, preco_unitario, pecas(nome))')
      .order('criado_em', { ascending: false });

    if (error) {
      console.warn("Erro ao buscar histórico de serviços no Supabase, usando dados locais de fallback:", error.message);
      return getLocalFallback();
    }

    return (data || []).map((s: any) => {
      const pecas_usadas: PecaUsada[] = (s.os_itens || []).map((item: any) => ({
        peca_id: item.peca_id || '',
        nome: item.pecas ? item.pecas.nome : 'Peça Desconhecida',
        quantidade: Number(item.quantidade) || 0,
        preco_venda: Number(item.preco_unitario) || 0
      }));

      return {
        id: s.id,
        cliente_id: s.cliente_id || '',
        veiculo_id: s.veiculo_id || '',
        descricao: s.descricao || '',
        status: s.status as any,
        mao_de_obra_valor: Number(s.mao_de_obra_valor) || 0,
        pecas_usadas: pecas_usadas,
        total: Number(s.total) || 0,
        criado_em: s.criado_em,
        finalizado_em: s.finalizado_em || undefined,
        mecanico_id: s.mecanico_id || undefined,
        mecanico_nome: s.usuarios ? s.usuarios.nome : undefined,
        cliente_nome: s.clientes ? s.clientes.nome : 'Cliente Desconhecido',
        veiculo_placa: s.veiculos ? s.veiculos.placa : 'Placa Desconhecida',
        veiculo_modelo: s.veiculos ? s.veiculos.modelo : 'Modelo Desconhecido',
        checklist: s.checklist || {},
      };
    }) as Servico[];
  } catch (err: any) {
    console.warn("Erro inesperado ao buscar histórico de serviços no Supabase, usando dados locais de fallback:", err);
    return getLocalFallback();
  }
}

// Custom internal utility to trigger stock deduction / compensation
async function ajustaEstoquePecas(pecasUsadas: PecaUsada[], operacao: 'deduzir' | 'repor') {
  const client = getSupabaseClient();
  if (!client) return;
  try {
    for (const item of pecasUsadas) {
      if (item.peca_id && !item.peca_id.startsWith('temp-') && item.peca_id.length > 5) {
        const { data } = await client.from('pecas').select('quantidade').eq('id', item.peca_id).single();
         if (data) {
          const novaQtd = operacao === 'deduzir' 
            ? Math.max(0, data.quantidade - item.quantidade)
            : data.quantidade + item.quantidade;
          await client.from('pecas').update({ quantidade: novaQtd }).eq('id', item.peca_id);
        }
      }
    }
  } catch (e) {
    console.error('Erro ao ajustar estoque no Supabase:', e);
  }
}

async function ajustaEstoquePecasLocal(pecasUsadas: PecaUsada[], operacao: 'deduzir' | 'repor') {
  try {
    const pecas = getLocalStorageData<Peca>('pecas', SEED_PECAS);
    for (const item of pecasUsadas) {
      if (item.peca_id) {
        const pIdx = pecas.findIndex(p => p.id === item.peca_id);
        if (pIdx !== -1) {
          const novaQtd = operacao === 'deduzir'
            ? Math.max(0, pecas[pIdx].quantidade - item.quantidade)
            : pecas[pIdx].quantidade + item.quantidade;
          pecas[pIdx].quantidade = novaQtd;
        }
      }
    }
    saveLocalStorageData('pecas', pecas);
  } catch (e) {
    console.error('Erro ao ajustar estoque local:', e);
  }
}

export async function createServico(servico: Omit<Servico, 'id' | 'criado_em'>): Promise<Servico> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();

  if (isLocal || !client) {
    const list = getLocalStorageData<Servico>('servicos', SEED_SERVICOS);
    const novo: Servico = {
      ...servico,
      id: typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : Math.random().toString(36).substring(2, 9),
      criado_em: new Date().toISOString()
    };
    list.unshift(novo);
    saveLocalStorageData('servicos', list);
    
    if (novo.status === 'em_andamento' || novo.status === 'concluido') {
      await ajustaEstoquePecasLocal(novo.pecas_usadas, 'deduzir');
    }
    
    const clientes = getLocalStorageData<Cliente>('clientes', SEED_CLIENTES);
    const veiculos = getLocalStorageData<Veiculo>('veiculos', SEED_VEICULOS);
    novo.cliente_nome = clientes.find(c => c.id === novo.cliente_id)?.nome || 'Cliente Desconhecido';
    novo.veiculo_placa = veiculos.find(v => v.id === novo.veiculo_id)?.placa || 'Placa Desconhecida';
    novo.veiculo_modelo = veiculos.find(v => v.id === novo.veiculo_id)?.modelo || 'Modelo Desconhecido';
    return novo;
  }

  // If status is immediately concluded or under execution, deduzir estoque
  if (servico.status === 'em_andamento' || servico.status === 'concluido') {
    await ajustaEstoquePecas(servico.pecas_usadas, 'deduzir');
  }

  const cleanServico: any = {
    cliente_id: servico.cliente_id || null,
    veiculo_id: servico.veiculo_id || null,
    descricao: servico.descricao || '',
    status: servico.status,
    mao_de_obra_valor: servico.mao_de_obra_valor || 0,
    total: servico.total || 0,
    mecanico_id: servico.mecanico_id || null,
    checklist: servico.checklist || {},
  };

  let { data, error } = await client
    .from('ordens_servico')
    .insert([cleanServico])
    .select();

  if (error && error.code === '42703') { // Column does not exist fallback
    console.warn("A coluna 'checklist' não existe no banco de dados. Salvando sem checklist.");
    const fallbackServico = { ...cleanServico };
    delete fallbackServico.checklist;
    const retry = await client
      .from('ordens_servico')
      .insert([fallbackServico])
      .select();
    data = retry.data;
    error = retry.error;
  }

  if (error || !data || !data[0]) {
    throw new Error("Erro ao criar ordem de serviço no Supabase: " + (error?.message || "Resposta inválida."));
  }

  const os_id = data[0].id;

  // Insert items into os_itens
  if (servico.pecas_usadas && servico.pecas_usadas.length > 0) {
    const itemsToInsert = servico.pecas_usadas.map(p => ({
      os_id: os_id,
      peca_id: p.peca_id.startsWith('temp-') || p.peca_id.length <= 5 ? null : p.peca_id,
      quantidade: p.quantidade,
      preco_unitario: p.preco_venda
    }));

    const { error: itemsError } = await client.from('os_itens').insert(itemsToInsert);
    if (itemsError) {
      console.error('Erro ao inserir peças do serviço:', itemsError.message);
    }
  }

  const { data: cData } = await client.from('clientes').select('nome').eq('id', servico.cliente_id).single();
  const { data: vData } = await client.from('veiculos').select('placa, modelo').eq('id', servico.veiculo_id).single();

  return {
    ...data[0],
    pecas_usadas: servico.pecas_usadas,
    cliente_nome: cData?.nome || 'Cliente Desconhecido',
    veiculo_placa: vData?.placa || 'Placa Desconhecida',
    veiculo_modelo: vData?.modelo || 'Modelo Desconhecido',
  } as Servico;
}

export async function updateServico(id: string, updates: Partial<Servico>): Promise<Servico> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();

  if (isLocal || !client) {
    const list = getLocalStorageData<Servico>('servicos', SEED_SERVICOS);
    const index = list.findIndex(s => s.id === id);
    if (index === -1) throw new Error('Serviço não encontrado localmente.');
    const oldServico = list[index];
    const newServico = { ...oldServico, ...updates };

    const oldConcludedOrActive = ['em_andamento', 'concluido', 'aguardando_pecas'].includes(oldServico.status);
    const newConcludedOrActive = ['em_andamento', 'concluido', 'aguardando_pecas'].includes(newServico.status);

    if (!oldConcludedOrActive && newConcludedOrActive) {
      await ajustaEstoquePecasLocal(updates.pecas_usadas || oldServico.pecas_usadas, 'deduzir');
    } else if (oldConcludedOrActive && !newConcludedOrActive) {
      await ajustaEstoquePecasLocal(oldServico.pecas_usadas, 'repor');
    } else if (oldConcludedOrActive && newConcludedOrActive && updates.pecas_usadas) {
      await ajustaEstoquePecasLocal(oldServico.pecas_usadas, 'repor');
      await ajustaEstoquePecasLocal(updates.pecas_usadas, 'deduzir');
    }

    list[index] = newServico;
    saveLocalStorageData('servicos', list);

    const clientes = getLocalStorageData<Cliente>('clientes', SEED_CLIENTES);
    const veiculos = getLocalStorageData<Veiculo>('veiculos', SEED_VEICULOS);
    newServico.cliente_nome = clientes.find(c => c.id === newServico.cliente_id)?.nome || 'Cliente Desconhecido';
    newServico.veiculo_placa = veiculos.find(v => v.id === newServico.veiculo_id)?.placa || 'Placa Desconhecida';
    newServico.veiculo_modelo = veiculos.find(v => v.id === newServico.veiculo_id)?.modelo || 'Modelo Desconhecido';

    return newServico;
  }

  // Fetch current service to check status transition
  let servicoAtual: Servico | null = null;
  const { data: currentOS, error: fetchError } = await client
    .from('ordens_servico')
    .select('*, os_itens(id, peca_id, quantidade, preco_unitario)')
    .eq('id', id)
    .single();

  if (!fetchError && currentOS) {
    const pecas_usadas: PecaUsada[] = (currentOS.os_itens || []).map((item: any) => ({
      peca_id: item.peca_id || '',
      nome: '',
      quantidade: Number(item.quantidade) || 0,
      preco_venda: Number(item.preco_unitario) || 0
    }));
    servicoAtual = {
      ...currentOS,
      pecas_usadas
    } as any;
  }

  if (servicoAtual) {
    const oldStatus = servicoAtual.status;
    const newStatus = updates.status || oldStatus;

    const oldConcludedOrActive = ['em_andamento', 'concluido', 'aguardando_pecas'].includes(oldStatus);
    const newConcludedOrActive = ['em_andamento', 'concluido', 'aguardando_pecas'].includes(newStatus);

    if (!oldConcludedOrActive && newConcludedOrActive) {
      await ajustaEstoquePecas(updates.pecas_usadas || servicoAtual.pecas_usadas, 'deduzir');
    } else if (oldConcludedOrActive && !newConcludedOrActive) {
      await ajustaEstoquePecas(servicoAtual.pecas_usadas, 'repor');
    } else if (oldConcludedOrActive && newConcludedOrActive && updates.pecas_usadas) {
      await ajustaEstoquePecas(servicoAtual.pecas_usadas, 'repor');
      await ajustaEstoquePecas(updates.pecas_usadas, 'deduzir');
    }
  }

  const cleanUpdates: any = {};
  if (updates.cliente_id !== undefined) cleanUpdates.cliente_id = updates.cliente_id || null;
  if (updates.veiculo_id !== undefined) cleanUpdates.veiculo_id = updates.veiculo_id || null;
  if (updates.descricao !== undefined) cleanUpdates.descricao = updates.descricao;
  if (updates.status !== undefined) cleanUpdates.status = updates.status;
  if (updates.mao_de_obra_valor !== undefined) cleanUpdates.mao_de_obra_valor = updates.mao_de_obra_valor;
  if (updates.total !== undefined) cleanUpdates.total = updates.total;
  if (updates.finalizado_em !== undefined) cleanUpdates.finalizado_em = updates.finalizado_em;
  if (updates.mecanico_id !== undefined) cleanUpdates.mecanico_id = updates.mecanico_id || null;
  if (updates.checklist !== undefined) cleanUpdates.checklist = updates.checklist;

  let { data, error } = await client
    .from('ordens_servico')
    .update(cleanUpdates)
    .eq('id', id)
    .select();

  if (error && error.code === '42703') { // Column does not exist fallback
    console.warn("A coluna 'checklist' não existe no banco de dados. Atualizando sem checklist.");
    const fallbackUpdates = { ...cleanUpdates };
    delete fallbackUpdates.checklist;
    const retry = await client
      .from('ordens_servico')
      .update(fallbackUpdates)
      .eq('id', id)
      .select();
    data = retry.data;
    error = retry.error;
  }

  if (error || !data || !data[0]) {
    throw new Error("Erro ao atualizar ordem de serviço no Supabase: " + (error?.message || "Serviço não encontrado."));
  }

  const updatedOS = data[0];

  // Update pecas if specified
  if (updates.pecas_usadas !== undefined) {
    await client.from('os_itens').delete().eq('os_id', id);

    if (updates.pecas_usadas && updates.pecas_usadas.length > 0) {
      const itemsToInsert = updates.pecas_usadas.map(p => ({
        os_id: id,
        peca_id: p.peca_id.startsWith('temp-') || p.peca_id.length <= 5 ? null : p.peca_id,
        quantidade: p.quantidade,
        preco_unitario: p.preco_venda
      }));

      await client.from('os_itens').insert(itemsToInsert);
    }
  }

  const { data: cData } = await client.from('clientes').select('nome').eq('id', updatedOS.cliente_id).single();
  const { data: vData } = await client.from('veiculos').select('placa, modelo').eq('id', updatedOS.veiculo_id).single();
  const { data: uData } = updatedOS.mecanico_id 
    ? await client.from('usuarios').select('nome').eq('id', updatedOS.mecanico_id).single()
    : { data: null };

  return {
    ...updatedOS,
    pecas_usadas: updates.pecas_usadas !== undefined ? updates.pecas_usadas : (servicoAtual?.pecas_usadas || []),
    cliente_nome: cData?.nome || 'Cliente Desconhecido',
    veiculo_placa: vData?.placa || 'Placa Desconhecida',
    veiculo_modelo: vData?.modelo || 'Modelo Desconhecido',
    mecanico_nome: uData?.nome || undefined,
  } as Servico;
}

export async function deleteServico(id: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();

  if (isLocal || !client) {
    const list = getLocalStorageData<Servico>('servicos', SEED_SERVICOS);
    const currentOS = list.find(s => s.id === id);
    if (currentOS) {
      if (['em_andamento', 'concluido', 'aguardando_pecas'].includes(currentOS.status)) {
        await ajustaEstoquePecasLocal(currentOS.pecas_usadas, 'repor');
      }
    }
    const filtrados = list.filter(s => s.id !== id);
    saveLocalStorageData('servicos', filtrados);
    return true;
  }

  // Fetch and return parts to inventory if active or concluded service is deleted
  const { data: currentOS, error: fetchError } = await client
    .from('ordens_servico')
    .select('*, os_itens(id, peca_id, quantidade, preco_unitario)')
    .eq('id', id)
    .single();

  if (!fetchError && currentOS) {
    const pecas_usadas: PecaUsada[] = (currentOS.os_itens || []).map((item: any) => ({
      peca_id: item.peca_id || '',
      nome: '',
      quantidade: Number(item.quantidade) || 0,
      preco_venda: Number(item.preco_unitario) || 0
    }));
    if (['em_andamento', 'concluido', 'aguardando_pecas'].includes(currentOS.status)) {
      await ajustaEstoquePecas(pecas_usadas, 'repor');
    }
  }

  const { error } = await client
    .from('ordens_servico')
    .delete()
    .eq('id', id);

  if (error) {
    throw new Error("Erro ao excluir ordem de serviço no Supabase: " + error.message);
  }
  return true;
}

// ==========================================
// METRICAS / DASHBOARD COMPUTATION
// ==========================================

export interface DashboardStats {
  totalFaturamento: number;
  faturamentoMensal: number;
  servicosPendentes: number;
  servicosAndamento: number;
  servicosConcluidos: number;
  pecasBaixoEstoque: number;
  receitaMaoDeObra: number;
  receitaPecas: number;
  ultimosServicos: Servico[];
  mensalDataChart: { mes: string; servicos: number; faturamento: number }[];
}

export async function getDashboardStats(servicosList?: Servico[], pecasList?: Peca[]): Promise<DashboardStats> {
  const servicos = servicosList || await fetchServicos();
  const pecas = pecasList || await fetchPecas();

  let totalFaturamento = 0;
  let faturamentoMensal = 0;
  let servicosPendentes = 0;
  let servicosAndamento = 0;
  let servicosConcluidos = 0;
  let receitaMaoDeObra = 0;
  let receitaPecas = 0;

  const hoje = new Date();
  const mesAtual = hoje.getMonth();
  const anoAtual = hoje.getFullYear();

  servicos.forEach(s => {
    // Only count as faturamento if concluded or in progress
    if (s.status !== 'cancelado') {
      totalFaturamento += Number(s.total) || 0;
      receitaMaoDeObra += Number(s.mao_de_obra_valor) || 0;
      
      let somaPecas = 0;
      s.pecas_usadas.forEach(p => {
        somaPecas += (Number(p.preco_venda) * Number(p.quantidade));
      });
      receitaPecas += somaPecas;

      const dataCriacao = new Date(s.criado_em);
      if (dataCriacao.getMonth() === mesAtual && dataCriacao.getFullYear() === anoAtual) {
        faturamentoMensal += Number(s.total) || 0;
      }
    }

    if (s.status === 'orcamento') {
      servicosPendentes++;
    } else if (s.status === 'em_andamento' || s.status === 'aguardando_pecas') {
      servicosAndamento++;
    } else if (s.status === 'concluido') {
      servicosConcluidos++;
    }
  });

  const pecasBaixoEstoque = pecas.filter(p => p.quantidade <= p.limite_minimo).length;

  // Last 5 services
  const ultimosServicos = servicos.slice(0, 5);

  // Group by month (last 6 months)
  const mesesNomes = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'];
  const mensalDataChart = Array.from({ length: 6 }).map((_, i) => {
    const d = new Date();
    d.setMonth(hoje.getMonth() - (5 - i));
    const m = d.getMonth();
    const y = d.getFullYear();

    let fat = 0;
    let count = 0;

    servicos.forEach(s => {
      if (s.status !== 'cancelado') {
        const servDt = new Date(s.criado_em);
        if (servDt.getMonth() === m && servDt.getFullYear() === y) {
          fat += Number(s.total) || 0;
          count++;
        }
      }
    });

    return {
      mes: `${mesesNomes[m]}/${String(y).substring(2)}`,
      servicos: count,
      faturamento: fat,
    };
  });

  return {
    totalFaturamento,
    faturamentoMensal,
    servicosPendentes,
    servicosAndamento,
    servicosConcluidos,
    pecasBaixoEstoque,
    receitaMaoDeObra,
    receitaPecas,
    ultimosServicos,
    mensalDataChart,
  };
}

// ==========================================
// PUSH NOTIFICATIONS & DEVICES CONTROLLERS
// ==========================================

export interface Dispositivo {
  id: string;
  usuario_id: string;
  nome_dispositivo: string;
  token_push: string;
  plataforma: 'desktop' | 'android' | 'ios';
  criado_em: string;
  ativo: boolean;
}

export interface NotificacaoPush {
  id: string;
  usuario_id: string;
  titulo: string;
  mensagem: string;
  lida: boolean;
  tipo: 'orcamento' | 'status_servico' | 'estoque_baixo' | 'veiculo_novo';
  criado_em: string;
}

export async function fetchDispositivos(): Promise<Dispositivo[]> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const getLocalFallback = () => getLocalStorageData<Dispositivo>('dispositivos', []);

  if (isLocal || !client) {
    return getLocalFallback();
  }

  try {
    const { data, error } = await client
      .from('dispositivos')
      .select('*')
      .order('criado_em', { ascending: false });
    if (error) {
      console.warn("Tabela de dispositivos ausente ou erro no Supabase, usando local:", error.message);
      return getLocalFallback();
    }
    return data as Dispositivo[];
  } catch (err) {
    return getLocalFallback();
  }
}

export async function registerDispositivo(disp: Omit<Dispositivo, 'id' | 'criado_em'>): Promise<Dispositivo> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const getLocalFallback = () => {
    const list = getLocalStorageData<Dispositivo>('dispositivos', []);
    const novo: Dispositivo = {
      ...disp,
      id: typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : Math.random().toString(36).substring(2, 9),
      criado_em: new Date().toISOString()
    };
    list.unshift(novo);
    saveLocalStorageData('dispositivos', list);
    return novo;
  };

  if (isLocal || !client) {
    return getLocalFallback();
  }

  try {
    const { data, error } = await client
      .from('dispositivos')
      .insert([disp])
      .select();
    if (error) {
      console.warn("Erro ao registrar dispositivo no Supabase, salvando local:", error.message);
      return getLocalFallback();
    }
    return data[0] as Dispositivo;
  } catch (err) {
    return getLocalFallback();
  }
}

export async function deleteDispositivo(id: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const deleteLocal = () => {
    const list = getLocalStorageData<Dispositivo>('dispositivos', []);
    const filtrados = list.filter(d => d.id !== id);
    saveLocalStorageData('dispositivos', filtrados);
    return true;
  };

  if (isLocal || !client) {
    return deleteLocal();
  }

  try {
    const { error } = await client
      .from('dispositivos')
      .delete()
      .eq('id', id);
    if (error) {
      console.warn("Erro ao remover dispositivo no Supabase, removendo local:", error.message);
      return deleteLocal();
    }
    return true;
  } catch (err) {
    return deleteLocal();
  }
}

export async function fetchNotificacoesPush(usuarioId: string): Promise<NotificacaoPush[]> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const getLocalFallback = () => {
    const list = getLocalStorageData<NotificacaoPush>('notificacoes_push', []);
    return list.filter(n => n.usuario_id === usuarioId || n.usuario_id === 'todos');
  };

  if (isLocal || !client) {
    return getLocalFallback();
  }

  try {
    const { data, error } = await client
      .from('notificacoes_push')
      .select('*')
      .or(`usuario_id.eq.${usuarioId},usuario_id.eq.todos`)
      .order('criado_em', { ascending: false });
    if (error) {
      console.warn("Erro ao buscar notificações no Supabase, usando local:", error.message);
      return getLocalFallback();
    }
    return data as NotificacaoPush[];
  } catch (err) {
    return getLocalFallback();
  }
}

export async function createNotificacaoPush(notif: Omit<NotificacaoPush, 'id' | 'criado_em'>): Promise<NotificacaoPush> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const getLocalFallback = () => {
    const list = getLocalStorageData<NotificacaoPush>('notificacoes_push', []);
    const novo: NotificacaoPush = {
      ...notif,
      id: typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : Math.random().toString(36).substring(2, 9),
      criado_em: new Date().toISOString()
    };
    list.unshift(novo);
    saveLocalStorageData('notificacoes_push', list);
    return novo;
  };

  if (isLocal || !client) {
    return getLocalFallback();
  }

  try {
    const { data, error } = await client
      .from('notificacoes_push')
      .insert([notif])
      .select();
    if (error) {
      console.warn("Erro ao disparar notificação no Supabase, salvando local:", error.message);
      return getLocalFallback();
    }
    return data[0] as NotificacaoPush;
  } catch (err) {
    return getLocalFallback();
  }
}

export async function markNotificacoesLidas(usuarioId: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const markLocal = () => {
    const list = getLocalStorageData<NotificacaoPush>('notificacoes_push', []);
    const atualizadas = list.map(n => {
      if (n.usuario_id === usuarioId || n.usuario_id === 'todos') {
        return { ...n, lida: true };
      }
      return n;
    });
    saveLocalStorageData('notificacoes_push', atualizadas);
    return true;
  };

  if (isLocal || !client) {
    return markLocal();
  }

  try {
    const { error } = await client
      .from('notificacoes_push')
      .update({ lida: true })
      .or(`usuario_id.eq.${usuarioId},usuario_id.eq.todos`);
    if (error) {
      console.warn("Erro ao marcar notificações como lidas no Supabase:", error.message);
      return markLocal();
    }
    return true;
  } catch (err) {
    return markLocal();
  }
}

export async function clearNotificacoesPush(usuarioId: string): Promise<boolean> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const clearLocal = () => {
    const list = getLocalStorageData<NotificacaoPush>('notificacoes_push', []);
    const filtrados = list.filter(n => n.usuario_id !== usuarioId && n.usuario_id !== 'todos');
    saveLocalStorageData('notificacoes_push', filtrados);
    return true;
  };

  if (isLocal || !client) {
    return clearLocal();
  }

  try {
    const { error } = await client
      .from('notificacoes_push')
      .delete()
      .or(`usuario_id.eq.${usuarioId},usuario_id.eq.todos`);
    if (error) {
      return clearLocal();
    }
    return true;
  } catch (err) {
    return clearLocal();
  }
}

export async function dispatchAutomatedPush(titulo: string, mensagem: string, tipo: 'orcamento' | 'status_servico' | 'estoque_baixo' | 'veiculo_novo') {
  try {
    // We send this notification to everyone ("todos") so all logged-in devices will query and display it
    await createNotificacaoPush({
      usuario_id: 'todos',
      titulo,
      mensagem,
      lida: false,
      tipo
    });
  } catch (e) {
    console.error("Erro disparando notificação automática:", e);
  }
}

export async function testDatabaseLatency(): Promise<{ success: boolean; latencyMs: number; error?: string }> {
  const isLocal = getDatabaseMode() === 'local';
  const client = getSupabaseClient();
  const start = Date.now();

  if (isLocal || !client) {
    try {
      const _ = getLocalStorageData<any>('usuarios', []);
      const latencyMs = Date.now() - start;
      return { success: true, latencyMs };
    } catch (e: any) {
      return { success: false, latencyMs: 0, error: e.message || 'Erro ao ler banco local' };
    }
  }

  try {
    const { error } = await client
      .from('usuarios')
      .select('id')
      .limit(1);

    const latencyMs = Date.now() - start;
    if (error) {
      return { success: false, latencyMs, error: error.message };
    }
    return { success: true, latencyMs };
  } catch (e: any) {
    const latencyMs = Date.now() - start;
    return { success: false, latencyMs, error: e.message || 'Erro de rede ou conexão' };
  }
}

