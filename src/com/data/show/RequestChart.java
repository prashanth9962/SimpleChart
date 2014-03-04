package com.data.show;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;


public class RequestChart {
	 private Cluster cluster=Cluster.builder().addContactPoints("127.0.0.1").build();
		private Session session=cluster.connect();
		private ResultSet rs;
		int mozcount=0,iecount=0,chromecount=0,safaricount=0,netscount=0;
		
	public RequestChart() {
		// TODO Auto-generated constructor stub
	}
     
	public List getdata(String s1,String s2){
		 String s3 = s1.replaceAll("-","/");
	        String s4=s2.replaceAll("-","/");
		session.execute("use browser");
		rs=session.execute("SELECT browser_name from browserdata where date>='"+s3+"' and date<='"+s4+"' allow filtering");
      	    Iterator<Row> it=rs.iterator();
           	 
        	  while(it.hasNext())
      	    {
      	    for(Row row:rs)
      	    {
      	    	if(row.getString("browser_name").equals("firefox"))
   	    	 {
   	    		mozcount++; 
   	    		System.out.println(mozcount);
   	    	 
   	    	 }
   	    	 else if(row.getString("browser_name").equals("ie"))
   	    	 {
   	    		 iecount++;
   	    		System.out.println(iecount);
   	    		 
   	    	 }
   	    	 else if(row.getString("browser_name").equals("chrome"))
   	    	 {
   	    		 chromecount++;
   	    		System.out.println(chromecount);
   	    		 
   	    	 }
   	    	 else if(row.getString("browser_name").equals("safari"))
   	    	 {
   	    		 safaricount++;
   	    		System.out.println(safaricount);
   	    	 
   	    	 }
   	    	 else if(row.getString("browser_name").equals("netscape"))
   	    	 {
   	    		 netscount++;
   	    		System.out.println(netscount);
   	    		 
   	    	 }  
      	    	
      	    	     	    	
      	    }
          }
        	  List l=new ArrayList();
      		l.add(mozcount);
      		l.add(iecount);
      		l.add(chromecount);
      		l.add(safaricount);
      		l.add(netscount);
      		System.out.println(l);
      	     return l;
        	  
        	  
	}
	
}
