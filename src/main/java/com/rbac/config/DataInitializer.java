package com.rbac.config;

import com.rbac.entity.Role;
import com.rbac.entity.User;
import com.rbac.repository.RoleRepository;
import com.rbac.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;
import java.util.Set;

@Slf4j
@Configuration
public class DataInitializer {

    @Bean
    public CommandLineRunner initializeData(RoleRepository roleRepository, UserRepository userRepository, PasswordEncoder passwordEncoder) {
        return args -> {
            // Create roles if they don't exist
            if (roleRepository.findByName("ADMIN").isEmpty()) {
                Role adminRole = Role.builder()
                        .name("ADMIN")
                        .description("Administrator role with full access")
                        .build();
                roleRepository.save(adminRole);
                log.info("ADMIN role created");
            }

            if (roleRepository.findByName("USER").isEmpty()) {
                Role userRole = Role.builder()
                        .name("USER")
                        .description("Regular user role with limited access")
                        .build();
                roleRepository.save(userRole);
                log.info("USER role created");
            }

            // Create default admin user if it doesn't exist
            if (userRepository.findByUsername("admin").isEmpty()) {
                Role adminRole = roleRepository.findByName("ADMIN").orElseThrow();
                User adminUser = User.builder()
                        .username("admin")
                        .email("admin@example.com")
                        .password(passwordEncoder.encode("admin123"))
                        .isActive(true)
                        .roles(Set.of(adminRole))
                        .build();
                userRepository.save(adminUser);
                log.info("Default admin user created");
            }

            // Create default regular user if it doesn't exist
            if (userRepository.findByUsername("user").isEmpty()) {
                Role userRole = roleRepository.findByName("USER").orElseThrow();
                User regularUser = User.builder()
                        .username("user")
                        .email("user@example.com")
                        .password(passwordEncoder.encode("user123"))
                        .isActive(true)
                        .roles(Set.of(userRole))
                        .build();
                userRepository.save(regularUser);
                log.info("Default regular user created");
            }
        };
    }
}