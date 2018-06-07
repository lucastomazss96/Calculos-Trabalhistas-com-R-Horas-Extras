# Cálculos Trabalhistas com R - Horas Extras
Exemplo de código para cálculo e tabulação de horas extras.
## Dias Úteis - Criando Calendário com feriados ANBIMA
Utilizando o pacote Bizdays para criar um caledário descontando os sábados, domingos e feriados seguindo o calendário de feriados ANBIMA.
## Horas Extras Trabalhadas, Salário Hora e Valor Devido
Com base nos dias úteis de cada mês, considerando o cálculo de 3 horas extras diárias para o ano de 2010, sem férias, com evolução salarial, calculei as variáveis de forma simples. Para tanto, criei vetores de tamanho 12 para cada uma das variáveis.
## Tabulação do Cálculo
Apresenta uma simples tabulação, em forma de data frame, dos vetores e do resultado final. Inclui ao data frame com os valores totais de horas extras e valor devido. Após, utilizei o pacote formatter para editar o data frame e apresentá-lo como uma tabela com artíficios html,  que pode ser salva em jpeg. 
Em breve incluire como exportar em pdf.
Não considera atualização monetária, juros, FGTS e nem impostos, que serão apresentados códigos prórpios para seus cálculos.
