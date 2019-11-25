library(here)
library(rmarkdown)

pasta <- "Rmds"
# arquivo <- "00_apresenta_curso"
# arquivo <- "01_um_ensaio_aleatorizado"
# arquivo <- "02_estrutura"
# arquivo <- "03_inferencia_causal_em_experimentos_aleatorizados"
# arquivo <- "05_entre_estudos_observacionais_e_experimentos"
arquivo <- "01_OficinaDAG_PPGEpi_SII"
# arquivo <- "02_OficinaDAG_PPGEpi"
# arquivo <- "03_OficinaDAG_PPGEpi"

arquivo_rmd <- paste0(arquivo, ".Rmd")
arquivo_pdf <- paste0(arquivo, ".pdf")
input <- here(pasta, arquivo_rmd)
arquivo_r <- paste0(arquivo, ".R")

rmarkdown::render(input = input, 
                  output_format = beamer_presentation(theme = "AnnArbor",
                                                      highlight = "zenburn",
                                                      colortheme = "dolphin",
                                                      fonttheme = "structurebold",
                                                       includes = list(in_header = here("styles", "mystyle.tex")),
                                                      slide_level = 2,
                                                      keep_tex = FALSE,
                                                      fig_caption = FALSE),
                  output_file = arquivo_pdf,
                  output_dir = here("output_pdf"),
                  encoding = "UTF-8")

knitr::purl(input = input,
            output = here("RScripts", arquivo_r),
            documentation = 1,
            encoding = "UTF-8")
