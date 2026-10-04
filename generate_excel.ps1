$jsonPath = "C:\Users\Cleiton\OneDrive\ANTIGRAVITY_MY_ONEDRIVE\KAUANE\catalogo_data.json"
$targetXlsx = "C:\Users\Cleiton\OneDrive\ANTIGRAVITY_MY_ONEDRIVE\KAUANE\Tabela_Produtos_Kau_Festas_2026.xlsx"

$jsonData = Get-Content -Path $jsonPath -Raw -Encoding UTF8 | ConvertFrom-Json

$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$excel.DisplayAlerts = $false

$wb = $excel.Workbooks.Add()

function Setup-Worksheet($ws, $titleText, $itemsList) {
    # 1. Header Banner
    $bannerRange = $ws.Range("A1:G1")
    $bannerRange.Merge()
    $bannerRange.Value2 = "KAU FESTAS - " + $titleText
    $bannerRange.Font.Name = "Segoe UI"
    $bannerRange.Font.Size = 14
    $bannerRange.Font.Bold = $true
    $bannerRange.Font.Color = 16777215 # White
    $bannerRange.Interior.Color = 8390776 # Dark Berry / Rose Gold
    $bannerRange.HorizontalAlignment = -4108
    $bannerRange.VerticalAlignment = -4108
    $bannerRange.RowHeight = 32

    # 2. Subtitle Banner
    $subRange = $ws.Range("A2:G2")
    $subRange.Merge()
    $subRange.Value2 = "WhatsApp: (11) 96979-8162 | Sao Paulo - SP | Reserva com 50% de sinal | Catalogo 2026"
    $subRange.Font.Name = "Segoe UI"
    $subRange.Font.Size = 10
    $subRange.Font.Italic = $true
    $subRange.Font.Color = 3355443
    $subRange.Interior.Color = 15722485 # Light blush
    $subRange.HorizontalAlignment = -4108
    $subRange.VerticalAlignment = -4108
    $subRange.RowHeight = 20

    $ws.Range("A3:G3").RowHeight = 6

    # 3. Column Headers
    $headers = @("Categoria", "Codigo", "Produto / Servico", "Preco de Tabela", "Especificacao / Rendimento", "Descricao Detalhada", "Destaque")
    for ($i = 0; $i -lt $headers.Count; $i++) {
        $c = $ws.Cells.Item(4, $i + 1)
        $c.Value2 = $headers[$i]
        $c.Font.Name = "Segoe UI"
        $c.Font.Size = 11
        $c.Font.Bold = $true
        $c.Font.Color = 16777215
        $c.Interior.Color = 6961520 # Deep Plum
        $c.HorizontalAlignment = -4108
        $c.VerticalAlignment = -4108
    }
    $ws.Range("A4:G4").RowHeight = 25

    # 4. Populate rows
    $r = 5
    foreach ($item in $itemsList) {
        $ws.Cells.Item($r, 1).Value2 = $item.categoria
        $ws.Cells.Item($r, 2).Value2 = $item.id
        $ws.Cells.Item($r, 3).Value2 = $item.nome
        $ws.Cells.Item($r, 4).Value2 = $item.preco
        $ws.Cells.Item($r, 5).Value2 = $item.dimensoes
        $ws.Cells.Item($r, 6).Value2 = $item.descricao
        $ws.Cells.Item($r, 7).Value2 = $item.selo

        $rowR = $ws.Range("A$r`:G$r")
        $rowR.Font.Name = "Segoe UI"
        $rowR.Font.Size = 10
        $rowR.VerticalAlignment = -4108

        if ($r % 2 -eq 0) {
            $rowR.Interior.Color = 16447228 # Zebra tint
        } else {
            $rowR.Interior.Color = 16777215
        }

        # Styling columns
        $ws.Cells.Item($r, 1).HorizontalAlignment = -4108
        $ws.Cells.Item($r, 2).HorizontalAlignment = -4108
        $ws.Cells.Item($r, 3).Font.Bold = $true
        $ws.Cells.Item($r, 4).Font.Bold = $true
        $ws.Cells.Item($r, 4).Font.Color = 25600 # Greenish
        $ws.Cells.Item($r, 4).HorizontalAlignment = -4108
        $ws.Cells.Item($r, 7).HorizontalAlignment = -4108

        $ws.Cells.Item($r, 3).WrapText = $true
        $ws.Cells.Item($r, 5).WrapText = $true
        $ws.Cells.Item($r, 6).WrapText = $true

        $r++
    }

    # Borders
    $tRange = $ws.Range("A4:G" + ($r - 1))
    $tRange.Borders.LineStyle = 1
    $tRange.Borders.Color = 14474460

    # Column Widths
    $ws.Columns.Item(1).ColumnWidth = 24
    $ws.Columns.Item(2).ColumnWidth = 20
    $ws.Columns.Item(3).ColumnWidth = 32
    $ws.Columns.Item(4).ColumnWidth = 26
    $ws.Columns.Item(5).ColumnWidth = 34
    $ws.Columns.Item(6).ColumnWidth = 56
    $ws.Columns.Item(7).ColumnWidth = 18

    # Freeze panes
    $ws.Activate()
    $ws.Range("A5").Select() | Out-Null
    $excel.ActiveWindow.FreezePanes = $true
}

# Sheet 1: Catalogo Geral
$s1 = $wb.Worksheets.Item(1)
$s1.Name = "Catalogo Completo"
Setup-Worksheet $s1 "Catalogo Oficial de Produtos e Servicos" $jsonData

# Sheet 2: Doces
$s2 = $wb.Worksheets.Add([System.Reflection.Missing]::Value, $s1)
$s2.Name = "Doces e Bolos"
$doces = $jsonData | Where-Object { $_.categoria -eq "Doces Artesanais" }
Setup-Worksheet $s2 "Doces Finos e Bolos Gourmet" $doces

# Sheet 3: Salgados
$s3 = $wb.Worksheets.Add([System.Reflection.Missing]::Value, $s2)
$s3.Name = "Salgados e Tortas"
$salgados = $jsonData | Where-Object { $_.categoria -eq "Salgados e Tortas" }
Setup-Worksheet $s3 "Centos de Salgados e Tortinhas" $salgados

# Sheet 4: Kits & Decoracao
$s4 = $wb.Worksheets.Add([System.Reflection.Missing]::Value, $s3)
$s4.Name = "Kits Festa e Decoracao"
$kits = $jsonData | Where-Object { $_.categoria -eq "Kits Festa e Buffet" -or $_.categoria -eq "Decoracoes Tematicas" }
Setup-Worksheet $s4 "Kits Festa e Decoracoes Tematicas" $kits

# Sheet 5: Brinquedos
$s5 = $wb.Worksheets.Add([System.Reflection.Missing]::Value, $s4)
$s5.Name = "Locacao de Brinquedos"
$brinquedos = $jsonData | Where-Object { $_.categoria -eq "Locacao de Brinquedos" }
Setup-Worksheet $s5 "Espaco Kids e Brinquedos Infantis" $brinquedos

# Select first sheet
$s1.Activate()
$s1.Range("A1").Select() | Out-Null

if (Test-Path $targetXlsx) {
    Remove-Item -Path $targetXlsx -Force
}

$wb.SaveAs($targetXlsx)
$wb.Close($false)
$excel.Quit()

[System.Runtime.Interopservices.Marshal]::ReleaseComObject($s1) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($s2) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($s3) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($s4) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($s5) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

Write-Output "SUCESSO_GERACAO: $targetXlsx"
