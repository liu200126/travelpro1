package cn.yunhe.travel.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Orders {

  private String id;
  private String orderNum;
  private java.util.Date orderTime;
  private Integer peopleCount;
  private String orderDesc;
  private Integer payType;
  private Integer orderStatus;
  private String productId;
  private String memberId;
  private Product product;
  //会员
  private Member member;
  //游客
  private List<Traveller> travellers;
}
