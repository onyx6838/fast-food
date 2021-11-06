package com.handout.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class UriTest {
    public static void main(String[] args) throws UnsupportedEncodingException {
        String test = "Burger Cá";
        System.out.println(encodeValue(test));

        String decodeTest = "Burger%20C%C3%A1";
        String decodeTest1 = "Burger+C%C3%A1";
        System.out.println(decode(decodeTest));
    }

    private static String encodeValue(String value) throws UnsupportedEncodingException {
        return URLEncoder.encode(value, StandardCharsets.UTF_8.toString());
    }

    private static String decode(String value) throws UnsupportedEncodingException {
        return URLDecoder.decode(value, StandardCharsets.UTF_8.toString());
    }
}
