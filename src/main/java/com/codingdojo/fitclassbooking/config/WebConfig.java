package com.codingdojo.fitclassbooking.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${upload.directory}")
    private String mediaStoragePath;

    @Value("${media.url.path}")
    private String mediaUrlPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(mediaUrlPath + "**")
                .addResourceLocations("file:" + mediaStoragePath + "/");
    }
}
