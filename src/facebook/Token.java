package facebook;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import nsysudop.gb.ServerData;

import com.google.appengine.labs.repackaged.com.google.common.io.CharStreams;
import com.google.appengine.labs.repackaged.org.json.JSONArray;
import com.google.appengine.labs.repackaged.org.json.JSONObject;

public class Token 
{
    ServerData sd = new ServerData();
    String appID = sd.facebookID;
    String secret = sd.FB_secret;
    String redirect =  sd.host +"/facebook/step2.jsp";
    public String FB_ID ="null";
    public String FB_Name = "null";
        public boolean getToken(String code)
        {
           
             try 
             { 
                URLConnection connect = null;
                URL url = new URL("https://graph.facebook.com/v2.3/oauth/access_token?client_id="+appID + 
                        "&redirect_uri=" + redirect +
                        "&client_secret=" + secret+
                        "&code="+code);
                connect = url.openConnection();
                InputStream is = connect.getInputStream();
                JSONObject  jsonObject = new JSONObject(CharStreams.toString(new InputStreamReader(is, "UTF-8"))); 
                FB_ID = jsonObject+"";
                String token= jsonObject.getString("access_token");
                
                URL getid = new URL("https://graph.facebook.com/v2.5/me?access_token="+token);
              
                connect = getid.openConnection();
                is = connect.getInputStream();
                byte []read = new byte[is.available()];
                is.read(read);
               String jsonText = new String(read, "UTF-8");
               JSONObject  data = new JSONObject(jsonText);
               
               String user_ID=data.getString("id");
               String user_name = data.getString("name");
               FB_ID = user_ID;
               FB_Name = user_name;
               String nexturl = "https://graph.facebook.com/v2.5/"+sd.Group_ID+"/members?fields=id&limit=50&"
                       + "access_token="+token;
               Boolean dop = false;
               while(nexturl!="")
               {
                   URL member_url = new URL(nexturl);
                   URLConnection connect2 = null;
                   connect2 = member_url.openConnection();
                   InputStream is2 = connect2.getInputStream();
                   byte []read2 = new byte[is2.available()];
                   is2.read(read2);
                   String jsonText2 = new String(read2, "UTF-8");
                   JSONObject  member = new JSONObject(jsonText2);
                   JSONArray id_list = member.getJSONArray("data");
                   for(int i=0;i<id_list.length();i++)
                   {
                       if(user_ID.equals(id_list.getJSONObject(i).getString("id")))
                       {
                           dop = true;
                           break;
                       }
                   }
                   if(dop)
                       break;
                   if(member.has("paging"))
                   {
                       if(member.getJSONObject("paging").has("next"))
                       {
                           nexturl = member.getJSONObject("paging").getString("next");
                       }
                       else {
                           nexturl="";
                       }
                   }
                   else {
                       nexturl="";
                   }
                   
               }
                 
                return  dop;
            } catch (Exception e) {
                // TODO Auto-generated catch block
          //      FB_ID = e+"";
                return false;
            }
           
        }
}
