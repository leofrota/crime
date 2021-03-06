
### Chamando Pacotes

library(tidyverse)
library(ggplot2)


setwd("~/GitHub/crimecuritiba/crime/crime")


### Chamando bases

dez2019gm <- read.csv("~/GitHub/crimecuritiba/crime/Crime/dez2019gm.csv", sep=";")

gm2020 <- read.csv("~/GitHub/crimecuritiba/crime/Crime/gm2020.csv", sep=";")

painel <- read.csv("~/GitHub/crimecuritiba/crime/Crime/painel.csv")


### Criando base de crimes para dashboard

contagem <- gm2020 %>%
  group_by(ATENDIMENTO_ANO, OCORRENCIA_MES, NATUREZA1_DESCRICAO, ATENDIMENTO_BAIRRO_NOME) %>%
  summarize(n=n()) 

write_csv(contagem, path = "crimemaio2020.csv")

#### Testando dados para abril

contagemabril <- gm2020 %>%
  group_by(ATENDIMENTO_ANO, OCORRENCIA_MES, NATUREZA1_DESCRICAO) %>%
  summarize(n=n()) %>%
  filter(OCORRENCIA_MES == 4) %>%
  filter(NATUREZA1_DESCRICAO == "Violação de Medida Protetiva Lei Maria da Penha")


#### Grafico Evolução Crimes Individuais



gm2020 %>%
  group_by(ATENDIMENTO_ANO, OCORRENCIA_MES, NATUREZA1_DESCRICAO) %>%
  summarize(n=n()) %>%
  filter(OCORRENCIA_MES == 4) %>%
  filter(NATUREZA1_DESCRICAO == "Roubo") %>%
  ggplot() + 
  geom_point(aes(x = ATENDIMENTO_ANO, y = n)) +
  geom_segment( aes(x= ATENDIMENTO_ANO , xend= ATENDIMENTO_ANO, y=0, yend= n), color="indianred") +
  theme_minimal() + 
  xlab("Ano") +
  ylab("Numero de Ocorrências") +
  ggtitle("Número de Ocorrências de Roubos em Abril")




gm2020 %>%
  filter(ATENDIMENTO_ANO != "") %>%
  group_by(ATENDIMENTO_ANO, OCORRENCIA_MES, NATUREZA1_DESCRICAO) %>%
  summarize(n=n()) %>%
  filter(OCORRENCIA_MES == 4) %>%
  #filter(ATENDIMENTO_ANO > 2016) %>%
  filter(NATUREZA1_DESCRICAO == "Violação de Medida Protetiva Lei Maria da Penha") %>%
  ggplot() + 
  geom_point(aes(x = ATENDIMENTO_ANO, y = n)) +
  geom_segment( aes(x= ATENDIMENTO_ANO , xend= ATENDIMENTO_ANO, y=0, yend= n), color="red") +
  theme_minimal() + 
  xlab("Ano") +
  ylab("Numero de Ocorrências") +
  ggtitle("Número de Ocorrências da Lei da  Maria da Penha em Abril") + 
  coord_flip() +
  theme(plot.title = element_text(size = 30)) +
  theme(axis.text = element_text(size=12))
  


gm2020 %>%
  group_by(ATENDIMENTO_ANO, OCORRENCIA_MES, NATUREZA1_DESCRICAO) %>%
  summarize(n=n()) %>%
  filter(OCORRENCIA_MES == 4) %>%
  filter(NATUREZA1_DESCRICAO == "Perturbação do sossego") %>%
  ggplot() + 
  geom_point(aes(x = ATENDIMENTO_ANO, y = n)) +
  geom_segment( aes(x= ATENDIMENTO_ANO , xend= ATENDIMENTO_ANO, y=0, yend= n), color="indianred") +
  theme_minimal() + 
  xlab("Ano") +
  ylab("Numero de Ocorrências") +
  ggtitle("Número de Ocorrências de Perturbação do sossego em Abril")


gm2020 %>%
  group_by(ATENDIMENTO_ANO, OCORRENCIA_MES, NATUREZA1_DESCRICAO) %>%
  summarize(n=n()) %>%
  filter(OCORRENCIA_MES == 4) %>%
  filter(NATUREZA1_DESCRICAO == "Substância Ilícita") %>%
  ggplot() + 
  geom_point(aes(x = ATENDIMENTO_ANO, y = n)) +
  geom_segment( aes(x= ATENDIMENTO_ANO , xend= ATENDIMENTO_ANO, y=0, yend= n), color="indianred") +
  theme_minimal() + 
  xlab("Ano") +
  ylab("Numero de Ocorrências") +
  ggtitle("Número de Ocorrências Substância Ilícita em Abril")



####


