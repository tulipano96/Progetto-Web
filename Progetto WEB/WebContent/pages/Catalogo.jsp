<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
		HttpSession s = request.getSession();
%>

<%
	Collection<?> prodotti = (Collection<?>) request.getAttribute("products");
%>
<%
	Carrello carrello;
	if(((Carrello)s.getAttribute("carrello1"))==null){//prima volta che si accede alla sessione
		//impostare l'attributo con un nuovo carrello
		carrello = new Carrello();
		s.setAttribute("carrello1", carrello);
	} else { // successive volte
		//prendere il carrello dagli attributi
		carrello = (Carrello)s.getAttribute("carrello1"); //conviene istanziaredirettamente un carrello
	}	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.util.*,it.beans.* "%>
<head>
<link rel="icon" type="image/png" href="images/icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="stylesheet/catalogo_style.css" type="text/css">
<title>Ca.Sa.Caff&egrave; - Catalogo</title>
</head>
<body>

	<%
		if (request.getParameter("aggiungi") != null
				&& request.getParameter("aggiungi").equals("Aggiungi al carrello")) {
			String codiceDaCercare = "";
			codiceDaCercare = request.getParameter("codiceAggiungi");
			Prodotto prodotto = new Prodotto();
			String quantita = request.getParameter("quantita"+codiceDaCercare);

			Iterator<?> it = prodotti.iterator();

			while (it.hasNext()) {
				Prodotto p = (Prodotto) it.next();
				if (p.getCodice().equals(codiceDaCercare)) {
					prodotto = prodotto.clone(p);
				}
			}
			carrello.aggiungiProdotto(prodotto,quantita);
					
		}
	
	
	%>

	<h2 id="titolo">Prodotti</h2>

	
		<%
			if (prodotti != null && prodotti.size() != 0) {
				Iterator<?> itt = prodotti.iterator();
				while (itt.hasNext()) {
					Prodotto p = (Prodotto) itt.next();
		%>
		<table id="catalogo">
		<tr id="riga">
			<td id="colonna1"><img src="images/<%=p.getImmagine()%>.png" alt="capsula" title="<%=p.getNome()%>"></td>
			<td id="colonna2"><%=p.getNome()%></td>
			<td id="colonna3"><%=p.getCodice()%></td>
			<td id="colonna4"><%=p.getTipo()%></td>
			<td id="colonna5"><%=p.getPrezzo()%>&euro;</td>
			<td id="colonna6"><form>
					Q.t&agrave;:<select name="quantita<%=p.getCodice()%>">
						<option value="1" selected="selected">1</option>
						<%
							for (int j = 2; j < 11; j++) {
						%>
						<option value="<%=j%>"><%=j%></option>
						<%
							}
						%>
					</select>
					</td><td id="colonna7">
										<br> <input type="submit" name="aggiungi" value="Aggiungi al carrello"> 
					<input type="hidden" name="codiceAggiungi" value="<%=p.getCodice()%>">
				</form>
			</td>
		</tr>
	</table>
		<%
			}
			} else {
		%>

		<p id="riga_senza_prodotti">Non ci sono prodotti disponibili.</p>
		<%
			}
		%>
	
	<br>	
	<form action="http://localhost:8080/Progetto_WEB/ControlloCarrello">
		<input id="bottone_carrello" type="submit" name="carrello3" value="Vai al carrello">
	</form>
	
	<% if(request.getParameter("carrello3")!= null && request.getParameter("carrello3").equals("Vai al carrello")){
		s.setAttribute("carrello1", carrello);
	}	
	%>



	


</body>
</html>