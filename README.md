# nsysudop
中山光電系系學會網站<br>
第六屆光電系學會 宣傳組<br>

需要加入設定檔案<br>
src\nsysudop\gb\ServerData.java<br>
內容為<br>
<code>
package nsysudop.gb;

import java.util.Calendar;
import java.util.Date;

public class ServerData 
{
          public final  String host = "http://nsysudops.appspot.com";
          public final  String facebookID = "*";
          public final  String FB_secret = "*";
          public final  String Group_ID = "*";
          
          //桌遊租借服務
          public final int rentSameTime = 2;
          public final  String[] authFB = {"*","*","*"};//授權帳號
          public final int itemNum = 10;//桌遊數
          public final int rentlong = 5;//5week
          public final int cancletime = 1;//幾天前能取消
          public  final int rentdate = Calendar.MONDAY;
          public final String [] games =  {"吹牛大王骰盅","蟑螂沙拉","蟑螂濃湯","Modern art","HALLI GALLI","象棋","俄羅斯輪盤","123 GAMES","波多黎各","卡卡頌"};
          
          //投票系統
          public final String endDate = "2015/11/29 23:59:59";
          public final boolean voteopen = true;
          public final int vote_item_num = 11; // 投票件數
          public final int vote_ticket_num = 2; // 每人可投票數
          
          //活動系統
          public final String [] activities = {"htmlclass"};
          public final  String[] authFB_activity  = {"*","*"};
          public Date now()
          {
              Calendar calendar = Calendar.getInstance();
              calendar.add(Calendar.HOUR, 8);
              return calendar.getTime();
              
          }
        
}

</code>
