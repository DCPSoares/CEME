-- Script para mover o núcleo e analisar os valores de fluxo concatenados em diferentes correntes e distancias


-- Cria ou abre o arquivo onde serão gavados os valores dos fluxos concatenados
f = openfile ("Resultados.csv", "w")

-- Escreve o cabeçalho do arquivo .csv
write (f, "Corrente_Bobina,Tensao_Bobina,Fluxo_Concatenado_Bobina\n")

-- Intervalo entre as correntes
delta_corrente = 2

-- Repetição para mudar a corrente e mover o nucleo
for corrente = 2,20,delta_corrente do 

    -- Roda a analise de resultados
    mi_analyze()
    
    --Carrega os resultados
    mi_loadsolution()

    -- Computa as variáveis da bobina
    Corrente_Bobina,Tensao_Bobina,Fluxo_Concatenado_Bobina = mo_getcircuitproperties("bobina")

    -- Grava os resultados no arquivo de dados
    write (f, Corrente_Bobina,",",Tensao_Bobina,",",Fluxo_Concatenado_Bobina, "\n")

    -- Seleciona o que será movido
    mi_selectrectangle(2,1.95,10,-2.55,4)

    -- Move o núcleo para a segunda posicao
    mi_movetranslate(0,0.04,(4))
    
    -- Roda a analise de resultados
    mi_analyze()

    --Carrega os resultados
    mi_loadsolution()

    -- Computa as variáveis da bobina
    Corrente_Bobina,Tensao_Bobina,Fluxo_Concatenado_Bobina = mo_getcircuitproperties("bobina")

    -- Grava os resultados no arquivo de dados
    write (f, Corrente_Bobina,",",Fluxo_Concatenado_Bobina,",",Tensao_Bobina, "\n")

    -- Seleciona o que será movido
    mi_selectrectangle(2,1.99,10,-2.3,4)

    -- Move o núcleo para a terceira posicao
    mi_movetranslate(0,0.005,(4))

    -- Roda a analise de resultados
    mi_analyze()

    --Carrega os resultados
    mi_loadsolution()

    -- Computa as variáveis da bobina
    Corrente_Bobina,Tensao_Bobina,Fluxo_Concatenado_Bobina = mo_getcircuitproperties("bobina")

    -- Grava os resultados no arquivo de dados
    write (f, Corrente_Bobina,",",Fluxo_Concatenado_Bobina,",",Tensao_Bobina, "\n")

    -- Seleciona o que será movido
    mi_selectrectangle(2,1.995,10,-2.3,4)

    -- Move o núcleo para a quarta posicao
    mi_movetranslate(0,0.004,(4))

    -- Roda a analise de resultados
    mi_analyze()

    --Carrega os resultados
    mi_loadsolution()

    -- Computa as variáveis da bobina
    Corrente_Bobina,Tensao_Bobina,Fluxo_Concatenado_Bobina = mo_getcircuitproperties("bobina")

    -- Grava os resultados no arquivo de dados
    write (f, Corrente_Bobina,",",Fluxo_Concatenado_Bobina,",",Tensao_Bobina, "\n")

    -- Muda a corrente
    mi_modifycircprop("bobina",1,corrente)

    -- Seleciona o que será movido
    mi_selectrectangle(2,1.999,10,-2.3,4)

    -- Move o núcleo, voltando pra posição normal
    mi_movetranslate(0,-0.049,(4))
end

-- Fecha o arquivo .csv
closefile(f)