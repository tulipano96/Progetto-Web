<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="java.util.*,it.beans.* "%>


<%
	HttpSession s = request.getSession();
	Carrello carrelloC;
%>

<html>
<head>
<link rel="icon" type="image/png" href="../images/icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../stylesheet/checkout_style.css" type="text/css">
<title>Ca.Sa.Caff&egrave; - Checkout</title>
</head>
<body>

	<h2 id="titolo">Checkout</h2>


	<%
		carrelloC = (Carrello) s.getAttribute("carrello1");
		if (carrelloC.getArticoli().size() != 0) {
			if (carrelloC != null) {
	%>
	<p id="confermato">L'ordine è stato confermato.</p>
	<p id="totale">
	Totale= <%= carrelloC.calcolaTotale() %>&euro;
	</p>
	<%	Iterator<?> itt = carrelloC.getArticoli().iterator();
		while (itt.hasNext()) {
					Prodotto p = (Prodotto) itt.next();
	%>

	<table id="carrello">
		<tr id="riga">
			<td id="colonna1"><img src="../images/<%=p.getImmagine()%>.png" alt="capsula" title="<%=p.getNome()%>"></td>
			<td id="colonna2"><%=p.getNome()%></td>
			<td id="colonna3"><%=p.getCodice()%></td>
			<td id="colonna4"><%=p.getTipo()%></td>
			<td id="colonna5"><%=p.getPrezzo()%></td>
		</tr>
	</table>
	<%
		}
			}
		} else {
	%>
	<p id="non_confermato">L'ordine non è stato confermato, nessun prodotto nel carrello.</p>

	<%
		}
	%>


</body>
</html>