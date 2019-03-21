package com.just.tools;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * @author 贺文杰
 * 2019/3/8 22:03
 */

public class MD5 {

    public static String md5(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
           str=  new BigInteger(1, md.digest()).toString(10);
           str=str.substring(1,10);
//            byte b[] = md.digest();
//
//            int i;
//
//            StringBuffer buf = new StringBuffer("");
//            for (int offset = 0; offset < b.length; offset++) {
//                i = b[offset];
//                if (i < 0) {
//                    i += 256;
//                }
//                if (i < 16) {
//                    buf.append("0");
//                    buf.append(Integer.toHexString(i));
//                }
//            }
//            str = buf.toString();
        } catch (Exception e) {
            e.printStackTrace();

        }
        return str;
    }

    public static void main(String[] args) {
        System.out.println(md5("<span class=\"wrs_metrics\" style=\"position: absolute; top: -9999px; white-space: nowrap;\"><span class=\"wrs_notItalic wrs_notBold wrs_specialChar\" style=\"position: fixed; top: -9999px; left: 0px; margin: 0px; padding: 0px; font-size: 16px;\">\uF002<img src=\"https://www.wiris.net/demo/editor/resources/decoration/baseline_mark.png?v=7.8.0.6490\" style=\"height: 0px; width: 0px;\"></span></span><span class=\"wrs_notItalic wrs_notBold wrs_font_inherit\" style=\"color: rgb(0, 0, 0); position: absolute; left: 0px; top: 2px; z-index: 2; font-size: 16px;\">1</span><span class=\"wrs_notItalic wrs_notBold wrs_font_inherit\" style=\"color: rgb(0, 0, 0); position: absolute; left: 9px; top: 2px; z-index: 2; font-size: 16px;\">2</span><span class=\"wrs_notItalic wrs_notBold wrs_font_inherit\" style=\"color: rgb(0, 0, 0); position: absolute; left: 18px; top: 2px; z-index: 2; font-size: 16px;\">3</span><span class=\"wrs_notItalic wrs_notBold wrs_font_inherit\" style=\"color: rgb(0, 0, 0); position: absolute; left: 27px; top: 2px; z-index: 2; font-size: 16px;\">4</span><div class=\"wrs_underlineCaret wrs_dark\" style=\"left: 0px; top: 18px; border-bottom-width: 1px; width: 36px;\"></div><div class=\"wrs_inverseCaret\" style=\"left: -1000px; top: -1000px; border-left-width: 0px; height: 0px;\"></div><div class=\"wrs_caret wrs_dark\" style=\"left: 36px; top: 0px; border-left-width: 1px; height: 20px;\"></div>"));    }

}
