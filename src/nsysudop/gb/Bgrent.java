package nsysudop.gb;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.Vector;





import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class Bgrent 
{ 
    ServerData sData = new ServerData();
    public Date[] nextrent()
    {
       
        Date now = sData.now();
        Calendar n = Calendar.getInstance();
        n.setTime(now);
        int week = n.get(Calendar.DAY_OF_WEEK);
 
        while(week != sData.rentdate )
        {
            n.add(Calendar.DATE, 1);
            week = n.get(Calendar.DAY_OF_WEEK);
        }
        Date rentDate [] = new Date[(sData.rentlong+1)];
        for(int i=0;i<rentDate.length;i++)
        {
            rentDate[i] = n.getTime();
            n.add(Calendar.DATE, 7);
        }
        
        return rentDate;
    }
    
    public Boolean[] canrent(Date first,String num)
    {

        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("Bg"+num);
        PreparedQuery pq = dataService.prepare(q); 
        Boolean [] result = new Boolean[sData.rentlong+1];
        for(int i=0;i<result.length;i++)
        {
            result[i] = true;
        }
        if(pq==null)
            return result;
        Vector<String> rented = new Vector<>();
        for (Entity res : pq.asIterable()) 
        {
            rented.add( res.getProperty("date")+"");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        Calendar firsts = Calendar.getInstance();
        firsts.setTime(first);
        for(int i=0;i<result.length;i++)
        {
            String s = sdf.format(firsts.getTime());
            firsts.add(Calendar.DATE, 7);
            for(int j=0;j<rented.size();j++)
            {
                    if(s.equals(rented.get(j)))
                    {
                        result[i]=false;
                        break;
                    }
            }
        }
        return result;
    
    }
    public String rent(String num,String date,String name,String phone,HttpSession session)
    {
            if(session.getAttribute("fb")==null)
                return "登入失敗";
            else
            {
                    String id =session.getAttribute("fb")+"";
                    int times  =getrentTime(id);
                    if(times>=sData.rentSameTime)
                        return "您一次只能申請"+sData.rentSameTime+"次租借";
                    else
                    {
                        
                        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
                        Query q = new Query("Bg"+num);
                        PreparedQuery pq = dataService.prepare(q); 
                      
                        for (Entity res : pq.asIterable()) 
                        {
                            if(date.equals(res.getProperty("date")))
                            {
                                return "System error";
                            }
                            
                        }
                        Entity entity = new Entity("Bg"+num);
                        entity.setProperty("date", date);
                        entity.setProperty("id", id);
                        entity.setProperty("name", name);
                        entity.setProperty("phone", phone);
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
                        entity.setProperty("subdate", sdf.format(sData.now()));
                        dataService.put(entity);
                         setrentTime(id, times+1);
                         return "success";
                    }
            }
    }
     void setrentTime(String id,int n)
    {
         DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
         Query q = new Query("People");
         PreparedQuery pq = dataService.prepare(q); 
         for (Entity res : pq.asIterable()) 
         {
             if(id.equals(res.getProperty("id")+""))
             {
                 res.setProperty("times", n);
                 dataService.put(res);
                 return;
             }
         }
         Entity entity = new Entity("People");
         entity.setProperty("id", id);
         entity.setProperty("times", n);
         dataService.put(entity);
         
    }
    public int getrentTime(String id)
    {
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("People");
        PreparedQuery pq = dataService.prepare(q); 
        for (Entity res : pq.asIterable()) 
        {
            if(id.equals(res.getProperty("id")+""))
            {
                return Integer.parseInt(res.getProperty("times")+"");
            }
        }
        return 0;
    }
    
    public String getList(String id)
    {
        String re="";
        Boolean auth = false;
        for(int i=0;i<sData.authFB.length;i++)
        {
            if(id.equals(sData.authFB[i]))
            {
                auth = true;
                break;
            }
        }
        int ns = 1;
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        for(int i  = 1 ; i<= sData.itemNum;i++)
        {
            Query q = new Query("Bg"+i);
            PreparedQuery pq = dataService.prepare(q); 
         
            for (Entity res : pq.asIterable()) 
            {
 
                String key =  KeyFactory.keyToString(res.getKey());
                ns ++;
                if(auth)
                {
                    re+="<tr>";
                    re+="<td>"+ns+"</td>";
                    re+="<td>"+sData.games[i-1]+"</td>";
                    re+="<td>"+res.getProperty("date")+"</td>";
                    re+="<td><a target='_blank' href='http://www.facebook.com/"+res.getProperty("id")+"'>"+res.getProperty("name")+"</a></td>";
                    re+="<td>"+res.getProperty("phone")+"</td>";
                    re+="<td>"+res.getProperty("subdate")+"</td>";
                    re+="<td><a href='../member/api/rentbg.jsp?t=back&key="+key+"&bg="+i+"'>歸還/取消</a></td>";
                    re+="</tr>";
                }
                else 
                {
                    if(res.getProperty("id").equals(id))
                    {
                        re+="<tr>";
                        re+="<td>"+ns+"</td>";
                        re+="<td>"+sData.games[i-1]+"</td>";
                        re+="<td>"+res.getProperty("date")+"</td>";
                        re+="<td><a target='_blank' href='http://www.facebook.com/"+res.getProperty("id")+"'>"+res.getProperty("name")+"</a></td>";
                        re+="<td>"+res.getProperty("phone")+"</td>";
                        re+="<td>"+res.getProperty("subdate")+"</td>";
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                        try {
                            Date rt = sdf.parse(res.getProperty("date")+"");
                            Calendar canCancle = Calendar.getInstance();
                            canCancle.setTime(sData.now());
                            canCancle.add(Calendar.DATE,sData.cancletime);
                            if(rt.after(canCancle.getTime()))
                            {
                                re+="<td><a href='../member/api/rentbg.jsp?t=cancle&key="+key+"&bg="+i+"'>取消</a></td>";
                            }
                            else {
                                re+="<td>無法取消</td>";
                            }
                        } catch (Exception e) {
                            // TODO: handle exception
                        }
                        
                       
                        re+="</tr>";
                    }
                }
            }
        }
      
        return re;
    }
    public String cancle(String key ,String id,String bg)
    {
        Boolean auth = false;
        for(int i=0;i<sData.authFB.length;i++)
        {
            if(id.equals(sData.authFB[i]))
            {
                auth = true;
                break;
            }
        }
        try {
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("Bg"+bg);
        PreparedQuery pq = dataService.prepare(q); 
        for (Entity res : pq.asIterable()) 
        {
            if(KeyFactory.keyToString(res.getKey()).equals(key))
            {
                if(!auth)
                    if(!(res.getProperty("id")+"").equals(id))
                        return "id error";
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                Date rt = sdf.parse(res.getProperty("date")+"");
                Calendar canCancle = Calendar.getInstance();
                canCancle.setTime(sData.now());
                canCancle.add(Calendar.DATE,sData.cancletime);
                if(rt.after(canCancle.getTime()))
                {
                    dataService.delete(res.getKey());
                    setrentTime(id, getrentTime(id)-1);
                    return "success";
                }
                else {
                   return "date error";
                }
                
            }
        }
        return "key error 2";
        } catch (Exception e) {
            return "key error"+e;
        }

        
        
    }
    public String back(String key ,String id,String bg)
    {
        Boolean auth = false;
        for(int i=0;i<sData.authFB.length;i++)
        {
            if(id.equals(sData.authFB[i]))
            {
                auth = true;
                break;
            }
        }
        if(!auth)
            return "auth error";
        try {
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("Bg"+bg);
        PreparedQuery pq = dataService.prepare(q); 
        for (Entity res : pq.asIterable()) 
        {
            if(KeyFactory.keyToString(res.getKey()).equals(key))
            {      
                    dataService.delete(res.getKey());
                    setrentTime(id, getrentTime(id)-1);
                    return "success";
            }
        }
        return "key error 2";
        } catch (Exception e) {
            return "key error"+e;
        }

        
        
    }
    
}
