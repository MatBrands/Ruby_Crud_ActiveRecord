require "mysql2"

class Banco
  def initialize (host = "localhost", username = "root", password = "root", database = "teste")
    @host = host
    @username = username
    @password = password
    @database = database
  end

  def connect
    begin
      @client = Mysql2::Client.new(:host => @host, :username => @username, :password =>@password, :database => @database)
      if @client
        puts "Conexão bem sucedida."
        puts
      end
    rescue Exception => error
      puts "Falha. #{error}"
      exit
    end
  end

  def create_tables
    self.connect
    @client.query("create table users(
      id int not null auto_increment primary key,
      nome varchar(30) not null,
      email varchar(30) not null,
      sexo varchar(1) not null
      )")
    puts "Tabela criada com sucesso!"
    @client.close
  end

  def insert
    self.connect
    @client.query("insert into users (nome, email, sexo) values ('Elizabeth', 'zaza@gmail.com', 'F')")
    puts "Dados salvos com sucesso !"
    @client.close
  end

  def select
    self.connect
    @dados = @client.query("select * from users")
    @dados.each do |k|
      a = k
      a.each do |key, value|
        puts "#{key}:#{value}"
      end
      puts
      @client.close
    end
  end

  def delete
    self.connect
    @client.query("delete from users where id = '1' ")
    puts "Deletado com sucesso!"
    @client.close
  end

  def create_database
    self.connect
    @client.query("create database teste2")
    puts "Banco de dados criado com sucesso!"
    @client.close
  end

end

