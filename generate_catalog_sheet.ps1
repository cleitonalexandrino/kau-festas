# Script para gerar a planilha oficial de produtos e servicos Kau Festas
$targetPath = "C:\Users\Cleiton\OneDrive\ANTIGRAVITY_MY_ONEDRIVE\KAUANE\Catalogo_Produtos_Kau_Festas.xlsx"

# Dados dos produtos
$products = @(
    # DOCES
    [PSCustomObject]@{ Categoria = "Doces Artesanais"; ID = "doce-cascone"; Nome = "Cascone Artesanal Recheado"; Preco = "A partir de R$ 12,00"; Dimensoes = "+25 opções de recheios gourmet"; Descricao = "Casquinha crocante banhada no chocolate nobre e recheada com mais de 25 opções de sabores artesanais: Clássicos, Frutados, Nutella & Chocolates Famosos e Especiais Pistache e Morango."; Selo = "Mais Vendido" },
    [PSCustomObject]@{ Categoria = "Doces Artesanais"; ID = "doce-brigadeiro-box"; Nome = "Caixinha de Brigadeiros Artesanais (4 unid)"; Preco = "R$ 12,00"; Dimensoes = "Caixinha presenteável c/ 4 brigadeiros"; Descricao = "Brigadeiros feitos artesanalmente com textura aveludada e confeitos selecionados: Tradicional nobre, M&M's, Castanha/Amendoim, Ninho, Bicho de Pé e Paçoca crocante."; Selo = "Destaque" },
    [PSCustomObject]@{ Categoria = "Doces Artesanais"; ID = "doce-premium-box"; Nome = "Caixinha Seleção Premium (4 unid)"; Preco = "R$ 15,00"; Dimensoes = "4 doces finos artesanais com acabamento dourado"; Descricao = "Experiência gourmet refinada: Flor Esculpida com pérola dourada, Crocante com Ganache de castanhas, Branco Nobre e Explosão Crocante."; Selo = "Gourmet" },
    [PSCustomObject]@{ Categoria = "Doces Artesanais"; ID = "doce-pasta-americana"; Nome = "Doces Finos em Pasta Americana"; Preco = "R$ 13,00 a R$ 15,00 / un"; Dimensoes = "Modelagem 100% personalizada no tema da sua festa"; Descricao = "Pão de Mel Personalizado (R$ 15,00), Cone Trufado Esculpido 3D (R$ 15,00) e Maçã Banhada no Chocolate com laço (R$ 13,00). Modelamos qualquer tema (Safari, Circo, Princesas, etc.)."; Selo = "Personalizado" },
    [PSCustomObject]@{ Categoria = "Doces Artesanais"; ID = "doce-casamento-50"; Nome = "Caixa Seleção Festa & Casamento (50 Doces)"; Preco = "A partir de R$ 140,00 (R$ 2,80 / un)"; Dimensoes = "Caixa com 50 doces finos decorados"; Descricao = "30x Corações de Chocolate com Alianças Douradas, 5x Flores Esculpidas com Pérola, 5x Rosas em Chocolate Branco, 5x Surpresas de Uva Thompson e 5x Brigadeiros Gourmet."; Selo = "Especialidade" },
    [PSCustomObject]@{ Categoria = "Doces Artesanais"; ID = "doce-bolo-chocolatudo"; Nome = "Bolo Artesanal Chocolatudo Gourmet"; Preco = "A partir de R$ 90,00 / kg"; Dimensoes = "A partir de 1 kg (rende 8 a 10 fatias/kg)"; Descricao = "Massa molhadinha de cacau, recheio farto de brigadeiro nobre, granulados tipo split nas laterais e coroado com 3 brigadeiros artesanais grandes no topo. Acompanha base protetora."; Selo = "Mais Pedido" },
    [PSCustomObject]@{ Categoria = "Doces Artesanais"; ID = "doce-bolo-pote"; Nome = "Bolo no Pote Artesanal & Cremoso"; Preco = "R$ 15,00 a R$ 20,00"; Dimensoes = "Embalagem individual lacrada de 250ml"; Descricao = "Camadas generosas de massa macia e recheio aveludado: Tradicional Brigadeiro (R$ 15), Prestígio Branco de Coco (R$ 15) e Duo Supremo com Nutella pura (R$ 20)."; Selo = "Sobremesa" },

    # SALGADOS & TORTAS
    [PSCustomObject]@{ Categoria = "Salgados & Tortas"; ID = "salgado-1"; Nome = "Cento de Salgados Fritos Tradicionais"; Preco = "R$ 90,00 / cento"; Dimensoes = "100 unidades (10g a 20g cada)"; Descricao = "Coxinhas crocantes de frango desfiado, Bolinhas de queijo cremosas com orégano, Kibe recheado artesanal e Risoles de presunto e queijo fritos na hora do seu evento."; Selo = "Mais Vendido" },
    [PSCustomObject]@{ Categoria = "Salgados & Tortas"; ID = "salgado-2"; Nome = "Cento de Salgados Assados & Folhados"; Preco = "R$ 115,00 / cento"; Dimensoes = "100 unidades assadas na hora"; Descricao = "Mini esfihas abertas e fechadas de carne nobre, empadinhas cremosas de palmito e frango, e folhadinhos delicados de peito de peru com ricota."; Selo = "Especialidade" },
    [PSCustomObject]@{ Categoria = "Salgados & Tortas"; ID = "salgado-3"; Nome = "Kit Salgados Festa Mista (Fritos & Assados)"; Preco = "A partir de R$ 95,00 / cento"; Dimensoes = "Mix com 4 sabores à sua escolha"; Descricao = "Monte sua combinação ideal entre opções fritas e assadas. Produzidos com massa leve, sem excesso de gordura e entregues quentinhos para a sua festa."; Selo = "Favorito" },
    [PSCustomObject]@{ Categoria = "Salgados & Tortas"; ID = "doce-tortinhas"; Nome = "Mini Tortinhas Artesanais (Cento ou Meio Cento)"; Preco = "Cento R$ 170,00 | Meio Cento R$ 80,00"; Dimensoes = "Massa crocante amanteigada que derrete na boca"; Descricao = "Minitortinhas artesanais com cremes aveludados nos sabores: Limão Fresco com raspas e Maracujá com geleia natural e sementes crocantes. Ideais para aniversários e casamentos."; Selo = "Novidade" },

    # KITS FESTA & DECORAÇÕES
    [PSCustomObject]@{ Categoria = "Kits Festa & Buffet"; ID = "festa-kit-p"; Nome = "Kit Festa P (Até 10 pessoas)"; Preco = "R$ 195,00"; Dimensoes = "1 kg Bolo + 50 Docinhos + 100 Salgados"; Descricao = "Ideal para celebrações intimistas e familiares. Inclui 1 kg de bolo confeitado recheado, 50 docinhos de 10g e 100 salgadinhos de festa fresquinhos."; Selo = "Econômico" },
    [PSCustomObject]@{ Categoria = "Kits Festa & Buffet"; ID = "festa-kit-m"; Nome = "Kit Festa M (15 a 20 pessoas)"; Preco = "R$ 310,00"; Dimensoes = "2 kg Bolo + 100 Docinhos + 100 Salgados"; Descricao = "O tamanho mais pedido para comemorações! Inclui 2 kg de bolo artesanal recheado, 100 docinhos de 10g e 100 salgados fritos/assados."; Selo = "Mais Vendido" },
    [PSCustomObject]@{ Categoria = "Kits Festa & Buffet"; ID = "festa-kit-g"; Nome = "Kit Festa G (Até 40 pessoas)"; Preco = "R$ 700,00"; Dimensoes = "4 kg Bolo + 200 Docinhos + 300 Salgados + Topo"; Descricao = "Festa completa sem preocupações! 4 kg de bolo temático com topo personalizado, 200 docinhos enrolados e 300 salgadinhos generosos de 20g."; Selo = "Super Festa" },
    [PSCustomObject]@{ Categoria = "Decorações Temáticas"; ID = "decor-kit-p"; Nome = "Kit Decoração P (Pocket)"; Preco = "R$ 230,00 (ou R$ 150,00 sem bexiga)"; Dimensoes = "Painel Redondo + 3 Cilindros com Capas"; Descricao = "1 painel de fundo redondo, 3 cilindros com 4 capas temáticas, 1 arco desconstruído de bexigas, 1 tapete de chão, 4 bandejas e 2 vasos com flores."; Selo = "Pocket" },
    [PSCustomObject]@{ Categoria = "Decorações Temáticas"; ID = "decor-kit-m"; Nome = "Kit Decoração M"; Preco = "R$ 250,00 (ou R$ 190,00 sem bexiga)"; Dimensoes = "Painel de Fundo + Cômoda Fake + 3 Cilindros"; Descricao = "1 painel de fundo, 1 cômoda fake decorativa, 3 cilindros com 4 capas temáticas, 1 arco orgânico de balões, 1 tapete de chão e 4 bandejas."; Selo = "Destaque" },
    [PSCustomObject]@{ Categoria = "Decorações Temáticas"; ID = "decor-kit-g"; Nome = "Kit Decoração G (Grande Completo)"; Preco = "R$ 400,00 (ou R$ 320,00 sem bexiga)"; Dimensoes = "2 Painéis + 2 Arcos Bexigas + Cômoda + Bolo Fake"; Descricao = "1 cômoda fake, 1 bolo fake, 2 painéis temáticos, 5 capas, 2 arcos volumosos de bexigas, 1 tapete de chão, 5 bandejas de doces e 2 vasos com arranjos."; Selo = "Espetáculo" },

    # LOCAÇÃO DE BRINQUEDOS
    [PSCustomObject]@{ Categoria = "Locação de Brinquedos"; ID = "brinquedo-pula-pula"; Nome = "Cama Elástica / Pula-Pula com Rede de Proteção"; Preco = "R$ 400,00 / diária"; Dimensoes = "Rede de proteção reforçada + hastes acolchoadas"; Descricao = "O clássico que nunca pode faltar na comemoração! Conta com rede de proteção alta e resistente, hastes revestidas com protetores macios anti-impacto, lona de salto e escadinha de acesso. Totalmente higienizado."; Selo = "Mais Pedido" },
    [PSCustomObject]@{ Categoria = "Locação de Brinquedos"; ID = "brinquedo-piscina-bolinhas"; Nome = "Piscina de Bolinhas Espumada Colorida (1m)"; Preco = "R$ 250,00 / diária"; Dimensoes = "Estrutura espumada macia com bolinhas atóxicas"; Descricao = "O cantinho preferido dos bebês e crianças pequenas! Borda espumada super macia que evita batidas e machucados, revestida em lona colorida higienizada e recheada com centenas de bolinhas atóxicas."; Selo = "Espaço Kids" },
    [PSCustomObject]@{ Categoria = "Locação de Brinquedos"; ID = "brinquedo-cavalinhos"; Nome = "Cavalinhos de Balanço Clássicos"; Preco = "1 por R$ 60,00 | 2 por R$ 100,00"; Dimensoes = "Tons vibrantes (azul e rosa) para espaço baby"; Descricao = "Sucesso garantido no espaço baby! Formato ergonômico com apoio para os pés, base curva estável que evita tombamento e pegadores firmes para as mãozinhas."; Selo = "Baby" },
    [PSCustomObject]@{ Categoria = "Locação de Brinquedos"; ID = "brinquedo-jabuti"; Nome = "Gangorra Infantil Jabuti Recreativo"; Preco = "R$ 100,00 / diária"; Dimensoes = "Plástico rotomoldado reforçado c/ casco duplo"; Descricao = "Divertido, seguro e visualmente encantador! Estimula o equilíbrio, a coordenação motora e a socialização das crianças menores. Cantos totalmente arredondados."; Selo = "Lúdico" },
    [PSCustomObject]@{ Categoria = "Locação de Brinquedos"; ID = "brinquedo-combo-completo"; Nome = "Super Combo da Diversão (Todos os Brinquedos)"; Preco = "De R$ 850,00 por apenas R$ 500,00"; Dimensoes = "Pula-Pula + Piscina de Bolinhas + Jabuti + 2 Cavalinhos"; Descricao = "Transforme o seu evento em um verdadeiro parque infantil! Leve o combo completo com montagem e instalação inclusas, brinquedos 100% higienizados e desconto especial de R$ 350,00."; Selo = "Super Promoção" }
)

