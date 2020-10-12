package br.com.cardoso.graal.router;

import br.com.cardoso.graal.handler.HelloHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.ServerResponse;

import static org.springframework.web.reactive.function.server.RequestPredicates.GET;
import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@Configuration(proxyBeanMethods=false)
public class HelloRouter {

    @Bean
    public RouterFunction<ServerResponse> routing(HelloHandler helloHandler){
        return route(GET("/hello"), helloHandler::hello)
                .and(route(GET("/hello?name={name}"), helloHandler::hello));
    }
}
