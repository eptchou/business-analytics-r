# 商業分析與 R（教科書）

以 bookdown 製作的教科書專案，由「商業分析（R）」課程講義整理而成，共 15 章，涵蓋 R 基礎、機器學習、社群網路、A/B 測試與資料分析流程。

## 線上閱讀與自動發布

本專案已設定 GitHub Actions。每次將修改推送到 `main` 後，GitHub 會自動編譯 Bookdown 並更新 GitHub Pages，不必提交本機產生的 `_book/`。

若 repository 使用建議名稱 `business-analytics-r`，線上教材網址為：

<https://eptchou.github.io/business-analytics-r/>

第一次上傳與 Pages 開啟方式請見 [GitHub 發布設定](GITHUB_SETUP.md)。

## 專案結構

```
商業分析R教科書/
├── .github/workflows/          # GitHub 自動編譯與發布設定
├── business-analytics-r.Rproj  # RStudio 專案入口（先雙擊這個）
├── build_book.R                # 自動檢查套件並編譯 HTML
├── DESCRIPTION                 # GitHub Actions 使用的 R 套件清單
├── GITHUB_SETUP.md             # 教師端第一次發布與更新步驟
├── index.Rmd                    # 前言、使用說明、環境設定
├── 01-r-basics.Rmd             # 第 1 章：R 基礎與資料處理
├── 02-tidyverse.Rmd            # 第 2 章：資料轉換與整理 tidyverse
├── 03-functions.Rmd            # 第 3 章：自訂函數與流程控制
├── 04-probability.Rmd          # 第 4 章：機率分配
├── 05-visualization.Rmd        # 第 5 章：視覺化與探索式資料分析
├── 06-regression.Rmd           # 第 6 章：迴歸分析
├── 07-glm.Rmd                  # 第 7 章：廣義線性模型 GLM
├── 08-resampling.Rmd           # 第 8 章：訓練集、測試集與重抽樣
├── 09-unsupervised.Rmd         # 第 9 章：非監督式學習（分群）
├── 10-supervised.Rmd           # 第 10 章：監督式學習（分類）
├── 11-dimension-reduction.Rmd  # 第 11 章：維度縮減 PCA
├── 12-text-mining.Rmd          # 第 12 章：中文文字探勘
├── 13-network.Rmd              # 第 13 章：社群網路分析
├── 14-abtest.Rmd               # 第 14 章：A/B 測試
├── 15-overview.Rmd             # 第 15 章：資料分析總覽
├── _bookdown.yml               # 章節順序與書名設定
├── _output.yml                 # 輸出格式（bs4_book HTML / PDF）
├── style.css                   # 自訂樣式
└── fig/                        # 圖檔（含 A/B 測試決策流程圖 .png / .svg）
```

## 最簡單的編譯方式（RStudio）

1. 先把 ZIP **完整解壓縮**，不要直接在 ZIP 裡開檔。
2. 雙擊 `business-analytics-r.Rproj`，讓 RStudio 以本資料夾為專案根目錄。
3. 開啟 `build_book.R`，按右上角的 **Source**。
4. 第一次執行時，程式會自動安裝缺少的套件；完成後會產生 `_book/` 資料夾。
5. 開啟 `_book/index.html`，即可瀏覽整本 HTML 教科書。

`build_book.R` 會檢查這本書真正需要的套件：`bookdown`、`rmarkdown`、`knitr`、`tidyverse`。第 12 章使用 Python 的 `jieba`，且該章程式碼在編書時預設不執行，因此**不需要安裝 `jiebaR` 才能編譯本書**。

若希望直接在 Console 執行，也可使用：

```r
source("build_book.R")
```

熟悉 bookdown 後，也可以手動執行：

```r
bookdown::render_book("index.Rmd", "bookdown::bs4_book")  # HTML
bookdown::render_book("index.Rmd", "bookdown::pdf_book") # PDF（另需 LaTeX）
```

## R Markdown 的 chunk 在哪裡？

Chunk 就是 `.Rmd` 檔中由三個反引號包住的 R 程式區塊，例如：

````markdown
```{r example}
summary(cars)
```
````

在 RStudio 裡開啟任一章 `.Rmd` 後，每個 chunk 右上角的綠色三角形可執行該段程式。編譯整本書時不必逐一執行 chunk，直接執行 `build_book.R` 即可。

## 關於程式碼與輸出

* 各章的程式碼皆為**可執行的 live chunk**（未貼上預先算好的輸出）。以 R + bookdown 編譯時，knitr 會自動執行並產生正確輸出。
* 部分章節（如第 12、13、14 章）依賴外部資料檔或較多套件，`.Rmd` 中相關 chunk 預設 `eval = FALSE`；請在備妥資料與套件的環境中，移除該選項或改為 `eval = TRUE` 後再編譯。
* 需要外部資料檔（如 `carsale.Rda`、`salesdata.csv`、`kidiq.dta`、`chou2026.dat` 等）的章節，請把資料檔放在專案資料夾中再編譯。

## 加入或調整章節

1. 新增檔案（例如 `15-xxx.Rmd`），第一行以 `# 章名 {#anchor}` 開頭。
2. 在 `_bookdown.yml` 的 `rmd_files` 清單中依序加入該檔名。

## 各章對應的原始講義

| 章 | 主題 | 對應講義 | 課堂實作 (.R) |
|----|------|----------|----------------|
| 1 | R 基礎與資料處理 | Lec1-basic | （本章程式碼即示範） |
| 2 | tidyverse 資料整理 | Lec2-tidyverse | lec2.R |
| 3 | 自訂函數與流程控制 | Lec3-function | Lec3 R codes.R |
| 4 | 機率分配 | Lec4-probdensity | — |
| 5 | 視覺化與 EDA | Lec3-EDA / Lec5.2 | Lec5 ggplot codes.R / Lec5.2 example r codes.R |
| 6 | 迴歸分析 | Lec6-Regression | Lec6 Regression codes.R |
| 7 | 廣義線性模型 GLM | Lec7-GLM | Lec7 r codes.R |
| 8 | 訓練/測試與重抽樣 | Lec8-train_and_test | Lec8 r codes.R |
| 9 | 非監督式學習 | Lec9 ML-unsupervised | Lec9 r codes.R |
| 10 | 監督式學習 | Lec10 ML-supervised | Lec10 r codes.R |
| 11 | 維度縮減 | Lec11 dimension reduction | Lec 11-dimred codes.R |
| 12 | 中文文字探勘 | （文字探勘） | textmining2026.R |
| 13 | 社群網路分析 | Lec14 social network | Lec14 R codes.R |
| 14 | A/B 測試 | Lec14 ab-test | Lec14.R（abtest.RData） |
| 15 | 資料分析總覽 | lec15 統計分析 | —（概念總覽章） |