$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$excel.DisplayAlerts = $false

$wb = $excel.Workbooks.Add()

# Função para estilizar uma aba
function Format-CatalogSheet($sheet, $title, $items, $sheetColorIndex) {
    # Título do Banner
    $sheet.Range("A1:G1").Merge()
    $sheet.Range("A1").Value2 = "🎈 KAU FESTAS — $title"
    $sheet.Range("A1").Font.Name = "Segoe UI"
    $sheet.Range("A1").Font.Size = 15
    $sheet.Range("A1").Font.Bold = $true
    $sheet.Range("A1").Font.Color = 0xFFFFFF
    $sheet.Range("A1").Interior.Color = 0x54238A # Roxo / Vinho elegante (BGR: B=0x54, G=0x23, R=0x8A)
    $sheet.Range("A1").HorizontalAlignment = -4108 # Center
    $sheet.Range("A1").VerticalAlignment = -4108 # Center
    $sheet.Range("A1:G1").RowHeight = 35

    # Subtítulo com contato e garantia
    $sheet.Range("A2:G2").Merge()
    $sheet.Range("A2").Value2 = "WhatsApp: (11) 96979-8162 | São Paulo - SP | Reserva garantida com 50% de sinal | Tabela atualizada 2026"
    $sheet.Range("A2").Font.Name = "Segoe UI"
    $sheet.Range("A2").Font.Size = 10
    $sheet.Range("A2").Font.Italic = $true
    $sheet.Range("A2").Font.Color = 0x444444
    $sheet.Range("A2").Interior.Color = 0xF5EAF0
    $sheet.Range("A2").HorizontalAlignment = -4108
    $sheet.Range("A2").VerticalAlignment = -4108
    $sheet.Range("A2:G2").RowHeight = 22

    # Linha em branco
    $sheet.Range("A3:G3").RowHeight = 8

    # Cabeçalho da Tabela
    $headers = @("Categoria", "Código / ID", "Produto / Serviço", "Preço de Tabela", "Tamanho / Rendimento / Especificação", "Descrição Detalhada", "Destaque")
    for ($c = 0; $c -lt $headers.Count; $c++) {
        $cell = $sheet.Cells.Item(4, $c + 1)
        $cell.Value2 = $headers[$c]
        $cell.Font.Name = "Segoe UI"
        $cell.Font.Size = 11
        $cell.Font.Bold = $true
        $cell.Font.Color = 0xFFFFFF
        $cell.Interior.Color = 0x822D68 # BGR: R=104, G=45, B=130
        $cell.HorizontalAlignment = -4108
        $cell.VerticalAlignment = -4108
    }
    $sheet.Range("A4:G4").RowHeight = 26

    # Preenchimento das Linhas
    $row = 5
    foreach ($item in $items) {
        $sheet.Cells.Item($row, 1).Value2 = $item.Categoria
        $sheet.Cells.Item($row, 2).Value2 = $item.ID
        $sheet.Cells.Item($row, 3).Value2 = $item.Nome
        $sheet.Cells.Item($row, 4).Value2 = $item.Preco
        $sheet.Cells.Item($row, 5).Value2 = $item.Dimensoes
        $sheet.Cells.Item($row, 6).Value2 = $item.Descricao
        $sheet.Cells.Item($row, 7).Value2 = $item.Selo

        # Formatação das linhas
        $rowRange = $sheet.Range("A$row`:G$row")
        $rowRange.Font.Name = "Segoe UI"
        $rowRange.Font.Size = 10
        $rowRange.VerticalAlignment = -4108 # Center

        # Zebrado
        if ($row % 2 -eq 0) {
            $rowRange.Interior.Color = 0xFAF5F8
        } else {
            $rowRange.Interior.Color = 0xFFFFFF
        }

        # Destaque de negrito no nome e preço
        $sheet.Cells.Item($row, 3).Font.Bold = $true
        $sheet.Cells.Item($row, 4).Font.Bold = $true
        $sheet.Cells.Item($row, 4).Font.Color = 0x1A6A2E # Verde escuro nobre

        # Alinhamentos
        $sheet.Cells.Item($row, 1).HorizontalAlignment = -4108 # Center
        $sheet.Cells.Item($row, 2).HorizontalAlignment = -4108 # Center
        $sheet.Cells.Item($row, 4).HorizontalAlignment = -4108 # Center
        $sheet.Cells.Item($row, 7).HorizontalAlignment = -4108 # Center

        # Quebra de texto nas colunas longas
        $sheet.Cells.Item($row, 3).WrapText = $true
        $sheet.Cells.Item($row, 5).WrapText = $true
        $sheet.Cells.Item($row, 6).WrapText = $true

        $row++
    }

    # Bordas
    $tableRange = $sheet.Range("A4:G" + ($row - 1))
    $tableRange.Borders.LineStyle = 1 # xlContinuous
    $tableRange.Borders.Color = 0xDDDDDD

    # Larguras personalizadas
    $sheet.Columns.Item(1).ColumnWidth = 22 # Categoria
    $sheet.Columns.Item(2).ColumnWidth = 18 # ID
    $sheet.Columns.Item(3).ColumnWidth = 32 # Produto
    $sheet.Columns.Item(4).ColumnWidth = 24 # Preco
    $sheet.Columns.Item(5).ColumnWidth = 32 # Rendimento
    $sheet.Columns.Item(6).ColumnWidth = 55 # Descricao
    $sheet.Columns.Item(7).ColumnWidth = 18 # Destaque

    # Congelar painéis no cabeçalho
    $sheet.Activate()
    $sheet.Range("A5").Select() | Out-Null
    $excel.ActiveWindow.FreezePanes = $true
}

