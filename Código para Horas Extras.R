pkgs<-c("Bizdays","ctv","lubridate", "formattable")
install.packages(pkgs)
library("bizdays")
library("ctv")
library("lubridate")
library("formattable")
cal<-create.calendar(holidays=holidaysANBIMA, weekdays=c("saturday","sunday"), name="ANBIMA")  #Cria Calendário com dias úteis de segunda a sexta-feira, com feriados da ANBIMA.
Meses<-c("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
         "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")                     #Vetor dos meses
Dias<-c(31,28,31,30,31,30,31,31,30,31,30,31)                                                   #Vetor dos Dias
Ano<-rep(2010,12)                                                                              #Vetor do Ano 
Mes<-c("01", "02", "03", "04", "05","06","07", "08", "09", "10", "11", "12")
From<-cbind(rep(2010,12),Mes,rep(1,12))                                                        #Tabela cuja primeira coluna é o ano, segunda o mês e terceira o primeiro dia de cada mês.
names(From)<-(c("ano","mes","dia"))
Inicio<-paste(From[,1],"-",From[,2],"-",From[,3], sep = "")                                    #Vetor com datas iniciais no formato do pacote Bizdays.
names(Inicio)<-c("From")
To<-cbind(rep(2010,12),Mes,Dias)                                                             
Fim<-paste(To[,1],To[,2],To[,3],sep = "-")                                                     #Tabela cuja primeira coluna é o ano, segunda o mês e terceira o último dia de cada mês.
names(Fim)<-c("To")
Dias_Úteis<-bizdays(Inicio, Fim, cal)                                                          #Cria vetor de dias úteis para cada mês.
HE_Diárias<-rep(3,12)                                                                          #Vetor das Horas Extras, nesse caso 3 horas extras diárias.
Horas_Devidas<-Dias_Úteis*HE_Diárias                                                           #Vetor do total de Horas extras Devidas por Mês
Salário<-c(rep(1500,8),rep(2000,4))                                                            #Vetor da Evolução salaria no Ano
Salário<-accounting(Salário, digits = 2L, format = "f", big.mark = ".", decimal.mark=",")
Divisor<-c(rep(220,12))
Salário_Hora<-Salário/Divisor                                                                  #Vetor do salário Hora Normal (220 horas mensais)
Salário_Hora50<-Salário_Hora*1.5                                                               #Vetor do salário Hora de Hora extra com acréscimo de 50%
Tota<-sum(Valor_Devido)
Valor_Devido<-Salário_Hora50*Horas_Devidas                                                     #Vetor da Base total de Horas "Cruas" Extras Devidas
Total<-data.frame("Total","","","",sum(Horas_Devidas),sum(Salário),"",sum(Salário_Hora50),Tota)                                                     #Retorna a soma dos Valores
Tabela<-data.frame(Ano, Meses,Dias_Úteis, HE_Diárias,Horas_Devidas, Salário, Divisor, 
                   Salário_Hora50, Valor_Devido)                                               #Tabela Simples
names(Total)<-c("Ano","Meses", "Dias_Úteis", "HE_Diárias", 
                "Horas_Devidas", "Salário", "Divisor", "Salário_Hora50", "Valor_Devido")
Tabela<-rbind(Tabela,Total)

formattable(Tabela, align="c", list(
  Salário = formatter("span", 
                      style = x ~ ifelse(x == 1500, style(color = "green"),style(color = "blue"))
                       ),                                                                           #Desenhando com Fomattable: valores 1500 verdes e demais azuis
                      Horas_Devidas=color_tile("white", "orange"),                                  #Efeito degradê do branco para o laranja
                      Valor_Devido=color_tile("white", "orange"),
                      Salário_Hora50 = formatter("span", style = x ~ ifelse(x <12, 
                                                        style(color = "green"), 
                                                        style(color = "blue")))                      #Valores menor que doze em verde e maiores em azul.
))

