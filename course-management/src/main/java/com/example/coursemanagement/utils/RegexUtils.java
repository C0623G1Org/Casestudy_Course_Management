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

    public boolean is18YearsOld(String birthday) {
        LocalDate birthDate = LocalDate.parse(birthday, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        LocalDate currentDate = LocalDate.now();
        Period period = Period.between(birthDate, currentDate);
        return period.getYears() >= 18;
    }


    public boolean validateName(String string) {
        regex = "^[A-Z][a-z]*(\\s[A-Z][a-z]*)*$";
        if (!validate(string, regex)) {
            System.out.println("Tên không hợp lệ !");
        }
        return validate(string, regex);
    }

    public boolean validateBirthday(String string) {
        regex = "^(0[1-9]|[1-2][0-9]|3[0-1])-(0[1-9]|1[0-2])-((19|20)\\d{2})$";
        if (!validate(string, regex) || !is18YearsOld(string)) {
            if (!validate(string, regex)) {
                System.out.println("Birthday khong dung dinh dang");
            } else {
                System.out.println("Khong duoc phep nhap duoi 18 tuoi");
            }
            return false;
        } else {
            return true;
        }
    }

    public boolean validateIdentityCard(String string) {
        regex = "^[0-9]{9}|[0-9]{12}$";
        if (!validate(string, regex)) {
            System.out.println("CMND không hợp lệ !");
        }
        return validate(string, regex);
    }

    public boolean validatePhoneVietNam(String string) {
        regex = "^(84|0)[2|3|5|7|8|9]{1}[0-9]{8}$";
        if (!validate(string, regex)) {
            System.out.println("So dien thoai không hợp lệ !");
        }
        return validate(string, regex);
    }

    public boolean validateEmail(String string) {
        regex = "[a-z0-9]+@[a-z]+\\.[a-z]{2,3}";
        if (!validate(string, regex)) {
            System.out.println("Email không hợp lệ !");
        }
        return validate(string, regex);
    }


    public boolean validatePrice(String string) {
        regex = "^[0-9]\\d*(\\.\\d+)?$";
        if (!validate(string, regex)) {
            System.out.println("Chuoi nhap vao khong hop le");
            return false;
        } else {
            if (Float.parseFloat(string) <= 0) {
                System.out.println("So nhap vao phai lon hon 0");
                return false;
            } else {
                return true;
            }
        }
    }
    public boolean validateOnlyNumber(String string) {
        regex = "^[0-9]+$";
        if (!validate(string, regex)) {
            System.out.println("Chi duoc phep nhap so");
            return false;
        } else {
            return true;
        }
    }
    public boolean validateOnlyLink(String string) {
        regex = "^https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%_\\+.~#()?&//=]*)$";
        if (!validate(string, regex)) {
            System.out.println("Chi duoc phep nhap duong link");
            return false;
        } else {
            return true;
        }
    }
    public boolean validateOnlyNumberOrText(String string) {
        regex = "^[a-zA-Z0-9\\s\\,]+$";
        if (!validate(string, regex)) {
            System.out.println("Chi duoc phep nhap so hoac chu");
            return false;
        } else {
            return true;
        }
    }

    public boolean validateOnlyText(String string) {
        regex = "^[a-zA-Z\\s\\,]+$";
        if (!validate(string, regex)) {
            System.out.println("Chi duoc phep nhap chu");
            return false;
        } else {
            return true;
        }
    }
}
