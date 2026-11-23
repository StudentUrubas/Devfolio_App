# Roteiro de apresentação — DevFolio App

**Apresentação para duas pessoas, em cerca de 3 a 5 minutos.** Troquem os exemplos fictícios pelos dados verdadeiros antes do Demo Day.

## Pessoa 1 — Apresentação e perfil

"Nosso projeto se chama DevFolio, um portfólio web desenvolvido em Flutter e Dart. A proposta é reunir em um único aplicativo o perfil do desenvolvedor, projetos realizados e habilidades. A tela inicial apresenta o destaque do portfólio e um crachá digital com informações pessoais e um botão para copiar o e-mail. Também desenvolvemos a interface para se adaptar a telas grandes e pequenas."

**Mostrar:** página inicial, crachá e navegação no celular/navegador.

## Pessoa 2 — Dashboard e funcionalidades

"Aqui fica o dashboard de métricas. A quantidade de projetos, os concluídos e os em andamento são calculados automaticamente com base na lista de projetos. Também temos um gráfico ilustrativo que alterna entre semana e mês e um indicador visual do percentual de conclusão. Na seção de projetos, conseguimos filtrar por todos, concluídos e em andamento. Por fim, apresentamos habilidades e uma linha do tempo."

**Mostrar:** 4 cards de métricas; trocar Semana/Mês; filtrar projetos; habilidades e sobre mim.

## Pessoa 1 — Código e componentes

"Para manter a organização, dividimos a interface em vários widgets reutilizáveis dentro de `lib/widgets`. Os dados editáveis estão centralizados em `lib/data/portfolio_data.dart`, os modelos em `lib/models` e as cores em `lib/theme`. O código principal começa em `lib/main.dart`. Dessa forma, fica mais fácil testar, manter e personalizar o aplicativo."

## Pessoa 2 — Encerramento

"Concluímos uma interface responsiva e interativa, preparada para publicação na web. Versionamos o código no GitHub e documentamos o projeto no README, incluindo os prints tirados do servidor da sala. Como melhoria futura, poderíamos integrar métricas reais de acesso a um backend. Obrigado!"

## Perguntas que podem surgir

**As visitas do gráfico são reais?** Não. São uma simulação identificada como demonstração; os números de projetos vêm da lista cadastrada.

**Por que usar widgets separados?** Para reduzir repetição, organizar responsabilidades e facilitar manutenção.

**O que muda ao atualizar o status de um projeto?** O total de concluídos, em andamento e o percentual de conclusão mudam automaticamente.

**Como executar na sala?** `flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080`.
