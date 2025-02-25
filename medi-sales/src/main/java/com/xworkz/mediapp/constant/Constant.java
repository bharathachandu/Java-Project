package com.xworkz.mediapp.constant;

import lombok.Getter;

@Getter
public enum Constant {
    PROFILE_PHOTO_PATH("C://profilephoto/"),FROM_EMAIL("bharath.anand.m@gmail.com"),PASSWORD("cqjk wqvb bndd dnlq"),FROM_NAME("Bharath A");

    private String path;

    Constant(String path)
    {
        this.path=path;
    }
}
