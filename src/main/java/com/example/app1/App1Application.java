package com.example.app1;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@SpringBootApplication
public class App1Application {

    public static void main(String[] args) {
        SpringApplication.run(App1Application.class, args);
    }

}

@RestController
class HelloController {

    @Value("${env:'NA'}")
    private String env;

    @GetMapping
    public AppData getAppData() {
        final AppData appData = new AppData();
        appData.setDate(new Date());
        appData.setVersion("v1");
        appData.setEnv(env);
        return appData;
    }
}

@Getter
@Setter
class AppData {
    private Date date;
    private String version;
    private String env;
}
