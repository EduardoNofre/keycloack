<p align="center">
  <img src="https://github.com/EduardoNofre/keycloack/blob/master/dockerCompose.jpg" alt="Sublime's custom image"/>  
</p>

<h1 align="center">
  Docker Compose + keycloack   
</h1>

<h1 align="center">
   Docker Compose 
</h1>

## O que é Docker Compose?
O Docker Compose é uma ferramenta que permite definir e gerir aplicações Docker que usam vários contêineres. Ele facilita a execução de serviços interconectados, como bancos de dados, APIs e front-end.<br>

## Como funciona?
Define serviços em um arquivo YAML e os inicia com um único comando.

## O que faz?
Orquestra containers, cria redes, constrói imagens e vincula contêineres.

## Quem usa?
Profissionais de desenvolvimento, teste, staging, CI e DevOps.

<h1 align="center">
   keycloack 
</h1>

## O que é o keycloack?
Keycloak é uma solução de gerenciamento de acesso e identidade de código aberto que visa principalmente aplicativos e serviços. Os usuários podem autenticar com o Keycloak em vez de aplicativos individuais. Assim, as aplicações não precisam lidar com formulários de login, autenticando e armazenando usuários.

## Funcionalidades?
Single Sign-On (SSO), autenticação centralizada, autorização e controle de acesso.

## Gerenciamento?
Console de gerenciamento de contas, console admin para gerenciamento central de usuários

## Suporte de protocolos?
Compatível com protocolos de autenticação como OAuth 2.0, OpenID Connect e SAML.

# Requisito mínimo para antes de começar!.

## 1 - Step;
Ter o docker desktop instalado na maquina.
Para instalar é facil é só ir na pagina do docker fazer download de acordo com seu S.O e instalar.

## 2 - Step. 
Observação.<br>
Para executar o seu projeto, o docker desktop deve esta sendo execuatdo em sua maquina. Caso contrario vai da erro.

## 3 - Step.
Ao executar o seu projeto pela primiera vez vai demorar um pouco pois o docker irá fazer o pull das imagens para a sua maquina.

## 4 - Step.
ter o banco de dados postgrees instalado em seu computador.


<h1 align="center">
  Requisito mínimo atendido.
</h1>

# 1 - Vamos criar o arquivo 'docker-compose.yml' como no exemplo abaixo.
##  Arquivo docker-compose.yml

                  services:
                    postgres:
                      image: postgres
                      environment:
                        POSTGRES_DB: keycloak
                        POSTGRES_USER: keycloak
                        POSTGRES_PASSWORD: keycloak
                      volumes:
                        - C:/java-estudos-2025/banco_db_postgres_docker:/var/lib/postgresql/data
                        - ./init-schema.sql:/docker-entrypoint-initdb.d/init-schema.sql
                      ports:
                       - 3333:5432
                      networks:
                        - keycloak_network
                   
                    keycloak:
                      image: quay.io/keycloak/keycloak:legacy
                      environment:
                        DB_VENDOR: POSTGRES
                        DB_ADDR: postgres
                        DB_DATABASE: keycloak
                        DB_USER: keycloak
                        DB_SCHEMA: keycloak_schema
                        DB_PASSWORD: keycloak
                        KEYCLOAK_USER: admin
                        KEYCLOAK_PASSWORD: admin
                      ports:
                        - 8080:8080
                      depends_on:
                        - postgres
                      networks:
                        - keycloak_network
                        
                  networks:
                    keycloak_network:
                      driver: bridge

# 1.1 - O Arquivo compose 'docker-compose.yml'.
##  Arquivo  'docker-compose.yml'
Compose é uma ferramenta para gerenciar múltiplos contêineres.<br>
No exemplo acima 'docker-compose.yml' podemos observar dois serviços são eles.<br>
        - postgres<br>
        - keycloak<br>
Cada serviço com as suas configuraçoes, portas, redes ...<br>
          

# 2 - Vamos criar o arquivoe o 'init-schema.sql' como no exemplo abaixo.
##  Arquivo  'init-schema.sql'

              DO $$
                BEGIN
                    IF NOT EXISTS(
                        SELECT schema_name
                        FROM information_schema.schemata
                        WHERE schema_name = 'keycloak_schema'
                    ) THEN
                        EXECUTE 'CREATE SCHEMA keycloak_schema';
                    END IF;
                END
                $$;

# 2.1 - O Arquivo compose 'init-schema.sql'.
  SQL é um script de criação de schema_name e nome da schema_name.<br>
  O Arquivo compose 'docker-compose.yml' faz a chamada deste sql apos a instalação do postgrees.<br>

<h1 align="center">
  Executando o arquivo 'docker-compose.yml' 
</h1>

  1 - Va ate o diretorio onde se encontra o arquivo  'docker-compose.yml' via promtp de comando.

  2 - No diretorio onde esta o arquivo  execute o comando docker-compose up -d.

  3 - Apos a execução do comando isso pode levar alguns minutos.

#  saida:

<p align="center">
  <img src="https://github.com/EduardoNofre/keycloack/blob/master/Captura%20de%20tela%202025-04-12%20012446.png" alt="Sublime's custom image"/>  
</p>
      
 4 -  Com isso o Keycloak estará no ar e o schema e tabelas deve esta criado em seu banco de dados.<br>  
        1 - O Keycloak ira a tabelas necessaria para o seu controles e gerencimaneto.<br>
        2 - A imagem Keycloak deve esta em execução.
        3 - A imagem do postgrees também deve esta em execução.

 5 - Verificando se as imagens estão rodando execute o comando 'docker ps':

  #  saida:

<p align="center">
  <img src="https://github.com/EduardoNofre/keycloack/blob/master/dockerps.png" alt="Sublime's custom image"/>  
</p>
        

 ## Criação da conta de administrador no keycloak

  1 - O usuario administrador console foi criado em seu arquivo 'docker-compose.yml'<br> 
     - usuario: admin <br>
     - senha: admin <br>

  2 - Abra http://localhost:8080/auth
    
  3 - A página de boas-vindas é aberta, confirmando que o servidor está funcionando.Página de boas-vindas
  
  5 - E faça login no console de administração do Keycloak usando a conta de console administrador..
  
  ![ciar](criarUsua.PNG)  
 
  
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


