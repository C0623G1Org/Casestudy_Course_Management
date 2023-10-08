package com.example.coursemanagement.utils;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexUtils {
    private String regex;

    public boolean validate(String regex, String REGEX) {
        Pattern pattern = Pattern.compile(REGEX);
        Matcher matcher = pattern.matcher(regex);
        return matcher.matches();
    }


    public boolean validateName(String string) {
        regex = "^([A-Z]([a-z0-9\\s-])+)+$";
        return validate(string, regex);
    }

    public boolean validateFullNameCustomer(String string) {
        regex = "^[A-Za-z][a-z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+(\\s[A-Za-z][a-z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+)+$";
        return validate(string, regex);
    }

    public boolean validatePass(String string) {
        regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$";
        return validate(string, regex);
    }
    public boolean validateUsername(String string) {
        regex = "^[a-zA-Z0-9_]+$";
        return validate(string, regex);
    }

    public boolean validateUrlImage(String string) {
        regex = "^(http(s?):\\/\\/)([^\\/\\s]+\\/)(.*)\\.(jpg|jpeg|png|gif|webp)$";
        return validate(string,regex);
    }

    public boolean validateString(String string){
        regex = "^[A-Za-zÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ0-9\\s-\\<\\/>\\.\\:\\n]+$";
        return validate(string,regex);
    }
    public boolean validateIdentityCard(String string) {
        regex = "^[0-9]{9}|[0-9]{12}$";
        return validate(string, regex);
    }

    public boolean validatePhoneVietNam(String string) {
        regex = "^(84|0)[2|3|5|7|8|9]{1}[0-9]{8}$";
        return validate(string, regex);
    }

    public boolean validateEmail(String string) {
        regex = "[a-z0-9]+@[a-z]+\\.[a-z]{2,3}";
        return validate(string, regex);
    }


    public boolean validatePrice(String string) {
        regex = "^[0-9]+\\.[0-9]+$";
        return validate(string, regex);
    }
    public boolean validateOnlyNumber(String string) {
        return validate(string, regex);
    }
}
