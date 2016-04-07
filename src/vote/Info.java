package vote;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import nsysudop.gb.ServerData;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;


public class Info {
    public Info ()
    {
        earn = new int[sd.vote_item_num+1];
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("Result");
        PreparedQuery pq = dataService.prepare(q); 
        try
        {
        for (Entity result : pq.asIterable()) 
        {
            if(result.hasProperty("name"))
            {
                earn[ Integer.parseInt(result.getProperty("name")+"")]= Integer.parseInt(result.getProperty("tickets")+"");
            }
        }
        }catch(Exception e) {}
    }
    int earn[] ;
    public int ticket_earn(String num)
    {
        return earn[Integer.parseInt(num)];
    }
    public String ticket_earn_list()
    {
        String s = earn[0]+"";
        for(int i = 1 ; i < earn.length ; i++)
        {
            s+=  "," + earn[i];
        }
        return s;
    }
    public String getticket()
    {
        return sd.vote_ticket_num+"";
    }
    public int last_ticket(HttpSession session)
    {
        String id = session.getAttribute("fb")+"";
        if(id.length()<5)
            return 0;
        else {
            
        
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("Vote");
        PreparedQuery pq = dataService.prepare(q); 
        int t = sd.vote_ticket_num;
        for (Entity result : pq.asIterable()) 
        {
            if((result.getProperty("id")+"").equals(id))
            {
                t  = sd.vote_ticket_num-(result.getProperty("vote")+"").split(",").length;
                break;
            }
            
        }
        return t;}
    }
    boolean hasvote(HttpSession session,String num)
    {
        String id = session.getAttribute("fb")+"";
        if(id.length()<2)
            return false;
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("Vote");
        PreparedQuery pq = dataService.prepare(q); 
        boolean voted = false;
        for (Entity result : pq.asIterable()) 
        {
            if((result.getProperty("id")+"").equals(id))
            {
                String votes[] = (result.getProperty("vote")+"").split(",");
                for(int i =0  ;i<votes.length ;i++)
                {
                    if(votes[i].equals(num))
                        voted=true;
                }
                break;
            }
            
        }
        return voted;
    }
    ServerData sd = new ServerData();
    public String vote(String num,HttpSession session)
    {
        //投票結束
        SimpleDateFormat end = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        try {
              Date endt = end.parse(sd.endDate);
              if(sd.now().after(endt))
                  return "投票系統已關閉@";
        } catch (Exception e) {
            // TODO: handle exception
        }
        if(!sd.voteopen)
            return "投票系統已關閉@";
        if( session.getAttribute("fb")==null)
            return "必須登入@";  
        String id = session.getAttribute("fb")+"";
        if(last_ticket(session)<=0)
            return "每人只能投"+sd.vote_ticket_num+"票@";
        if(hasvote(session, num))
            return "您已經投過"+num+"號了@";
        
        
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("Result");
        PreparedQuery pq = dataService.prepare(q); 
        int t = 0;
        Entity update=null;
        for (Entity result : pq.asIterable()) 
        {
            if(!result.hasProperty("name"))
            {}
            else if(result.getProperty("name").equals(num))
            {
                t = Integer.parseInt(result.getProperty("tickets")+"");
                result.setProperty("tickets", t+1);
                update = result;
                break;
            }
            
        }
        if(update==null)
        {
            update = new Entity("Result");
            update.setProperty("tickets", 1);
            update.setProperty("name", num);
        }
        dataService.put(update);
        
        Query q2 = new Query("Vote");
        PreparedQuery pq2= dataService.prepare(q2); 
        String ts="";
        Entity update2=null;
        for (Entity result : pq2.asIterable()) 
        {
            if(!result.hasProperty("id"))
            {}
            if((result.getProperty("id")+"").equals(id))
            {
                ts = result.getProperty("vote")+"";
                result.setProperty("vote", ts+num+",");
                update2 = result;
                break;
            }
            
        }
        if(update2==null)
        {
            update2 = new Entity("Vote");
            update2.setProperty("vote", num+",");
            update2.setProperty("id", id);
        }
        dataService.put(update2);
        return "success@";
    }
}
