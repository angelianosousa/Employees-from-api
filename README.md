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

# Sobre o desenvolvimento
## Tempo

* 3 dias

## Dificuldades
A parte que mais demorou para ser concluída foi o uso do carrierwave para o upload de imagens a partir da url e o deploy do projeto no heroku, descobri a pouco que no rails 6.x o framework não usa mais um precompilador para javascript

# Como rodar o projeto

~~~
  bundle
  yarn install
  rails db:create db:migrate
  rails s
~~~

# Link de Produção

* Heroku: <https://employees-api-extern.herokuapp.com/>
