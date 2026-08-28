options(repos = c(CRAN = "https://cloud.r-project.org"))

required_packages <- c("bookdown", "rmarkdown", "knitr", "tidyverse")
is_installed <- vapply(
  required_packages,
  requireNamespace,
  quietly = TRUE,
  FUN.VALUE = logical(1)
)

missing_packages <- required_packages[!is_installed]

if (length(missing_packages) > 0) {
  message(
    "正在安裝缺少的套件：",
    paste(missing_packages, collapse = ", ")
  )
  install.packages(missing_packages)
}

still_missing <- required_packages[
  !vapply(
    required_packages,
    requireNamespace,
    quietly = TRUE,
    FUN.VALUE = logical(1)
  )
]

if (length(still_missing) > 0) {
  stop(
    "下列套件尚未成功安裝：",
    paste(still_missing, collapse = ", "),
    "\n請把 Console 最後的紅色錯誤訊息保留下來。",
    call. = FALSE
  )
}

# 上次編譯失敗時可能留下合併檔。每次重建前先清除，避免誤開或誤編。
merged_files <- c("business-analytics-r.Rmd", "business-analytics-r.md")
unlink(merged_files[file.exists(merged_files)])

bookdown::render_book(
  input = "index.Rmd",
  output_format = "bookdown::bs4_book",
  clean = TRUE
)

message(
  "\n編譯完成。請開啟：",
  normalizePath("_book/index.html", mustWork = FALSE)
)
