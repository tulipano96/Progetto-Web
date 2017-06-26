<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*,it.beans.* "%>


<%
	HttpSession s = request.getSession();
	Carrello carrelloC;

%>

<%		
		if (request.getParameter("rimuovi") != null
				&& request.getParameter("rimuovi").equals("Rimuovi dal carrello")) {
			carrelloC=(Carrello)s.getAttribute("carrello1");
			String codiceDaCercare = "";
			codiceDaCercare = request.getParameter("codiceRimuovi");
			carrelloC.rimuoviProdotto(codiceDaCercare);		
			s.setAttribute("carrello1",carrelloC);
		}
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="icon" type="image/png" href="images/icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="stylesheet/carrello_style.css" type="text/css">
<title>Ca.Sa.Caff&egrave; - Carrello</title>
</head>
<body>

<h2 id="titolo">Carrello</h2>


		<%	
			carrelloC=(Carrello)s.getAttribute("carrello1");
			if(carrelloC.getArticoli().size()!=0){
			if (carrelloC != null) {
				Iterator<?> itt = carrelloC.getArticoli().iterator();
				while (itt.hasNext()) {
					Prodotto p = (Prodotto) itt.next();
		%>
		<table id="carrello">
		<tr id="riga">
			<td id="colonna1"><img src="images/<%=p.getImmagine()%>.png" alt="capsula" title="<%=p.getNome()%>"></td>
			<td id="colonna2"><%=p.getNome()%></td>
			<td id="colonna3"><%=p.getCodice()%></td>
			<td id="colonna4"><%=p.getTipo()%></td>
			<td id="colonna5"><%=p.getPrezzo()%></td>
			<td id="colonna6">
			<form>
				<input type="submit" name="rimuovi" value="Rimuovi dal carrello">
				<input type="hidden" name="codiceRimuovi" value="<%=p.getCodice()%>">
			</form>
		</tr>
</table>
		<%
			}
		}
	}else{
		%>
		 	<p id="carrello_vuoto">Carrello vuoto</p>
		<% 
	}
		%>
<hr>
<p id="totale">
	Totale = <%= carrelloC.calcolaTotale() %>&euro;
</p>

<p id=link><a href="pages/Checkout.jsp">Checkout</a></p>

</body>
</html>