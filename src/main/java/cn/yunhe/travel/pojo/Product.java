package cn.yunhe.travel.pojo;


import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class Product {

  private String id;
  private String productNum;
  private String productName;
  private String cityName;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private java.util.Date departureTime;
  private Integer productPrice;
  private String productDesc;
  private Integer productStatus;

}
