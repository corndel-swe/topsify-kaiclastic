package org.example;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Main {

    private static void sqlUserOutput(String input, String output) {
     try {
        ObjectMapper objectMapper = new ObjectMapper();
        FileReader fileReader = new FileReader(input);
        FileWriter fileWriter = new FileWriter(output);
        ArrayNode users = (ArrayNode) objectMapper.readTree(fileReader);
        System.out.println(users);

        for (JsonNode user : users) {
             System.out.println(user);
            int id = user.get("id").asInt();
            String username = user.get("username").toString();
            String firstName = user.get("first_name").toString();
            String lastName = user.get("last_name").toString();
            String email = user.get("email").toString();
            String avatar = user.get("avatar").toString();
            String password= user.get("password").toString();

            String sql = String.format("INSERT INTO users (id, username, first_name, last_name, email, avatar, password) VALUES (%d, '%s', '%s', '%s', '%s', '%s', '%s');",
                    id, username, firstName, lastName, email, avatar, password);

        }

        fileWriter.write(sql + "\n");
    }
     catch (IOException e) {
        e.printStackTrace();
    }
    }

    public static void main(String[] args) {
      sqlUserOutput("reports/users.json", "db/seeds/users.sql");
    }
}