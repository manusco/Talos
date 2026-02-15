# talos.ps1 - The System Check for Talos v0.1 (Windows)

Write-Host "🔮 Talos v0.1 System Check:"
Write-Host "================================================"

# 1. Check Framework
if (-not (Test-Path "talos\0_framework")) {
    Write-Host "❌ CRITICAL: Framework missing (talos\0_framework)." -ForegroundColor Red
    exit 1
}
Write-Host "✅ Framework Active" -ForegroundColor Green

# 2. Check Strategy (The Soul)
if (-not (Test-Path "talos\1_strategy\MANIFESTO.md")) {
    Write-Host "⚠️  MISSING SOUL: talos\1_strategy\MANIFESTO.md not found." -ForegroundColor Yellow
    Write-Host "👉 Run '@Talos run init' in your chat to initialize your organization."
} else {
    Write-Host "✅ Soul Detected" -ForegroundColor Green
}

# 3. Check Context (The Brain)
if (-not (Test-Path "talos\2_context\memory")) {
    New-Item -ItemType Directory -Force -Path "talos\2_context\memory" | Out-Null
    Write-Host "   Created memory\ directory."
}
Write-Host "✅ Context Ready" -ForegroundColor Green

# 4. Check Workflows & Skills
$workflowCount = (Get-ChildItem -Path "talos\3_workflows\*.md" -ErrorAction SilentlyContinue).Count
$skillCount = (Get-ChildItem -Path "talos\4_skills\*\*" -ErrorAction SilentlyContinue).Count

Write-Host "✅ Workflows: $workflowCount" -ForegroundColor Green
Write-Host "✅ Skills: $skillCount" -ForegroundColor Green

Write-Host "================================================"
Write-Host "System Online." -ForegroundColor Green
