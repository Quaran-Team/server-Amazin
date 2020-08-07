package com.talentpath.amazin.api;

import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.testng.Assert;
import org.testng.annotations.Test;

import static io.restassured.RestAssured.given;
import static io.restassured.RestAssured.when;
import static org.hamcrest.Matchers.hasItems;


public class BWLStarRouteTest {

     //first test using api from tutorial - some weird error they don't work yet
    @Test
    public void test_GET_bwl01() {
        Response response = RestAssured.get("//reqres.in/api/");

        System.out.println(response.asString());
        System.out.println(response.getBody().asString());
        System.out.println(response.getStatusCode());
        System.out.println(response.getStatusLine());
        System.out.println(response.getHeader("content-type"));
        System.out.println(response.getTime());

        int statusCode = response.getStatusCode();

        Assert.assertEquals(statusCode, 200);

    }

    @Test
    public void
    our_api_works() {

        when().
                get("/api/v1/totalstars").
                then().
                statusCode(200).
                body("ratingId", hasItems(1, 2));


    }


//    @Test
//    public void test_1 () {
//
//        given().
//                get(" https://reqres.in/api/users?page=2").then()
//                .statusCode(200);
//    }




}