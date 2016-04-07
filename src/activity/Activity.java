package activity;

import javax.servlet.http.HttpSession;

import nsysudop.gb.ServerData;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Text;


public class Activity
{
    public Activity (HttpSession session,String names)
    {
        id = session.getAttribute("fb")+"";
        boolean eventOK = false;
        for (String s : sd.activities) {
           if(s.equals(names))
           {
               eventOK = true;
               break;
           }
       }
        if(!eventOK)
        {
            people = null;
            return;
        }
        name = names;
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("Activity");
        PreparedQuery pq = dataService.prepare(q); 
        people="";
        for (Entity result : pq.asIterable()) 
        {
            if((result.getProperty("Name")+"").equals(name))
            {
                Text text = (Text)result.getProperty("People");
                list =  result;
                people = text.getValue();
                break;
            }            
        }
        
    }
    String people=null ;
    String id="null";
    String name = "";
    ServerData sd = new ServerData();
    Entity list = null;
    public String num() {
        boolean ok = false;
        for (String s : sd.authFB_activity) {
            if(s.equals(id))
            {
                ok = true;
                break;
            }
        }
        if(ok)
        {
            return people.split(",").length+"";
        }
        else {
            return "0";
        }
    }
    public boolean join()
    {
        if(people==null)
            return false;
        if(id.length()<5)
            return false;
        if(hasJoin())
            return false;
        if(list==null)
        {
            list = new Entity("Activity");
            list.setProperty("Name", name);
        }
        
        if(people.length()<2)
            list.setProperty("People",  new Text(id));
        else
            list.setProperty("People", new Text(people + "," + id));
        
        DatastoreService dataService = DatastoreServiceFactory.getDatastoreService();
        dataService.put(list);
        return true;
      
    }
    public boolean hasJoin()
    {
         if(id.length()<5)
             return false;
         if(people==null)
             return false;
         
         boolean has = false;
         String joins[]= people.split(",");
         for (String peo : joins) {
            if(peo.equals(id))
            {
                has = true;
                break;
            }
        }
         return has;
    }

}
