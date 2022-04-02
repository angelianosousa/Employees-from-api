# Employees System - Challenge
Projeto de testes para consumo de api externa, dentro do projeto você pode importar os usuários e cadastrá-los no banco de dados interno e exibi as informações desses usuários dentro da página principal, como também é possível executar o CRUD completo no projeto.

# Dependências

* Rails 6.0.4
* Ruby 2.7.5
* PostgreSQL
* Rest Client *para as requisições com api externa*
* Bootstrap 4.6.1
* JQuery 3.3.1
* Carrierwave 2.0
* Rspec 3.8

# Sobre o desenvolvimento
## Tempo

* 3 dias

## Dificuldades
A parte que mais demorou para ser concluída foi o uso do carrierwave para o upload de imagens a partir da url e o deploy do projeto no heroku, descobri a pouco que no rails 6.x o framework não usa mais um precompilador para javascript. Para resolver isso tive que ler a documentação do Heroku novamente e descobrir que precisava instalar 2 buildpacks um para o Ruby e outro para o Node.

Por último adicionei os testes com Rspec para a área de desenvolvimento

# Como rodar o projeto

~~~
  bundle
  yarn install
  rails db:create db:migrate
  rails s
~~~

# Rodando os testes com Rspec
O Projeto não possui nenhuma validação personalizada, então tratei de garantir que as funções do projeto estavam funcionando corretamentamente.

~~~
  bundle exec rspec spec/request
~~~

# Link de Produção

* Heroku: <https://employees-challenge.herokuapp.com/>

# Autor
Angeliano Sousa

* Linkedin: <https://www.linkedin.com/in/angeliano-sousa/>