# 1. Aba Geral (Todos os Itens)
$sheetAll = $wb.Worksheets.Item(1)
$sheetAll.Name = "Catálogo Completo"
Format-CatalogSheet -sheet $sheetAll -title "Catálogo Oficial de Produtos e Serviços" -items $products

# 2. Aba Doces & Bolos
$sheetDoces = $wb.Worksheets.Add([System.Reflection.Missing]::Value, $sheetAll)
$sheetDoces.Name = "Doces & Bolos"
$docesItems = $products | Where-Object { $_.Categoria -eq "Doces Artesanais" }
Format-CatalogSheet -sheet $sheetDoces -title "Doces Artesanais & Bolos Gourmet" -items $docesItems

# 3. Aba Salgados & Tortas
$sheetSalgados = $wb.Worksheets.Add([System.Reflection.Missing]::Value, $sheetDoces)
$sheetSalgados.Name = "Salgados & Tortas"
$salgadosItems = $products | Where-Object { $_.Categoria -eq "Salgados & Tortas" }
Format-CatalogSheet -sheet $sheetSalgados -title "Salgados Fritos, Assados & Tortinhas" -items $salgadosItems

# 4. Aba Decorações & Kits Festa
$sheetKits = $wb.Worksheets.Add([System.Reflection.Missing]::Value, $sheetSalgados)
$sheetKits.Name = "Kits Festa & Decorações"
$kitsItems = $products | Where-Object { $_.Categoria -like "*Kits*" -or $_.Categoria -like "*Decorações*" }
Format-CatalogSheet -sheet $sheetKits -title "Kits Festa Completos & Decorações Temáticas" -items $kitsItems

# 5. Aba Locação de Brinquedos
$sheetBrinquedos = $wb.Worksheets.Add([System.Reflection.Missing]::Value, $sheetKits)
$sheetBrinquedos.Name = "Locação de Brinquedos"
$brinquedosItems = $products | Where-Object { $_.Categoria -eq "Locação de Brinquedos" }
Format-CatalogSheet -sheet $sheetBrinquedos -title "Espaço Infantil & Locação de Brinquedos" -items $brinquedosItems

# Voltar o foco para a primeira aba
$sheetAll.Activate()
$sheetAll.Range("A1").Select() | Out-Null

# Salvar
if (Test-Path $targetPath) {
    Remove-Item -Path $targetPath -Force
}
$wb.SaveAs($targetPath)
$wb.Close($false)
$excel.Quit()

[System.Runtime.Interopservices.Marshal]::ReleaseComObject($sheetAll) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($sheetDoces) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($sheetSalgados) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($sheetKits) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($sheetBrinquedos) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

Write-Output "SUCESSO: Planilha gerada com sucesso em $targetPath"
