# Demo GraalVM Spring Boot

## Execução

- Baixar a GraalVM (`sdk install java 20.2.0.r11-grl`)
- Utilizar essa versão para a sessão atual do terminal (`sdk use java 20.2.0.r11-grl`)
- Instalar o GraalVM Native Image (`gu install native-image`)
- Abrir a raiz do projeto e dar permissão de execução para o script compile.sh (`chmod +x compile.sh`)
- **Recomendado**: Dar permissão de leitura e gravação para o projeto completo.

### Execução com o Script

> Utilizar o [SDKMAN](https://sdkman.io/)

- Executar o script e aguardar (`./compile.sh`)
- Por fim, basta executar o compilado (`./target/native-image/graal-demo`)

### Execução com o Plugin do Maven

- No terminal, executar o comando do maven e aguardar (`mvn -Pnative clean package`)
- Por fim, basta executar o compilado (`./target/graal-demo`)

## Teste

Base URLs:

* <a href="http://localhost:8080">http://localhost:8080</a>

## localhost:8080/hello?name=Thiago

<a id="opIdlocalhost:8080/hello?name=Thiago"></a>

```http
GET http://localhost:8080/hello?name=Thiago HTTP/1.1
Host: localhost:8080

```

`GET /hello`

<h3 id="localhost:8080/hello?name=thiago-parameters">Parameters</h3>

| Name | In    | Type   | Required | Description |
| ---- | ----- | ------ | -------- | ----------- |
| name | query | string | true     | none        |

<h3 id="localhost:8080/hello?name=thiago-responses">Responses</h3>

| Status | Meaning                                                 | Description | Schema |
| ------ | ------------------------------------------------------- | ----------- | ------ |
| 200    | [OK](https://tools.ietf.org/html/rfc7231#section-6.3.1) | none        | None   |
