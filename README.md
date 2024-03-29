# keycloack-gerar-token - Parte 1

## O que é o keycloack?

Keycloak é uma solução de gerenciamento de acesso e identidade de código aberto que visa principalmente aplicativos e serviços. Os usuários podem autenticar com o Keycloak em vez de aplicativos individuais. Assim, as aplicações não precisam lidar com formulários de login, autenticando e armazenando usuários.

## Para este exemplo iremos utilizar o keycloak 22.0.3 no sistema operacional Windows

  1 - Baixe keycloak-22.0.3 [Zip | tar.gz] de downloads de Keycloak.

  2 - Coloque o arquivo em um diretório de sua escolha.

  3 - Descompacte o arquivo ZIP usando o utilitário de descompactação apropriado, como jar, tar ou unzip.

## Iniciando o servidor Keycloak

  1 - Você inicia o servidor no sistema em que o instalou.

  2 - Vá para o diretório bin da distribuição do servidor.

  3 - Execute  o cmando  **C:\keycloack-localhost\keycloak-22.0.3\bin>kc.bat start-dev**

  4 - Apos a execução do comando deve o resultado dev ser algo semelhante a resultado abaixo.

  ![console](console.PNG)

  5 - Agora abra o seu browser e digite localhost:8080 e a seguinte tela sera exibida.

  ![ciar](criarUsua.PNG)
  
 ## Criação da conta de administrador no keycloak

  1 - Antes de poder usar o Keycloak, você precisa criar uma conta de administrador que usará para fazer login no console de administração do Keycloak.

  2 - Você não viu nenhum erro ao iniciar o servidor Keycloak. Por default sobe na porta localhost:8080.

  3 - Abra http://localhost:8080/auth em seu navegador.
    
  4 - A página de boas-vindas é aberta, confirmando que o servidor está funcionando.Página de boas-vindas
  
  5 - Digite um nome de usuário e senha para criar um usuário admin inicial.
  
  ![ciar](criarUsua.PNG)  
  
  ## Fazer login no console de administração
  
  1 - Clique no link Administration Console na página de Boas-vindas ou vá diretamente para http://localhost:8080/auth/admin/ (o URL do console).
   
  2 - Digite o nome de usuário e a senha que você criou na página de boas-vindas para abrir o console de administração.Tela de login do Admin Console.
   
  3 - A tela inicial do console de administração é exibida.Admin console.
  ![primiera](primiera.PNG)  
  
   ## Criar um realm<br>
   
   O que é o realm?<br>
   R: O **realm** e como se fosse uma work space ou area de trabalho.<br>
    - O **realm master** nunca deve ser usado pois o mesmo e para gerenciamnto do keycloack.
    
   Pré-requisitos:   
     Keycloak está instalado.
      - Você tem a conta de administrador inicial para o console de administração.
     
  1 - Vá para o endereço  http://localhost:8080/auth/ e faça login no console de administração do Keycloak usando a conta de administrador.

  2 - Por default a master ja vem criada.No menu Master, clique em Add Realm. Quando você está conectado ao domínio master, este menu lista todos os outros reinos.
   
  3 - Assim que você se logar na aplicação do lado esquerdo superior você verá o nome Master.
   
  4 - Ao passar o curso do mouse por cima do nome master será exibido um botão com a opção de adicionar um realm.
   
  5 - clique no botão add realm.    
   
  6 - no campo name iremos colocar o nome "Demo" Como mostra a imagem abaixo.
      Observação: Este nome é muito importante pois este nome estará na sua url que servirar para gerar o token.
  ![Alt text](https://www.keycloak.org/docs/latest/getting_started/keycloak-images/add-demo-realm.png "add realm")
    
  7 - Após a definição do nome do seu realm clique no botão create.E pronto!
  
  8 - será exibida a seguinte tela.
  
  ![Alt text](https://www.keycloak.org/docs/latest/getting_started/keycloak-images/demo-realm.png "create realm")

  ## Criar o usuario.
  
  1 - No realm demo, você cria um novo usuário e uma senha temporária para esse novo usuário.
  
  2 - No menu, clique em Usuários para abrir a página da lista de usuários.
    
  3 - No lado direito da lista de usuários vazia, clique em Adicionar usuário para abrir a página Adicionar usuário.
    
  4 - Insira um nome no campo Nome de usuário. Este é o único campo obrigatório!
 
  ![Alt text](https://www.keycloak.org/docs/latest/getting_started/keycloak-images/add-user.png "Add user")
   
  5 - Mude o botão E-mail verificado para Ativado e clique em Salvar. Coloque o nome que desejar.
       Vamos usar o nome abaixo:
       
  ![Alt text](https://www.keycloak.org/docs/latest/getting_started/keycloak-images/add-user.png "Add user")
 
  6 - Clique na guia Credenciais para definir uma senha temporária para o novo usuário.
  
  7 - Digite uma nova senha e confirme-a.
  
  8 - Clique em Definir senha para definir a senha do usuário como a nova que você especificou.
  
  ![Alt text](https://www.keycloak.org/docs/latest/getting_started/keycloak-images/user-credentials.png "Add user")
    
  
 ## Adicionar um cliente:
 
 1 - É simples adicionar um cliente, o mesmo processo funciona para qualquer tipo de aplicação.
 
 2 - ID do cliente: você pode fornecer qualquer nome adequado para seu aplicativo.
 
 3 - Vamos usar o protocolo: ‘OpenID-Connect
 
 4 - URL root: nome do host do aplicativo
 
 Obs: Nos campos: Valid Redirect URIs, Admin URL e Web Origins neste campo será colocado a url da sua aplicação. e não a url do keycloack. 
 
![Alt text](https://miro.medium.com/max/1000/1*X7gwlYVTHLzaEh_ygGbrQw.png  "Add Client")

## Vamos testar 
  
  Para testar iremos utilizar o Postman. 
  O que é Postman?
  R: O Postman é uma ferramenta que tem como objetivo testar serviços RESTful (Web APIs) por meio do envio de requisições HTTP e da análise do seu retorno. Descrição: O Postman       é uma ferramenta que tem como objetivo testar serviços RESTful (Web APIs) por meio do envio de requisições HTTP e da análise do seu retorno.
  
  Garatntir que o Keycloack esteja sendo executado na sua maquina.
  
  1 - Abra o postman.
  
  2 - User o verbo post.
  
  3 - na url coloque o seguinte endereço
    http://localhost:8080/auth/realms/XXXX/protocol/openid-connect/token
     
     Observação: Onde esta o XXXX você deve colocar o nome do seu realm o nome do nosso realm é demo. isso foi definido logo no inicio.
     Logo a nossa URL fica assim:
     http://localhost:8080/auth/realms/demo/protocol/openid-connect/token
     
  4 - selecione a opção Body e coloque as seguintes key e valor e marce a opção x-www-form-urlencoded
     
  ##  Key ----------------- Value
    grant_type              password   
    client_id               vue-test-app
    username                johndoe
    password                123123
  
  5 - vue-test-app é o Cliente que você mostrado aqui no exemplo.
  
  6 - johndoe é o usuario nome do usuario qye foi criado aqui neste exemplo.
  
  7 - password foi criado junto com o seu usuario johndoe em credentials.
  
  Se o token for gerado com sucesso sera exibido o token no seu postman.
  
  ![Alt text](https://www.witekio.com/wp-content/uploads/2018/06/Keycloak-Step-8.png " token ")
  
  Caso não seja gerado o token rafaça o procedimento.

# Importante keycloack na AWS

  Ao instalar o keycloack no amazon numa instancia EC2 ubuntu tive uma problema ao tentar fazer o login como mostra a imagem." Problema "
  
  ![Alt text](https://miro.medium.com/max/700/1*ZKaU3tVY0OpSZQh-SaTojw.png)
  
  Indica que keycloack precisa ser execuatdo no protocolo HTTPS. Mas como toda aplicação o keycloack pode tambem ser execuatdo no protocolo HTTP.
  
  Para resolver o problema exibida na imagem basta seguir os passos abaixo.
  
  OBS: No meu caso o keycloack esta no docker.
    
  1 - Devemos procurar o seguinte diretorio. keycloak/bin 
  para ajudar a encontrar o direotrio use o comando
  ### sudo updatedb
  ### sudo locate keycloak
   Agora que achou o diretorio keycloak va ate a pasta bin
   
  2 - O proximo comando vai autorizar a sua url ser executada no protocolo http.
  ### ./kcadm.sh config credentials --server http://xxxx:8080/auth --realm master --user admin --password admin
  
  3 - desabilitar o ssl
  ### ./kcadm.sh update realms/master -s sslRequired=NONE
  
  Pronto agora é so da um refresh na pagina e loga. 
  
   [Referencia stackoverflow](https://stackoverflow.com/questions/30622599/https-required-while-logging-in-to-keycloak-as-admin)

# Fim


