<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Toets webshop</title>
</head>
<body>

<H1> Toets</H1>
<div id="mydiv" style="height:150px; width:450px;">
<h4> 	Maak een webpagina volgens onderstaand voorbeeld waarin auto's of andere produkten worden vertoond en waarbij de gebruiker 
			kan selecteren op merk of minimum- en/of maximumprijs.</h4>
</div>
<br>

<h3> Uitwerking</h3>
<%
//-----------------alles----------------------
autolijst all = new autolijst();



//---------------niewe selectie---------------


String error = "";


%>
<div class="opdrachten" id="zelftoets">
	<h2>Toets</h2>

	
	<label>Kies Merk</label>
	 <form action="#" method="get">
		   <select name = "selectie" id="merk">
		   <option value="alles">Alle merken</option>
		   <%for(String string : all.getMerken() ){%>
			
  		 	<option value="<%=string%>"> <br> <%=string%></option>
   			         
		  <%} %>
		   </select>
	 
	   <br>
       <label>Minimum prijs</label>
       <input type="text" name="minPrijs">
       <label>Maximum prijs</label>
       <input type="text" name="maxPrijs"><br>
       <input type="submit" name="filterKnop" value="OK">  
       </form> 

	<div id="autoselectie"> 
              
                  
                    
                    
        <%
        if (request.getParameter ("filterKnop") != null) {
        	
        	int minPrijs;
        	int maxPrijs;
        	
        	try{
        	if (request.getParameter("minPrijs").equals ("") || request.getParameter("minPrijs") == null ) {
        		minPrijs = 1;
        	}  
        	
        	else {
        		minPrijs = Integer.parseInt(request.getParameter("minPrijs"));
        	}
        	
			if (request.getParameter("maxPrijs").equals ("") || request.getParameter("maxPrijs") == null ) {
        		maxPrijs = 9999999;
        	}      
			
			
        	else {
        		maxPrijs = Integer.parseInt(request.getParameter("maxPrijs"));
        	}
        	
        for(Auto auto : all.getFilter(request.getParameter("selectie"),minPrijs, maxPrijs)) {%>
        
         <div class="autokader">
         <img src="<%=auto.getFoto()%>" alt="<%=auto.getMerk()%> <%= auto.getType()%>">
         <p class="merktype"><%=auto.getMerk()%> <%= auto.getType()%></p>
         <p class="prijs">&euro; <%=auto.getPrijsFormat() %></p>
         </div>
         <%} 
        
        	}
        	
        	catch(NumberFormatException e){
        		error = "Voer correcte getallen in a.u.b.";
        	}
        	
        	
        }
        
        else{
        	
            
            for(Auto auto : all.getLijst()) {%>
             <div class="autokader">
             <img src="<%=auto.getFoto()%>" alt="<%=auto.getMerk()%> <%= auto.getType()%>">
             <p class="merktype"><%=auto.getMerk()%> <%= auto.getType()%></p>
             <p class="prijs">&euro; <%=auto.getPrijsFormat() %></p>
             </div>
             <%}  %>  
             
             
          </div>
          <%
        }
        %>   
        
        <p style = "color:red"> <%= error %>  </p>  
      </div>
</body>
</html>
