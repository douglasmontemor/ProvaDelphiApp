# ProvaDelphiApp
Projeto realizado para atender as tarefas do desafio Prova Dephi - Versão França.

# Ambiente
O sistema foi desenvolvido em Delphi versão XE7 utilizando os componentes nativos da IDE e componentes criados de acordo com as tarefas.

# Estrutura da Aplicação
A aplicação consiste em um formulário principal com um menu "Tarefas", neste menu é disponibilizado três opções de tarefas(Tarefa 1, Tarefa 2 e Tarefa 3), de acordo com a seleção da tarefa é aberto um novo formulário.

# Tarefa 1
O objetivo desta tarefa é criar dois componentes para realizar a geração de um novo comando SQL.
No formulário deve ser informado colunas, tabelas e codições para que seja possivel gerar um novo comando SQL.

  Como usar a aplicação: Ao executar a aplicação, será aberto o formulário principal, neste formulário temos o menu "Tarefas", nele deve ser selecionado a opção "Tarefa 1". 
  Ao abrir o formulário, o usuário deve informar as colunas, tabelas e condições e em seguida clicar no botão "GeraSQL" para gerar o comando SQL que será exibido ao usuário de     acordo com os valores preenchidos.

  Restrições que a tarefa irá atender:
  - Colunas e tabelas devem ter pelos um valor informado. 
  - Colunas e tabelas somente irão aceitar números e letras.
  - No campo colunas, deve ter somente uma coluna por linha.
  - No campo tabelas, deve somente uma tabela.
  
# Tarefa 2
O objetivo desta tarefa é criar duas Threads onde cada uma será responsável por carregar um progress bar de acordo com os milisegundos informados pelo usuário.

  Como usar a aplicação: Ao executar a aplicação, será aberto o formulário principal, neste formulário temos o menu "Tarefas", nele deve ser selecionado a opção "Tarefa 2". 
  Ao abrir o formulário, o usuário deve informar os milisegundos de cada thread, em seguida clicar no botão "Executar" para que as progress bar sejam carregadas.

  Restrições que a tarefa irá atender:
  - Os campos de milisegundos devem receber somente números.
  - Enquanto as threads estiverem em execução, não será possível executar novamente, irá exibir uma mensagem ao usuário.
  - Caso as threads estejam criadas ou em execução, quando o usuário fechar o formulário, as threads serão finalizadas.
  - Tratamento de exeção ao startar uma thread.

# Tarefa 3
O objetivo desta tarefa é exibir um formulário com uma grid informando os valores de um projeto, os valores da grid serão carregados dinamicamente, também será possivel obter os totais e totais das divições dos projetos.

  Como usar a aplicação: Ao executar a aplicação, será aberto o formulário principal, neste formulário temos o menu "Tarefas", nele deve ser selecionado a opção "Tarefa 3". 
  Ao abrir o formulário, será exibido uma grid com informações de valores de projeto, onde o usuário pode obter os totais do projeto.
  
  Restrições que a tarefa irá atender:
  - Criar componentes em tempo de execução e popular registros aleatórios na criação do formulário.
  - Ao fechar o formulário, destruir os componentes criados.
