package it.DataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.*;
import javax.sql.DataSource;
import it.beans.*;

public class CatalogoDS {

	private static DataSource ds;

	// Contesto iniziale JNDI
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			// Lookup del DataSource
			ds = (DataSource) envCtx.lookup("jdbc/progettoweb");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	public synchronized Collection<Prodotto> doRetrieveAll() throws SQLException {
		Connection connection = null; // La connessione col Database
		PreparedStatement stmt = null;
		Collection<Prodotto> prodotti = new LinkedList<Prodotto>();

		try {
			connection = ds.getConnection();
			stmt = connection.prepareStatement("SELECT * FROM progettoweb.prodotto");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Prodotto p = new Prodotto();

				p.setCodice(rs.getString("codice"));
				p.setNome(rs.getString("nome"));
				p.setTipo(rs.getString("tipo"));
				p.setDescrizione(rs.getString("descrizione"));
				p.setConfezione(rs.getString("confezione"));
				p.setPrezzo(rs.getDouble("prezzo"));
				p.setImmagine(rs.getString("immagine"));
				prodotti.add(p);
			}

		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return prodotti;
	}
}