# install.packages('renv')

# Tutorial
# o pacote renv salva a versão do R e dos pacotes usados em um projeto do Rstudio.
# ele permite a reproducibilidade do código.
# https://rstudio.github.io/renv/articles/renv.html

# renv funciona com prejetos de R. Só é um problema se eu não usar o RStudio.
renv::init() # inicia o renv no projeto (inclusive dos projetos que já estão em andamento)
renv::snapshot() # tira uma foto do projeto e armazena no renv.lock

# ele cria um arquivo chamado .Rprofile que abre o renv toda vez que o projeto é aberto (não mexer nesse arquivo).

install.packages('sf') # não funciona, pois o curl não está instalado
renv::equip() # instala o curl
getOption("download.file.method") # retorna o método de download atual


Sys.setenv(RENV_DOWNLOAD_FILE_METHOD = "libcurl") # altera o método de download do renv
install.packages('sf') # agora consigo instalar funciona

# Para carregar o pacote sf, eu preciso antes carregar o pacote udunits2
install.packages('udunits2')
library(udunits2)
library(sf) # agora sim o pacote SF funciona



# Adicionar a conexão com o github em um projeto com o renv:
# Em todo novo projeto, eu preciso inserir o código de autenticação do github no meu arquivo Renviron
# para isso eu preciso instalar o pacote usethis
install.packages('usethis')
usethis::edit_r_environ() # abrir o arquivo e incluir os dados do meu github



# após baixar um reposítório do github, basta (após ter instalado o renv localmente),
# rodar o comando renv::restore() e apontar para o arquivo renv.lock baixado com o projeto
# com isso ele instala as bibliotecas nas versões usadas pelo projeto.


















