package com.example.app1;

import lombok.SneakyThrows;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@WebMvcTest
public class HelloControllerIT {

    @Autowired
    private MockMvc mockMvc;

    @SneakyThrows
    @Test
    public void get_status_200_ok() {
        mockMvc.perform(
                get("/")
                        .accept(MediaType.APPLICATION_JSON)
        ).andExpect(status().isOk());
    }
}