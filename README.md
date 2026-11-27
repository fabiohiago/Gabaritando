Gabaritando ENEM

Uma ferramenta de estudos que utiliza questões de provas para ajudar estudantes a praticar e acompanhar seu desempenho.

Sobre o projeto

O Gabaritando ENEM é um projeto em desenvolvimento que tem como objetivo facilitar a preparação para o ENEM, vestibulares e concursos.

A proposta é extrair questões de provas em PDF, organizar suas alternativas e respostas e transformá-las em quizzes interativos.

Tecnologias

- Python
- PyMuPDF (leitura dos PDFs)
- Flask (servidor web)
- HTML, CSS e JavaScript (interface)

Status

MVP funcionando: envio da prova e do gabarito em PDF, extração das questões (enunciado, alternativas e imagens), associação do gabarito, edição das questões, simulado e resultado com acertos e erros.

A interface segue o protótipo feito no Figma: menu lateral (Início, Simulados, Resultados e Ajuda), tela de envio dos dois PDFs, tela de preparação do simulado, questão com enunciado e alternativas lado a lado e tela de resultado com o percentual de acerto. Além do protótipo, o sistema guarda o histórico dos simulados (Seu progresso e Resultados) e mostra o desempenho por área.

Como executar

1. Criar e ativar o ambiente virtual, depois instalar as dependências:
   pip install -r requerimentos.txt
2. Entrar na pasta src e iniciar o servidor:
   cd src
   python main.py
3. Abrir http://127.0.0.1:5000 no navegador (no celular, use o endereço do computador na mesma rede).

Estrutura

- src/main.py: servidor Flask e rotas da API
- src/extrator_pdf.py: leitura dos PDFs, extração das questões, das imagens e do gabarito
- src/filtro.py: padrões (regex) que reconhecem questões, alternativas e o que deve ser ignorado
- src/armazenamento.py: grava cada prova em data/provas/<id>/prova.json e as imagens em data/provas/<id>/imagens
- src/static: interface web baseada no protótipo do Figma (index.html, estilo.css e app.js)
- iniciar.bat: instala o que falta, abre o navegador e inicia o servidor (Windows)

Licença

Este projeto está sob a licença MIT. Consulte o arquivo "LICENSE" para mais informações.