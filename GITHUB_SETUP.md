# GitHub 發布設定（教師端）

這個版本已設定好 GitHub Actions。只要把原始檔推送到 `main`，GitHub 便會自動安裝 R 套件、編譯 Bookdown，並更新 GitHub Pages 網站；不需要把本機產生的 `_book/` 上傳到 GitHub。

## 建議的第一次上傳方式：GitHub Desktop

1. 將 ZIP **完整解壓縮**。
2. 安裝並登入 [GitHub Desktop](https://desktop.github.com/)。
3. 在 GitHub Desktop 選擇 **File → Add Local Repository**，選取解壓縮後的 `商業分析R教科書` 資料夾。
4. 若顯示「This directory does not appear to be a Git repository」，按 **create a repository**。
5. Repository name 建議填 `business-analytics-r`，Git ignore 與 License 先選 **None**，按 **Create Repository**。
6. 在左下方 Summary 輸入 `Initial book`，按 **Commit to main**。
7. 按上方 **Publish repository**，確認名稱為 `business-analytics-r`；要讓學生直接閱讀與下載，請取消勾選 **Keep this code private**，再按 **Publish Repository**。

> GitHub Desktop 會連同隱藏的 `.github/workflows/publish-book.yml` 一起提交。這個檔案就是自動編譯與發布設定，請勿刪除。

## 開啟 GitHub Pages

第一次 Publish 後，請在 GitHub 網頁完成一次設定：

1. 進入 `eptchou/business-analytics-r` repository。
2. 選擇 **Settings → Pages**。
3. 在 **Build and deployment** 的 **Source** 選擇 **GitHub Actions**。
4. 進入 **Actions** 分頁，選擇 **Publish Bookdown to GitHub Pages**。
5. 若第一次自動執行顯示紅色叉號，按 **Re-run all jobs**；也可以按 **Run workflow** 手動執行。
6. 等待綠色勾勾後，網站網址通常是：

   <https://eptchou.github.io/business-analytics-r/>

如果 repository 使用不同名稱，網址最後一段也會跟著改變。

## 之後更新教材

1. 在本機修改 `.Rmd`、圖片或樣式。
2. 可先在 RStudio 執行 `build_book.R`，確認本機能成功編譯。
3. 回到 GitHub Desktop，填寫本次修改摘要並按 **Commit to main**。
4. 按 **Push origin**。
5. GitHub Actions 會自動重建網站；通常不需要再進入 Pages 設定。

## 建議每學期建立固定版本

網站會隨每次推送更新。為了讓同一學期的學生取得完全相同的教材，建議學期開始時建立一個 Release：

1. Repository 右側選 **Releases → Create a new release**。
2. 建立新 tag，例如 `2026-fall-v1.0`。
3. Title 可填 `2026 秋季班教材 v1.0`，再按 **Publish release**。

學生可從該 Release 下載固定快照；一般閱讀仍使用 GitHub Pages 最新版。

## 學生如何使用

- **只閱讀教材**：直接開啟 GitHub Pages 網址，不必安裝 R。
- **下載原始碼練習**：在 repository 選 **Code → Download ZIP**，完整解壓縮後雙擊 `business-analytics-r.Rproj`。
- **自行編譯**：在 RStudio 開啟 `build_book.R` 並按 **Source**。

## 發布前可再決定授權

公開 repository 方便學生閱讀與下載，但教材與程式碼的再利用規則仍建議明確標示。常見作法是教材文字採 Creative Commons 授權、程式碼另採 MIT 授權；請依您希望學生與他人如何引用或改作後再加入 License。
