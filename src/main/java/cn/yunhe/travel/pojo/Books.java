package cn.yunhe.travel.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Books {

  private Integer bookId;
  private String bookName;
  private Integer bookCounts;
  private String detail;
}
