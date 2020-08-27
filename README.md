# keycloack-gerar-token
 
## Para este exemplo iremos utilizar o keycloak 11.0.1 no sistema operacional Windows

  1 - Baixe keycloak-11.0.1. [Zip | tar.gz] de downloads de Keycloak.

  2 - Coloque o arquivo em um diretório de sua escolha.

  3 - Descompacte o arquivo ZIP usando o utilitário de descompactação apropriado, como jar, tar ou unzip.

## Iniciando o servidor Keycloak

  1 - Você inicia o servidor no sistema em que o instalou.
  
  2 - Vá para o diretório bin da distribuição do servidor.
  
  3 - c:\ ..\bin\standalone.bat.

    Se deu tudo certo, você vera esta tela como mostra a imagem abaixo:
    
  ![Alt text](https://miro.medium.com/max/1859/1*O6wYngBXLU22GqCYR8W9gg.png "Pagina Principal")
  
 ## Criação da conta de administrador no keycloak
 
  1 - Antes de poder usar o Keycloak, você precisa criar uma conta de administrador que usará para fazer login no console de administração do Keycloak.
  
  2 - Você não viu nenhum erro ao iniciar o servidor Keycloak. Por default sobe na porta localhost:8080.
  
  3 - Abra http://localhost:8080/auth em seu navegador.
    
  4 - A página de boas-vindas é aberta, confirmando que o servidor está funcionando.Página de boas-vindas
  
  5 - Digite um nome de usuário e senha para criar um usuário admin inicial.
  
  ![Alt text](https://www.keycloak.org/docs/latest/getting_started/keycloak-images/welcome.png "Criar usuario admin")
  
  ## Fazer login no console de administração
  
   1 - Clique no link Administration Console na página de Boas-vindas ou vá diretamente para http://localhost:8080/auth/admin/ (o URL do console).
   
   2 - Digite o nome de usuário e a senha que você criou na página de boas-vindas para abrir o console de administração.Tela de login do Admin Console.
   
   ![Alt text](https://www.keycloak.org/docs/latest/getting_started/images/admin-login.png "Login")
   
   
  3 - A tela inicial do console de administração é exibida.Admin console.
  
  ![Alt text](https://www.keycloak.org/docs/latest/getting_started/keycloak-images/admin-console.png "Admin console")
    
   ## Criar um realm
   
   O que é o realm?
   R: Como administrador na realm principal, você cria as realm onde os administradores criam usuários e aplicativos.
   
   Pré-requisitos:
   
     Keycloak está instalado.

     Você tem a conta de administrador inicial para o console de administração.
   
   1 - Vá para o endereço  http://localhost:8080/auth/ e faça login no console de administração do Keycloak usando a conta de administrador.

   2 - No menu Master, clique em Add Realm. Quando você está conectado ao domínio master, este menu lista todos os outros reinos.
    
