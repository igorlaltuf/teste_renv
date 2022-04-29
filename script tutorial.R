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

# Após instalar o pacote renv, por alguma razão, ele perdeu a conexão com o github.
# os botões push e pull ficaram cinzas. É como se a cada commit ele não me desse a 
# opção de fazer push (e esconde os commits como se tivessem sido feitos).
# solução encontrada foi pelo console:

# git remote add transit-studies git@github.com:igorlaltuf/transit-studies.git
# eu consigo confirmar a conexão pelo comando git remote -v
# transit-studies é o nome do repositório e o git@github é o caminho dele.

# E em seguida:
# git push transit-studies

# Preciso descobrir como fazer os botões pull e push voltarem a funcionar no projeto transit-studies
# https://stackoverflow.com/questions/39976526/rstudio-greyed-out-git-commands-and-no-branch






# após baixar um reposítório do github, basta (após ter instalado o renv localmente),
# rodar o comando renv::restore() e apontar para o arquivo renv.lock baixado com o projeto
# com isso ele instala as bibliotecas nas versões usadas pelo projeto.

