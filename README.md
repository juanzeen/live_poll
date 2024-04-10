# LivePoll

## Descrição

**LivePoll** é uma aplicação web de enquetes em tempo real desenvolvida com Phoenix, Phoenix LiveView, HTML e CSS. Este projeto full-stack permite que os usuários criem enquetes, votem nelas e vejam os resultados das votações atualizando em tempo real. O objetivo é proporcionar uma experiência interativa tanto para criadores de enquetes quanto para votantes, praticando habilidades de desenvolvimento com Elixir, Phoenix, e tecnologias web front-end.

## Tecnologias Utilizadas

- Elixir
- Phoenix Framework
- Phoenix LiveView
- PostgreSQL
- HTML
- CSS

## Como Configurar e Rodar o Projeto

### Pré-Requisitos

Antes de começar, certifique-se de que você tem instalado:
- Elixir
- PostgreSQL
- Node.js

### Configuração

1. Clone o repositório:
 ```sh
 git clone https://github.com/seu-usuario/livepoll.git
 cd livepoll
 ```

2. Instale as dependências do Elixir:
 ```sh
 mix deps.get
 ```

3. Crie e migre seu banco de dados:
 ```sh
 mix ecto.create && mix ecto.migrate
 ```

4. Instale as dependências do Node.js (para Phoenix LiveView):
 ```sh
 cd assets && npm install
 ```

### Rodando o Projeto

Volte para o diretório raiz do projeto e inicie o servidor Phoenix:

```sh
mix phx.server
```

Agora você pode visitar [`localhost:4000`](http://localhost:4000) do seu navegador para ver o aplicativo em ação.

## Requisitos Mínimos

Para garantir que o projeto LivePoll atenda aos objetivos de aprendizado e funcionalidade, os seguintes requisitos mínimos devem ser implementados:

- **Criação de Enquetes:** Os usuários devem ser capazes de criar enquetes fornecendo um título, descrição opcional, e múltiplas opções de resposta.
- **Votação:** Usuários devem poder votar em qualquer enquete disponível. Cada usuário só pode votar uma vez por enquete.
- **Resultados em Tempo Real:** Os resultados da votação devem ser atualizados em tempo real para todos os usuários que estiverem visualizando a enquete.
- **Listagem de Enquetes:** Uma página inicial que exibe todas as enquetes criadas, permitindo aos usuários clicarem em uma para ver mais detalhes e votar.
- **Interface do Usuário:** A aplicação deve ser razoavelmente estilizada com HTML e CSS, oferecendo uma experiência de usuário agradável e intuitiva.

## Desafios

Para aqueles que desejam levar o projeto LivePoll um passo adiante, considere os seguintes desafios:

- **Autenticação de Usuários:** Implemente um sistema de autenticação para que os usuários possam se registrar, fazer login, e ter seus votos vinculados a sua conta. Isso também permitirá que eles alterem seus votos.
- **Validação de Formulários:** Adicione validação do lado do servidor e do cliente para os formulários de criação de enquete, garantindo que os dados sejam enviados corretamente.
- **Visualizações de Gráfico:** Para uma visualização mais dinâmica dos resultados, integre uma biblioteca de gráficos JavaScript para exibir os resultados das enquetes em gráficos de barra ou pizza.
- **Limitação de Tempo para Votação:** Adicione a opção de definir um prazo para votação em uma enquete, após o qual a votação é encerrada e os resultados finais são mostrados.

## Regras de Negócio

As seguintes regras de negócio devem ser seguidas para assegurar a integridade e a funcionalidade desejada do LivePoll:

- **Único Voto por Usuário em Cada Enquete:** Cada usuário pode votar apenas uma vez em cada enquete. Caso a autenticação de usuários seja implementada, isso deve ser controlado por conta de usuário; caso contrário, pode ser gerenciado por sessão ou cookie.
- **Atualização de Votos:** Usuários devem poder mudar seu voto antes do encerramento da enquete, se desejarem.
- **Persistência de Dados:** Todas as enquetes, opções e votos devem ser armazenados de forma persistente no banco de dados, garantindo que os dados não se percam entre reinicializações do servidor.
- **Visualização de Resultados:** Os usuários podem ver os resultados de uma enquete somente após votarem nela, incentivando a participação antes de visualizar as tendências de votação.


## Contribuições

Contribuições são sempre bem-vindas! Se você tem alguma ideia para melhorar o aplicativo ou encontrou um bug, sinta-se à vontade para criar um issue ou enviar um pull request.

## Licença

Este projeto é distribuído sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
