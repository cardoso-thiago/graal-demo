package br.com.cardoso.graal.handler;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

import java.util.Optional;

@Component
public class HelloHandler {

    public Mono<ServerResponse> hello(ServerRequest request){
        Optional<String> name = request.queryParam("name");
        return ServerResponse.ok().contentType(MediaType.TEXT_PLAIN)
                .body(BodyInserters.fromValue("Hello, " + name.orElse("Anonymous")));
    }
}
