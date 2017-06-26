package it.beans;

public class Prodotto {

	public Prodotto(String codice, String nome, String tipo, String descrizione, String confezione, double prezzo,
			String immagine) {
		this.codice = codice;
		this.nome = nome;
		this.tipo = tipo;
		this.descrizione = descrizione;
		this.confezione = confezione;
		this.prezzo = prezzo;
		this.immagine = immagine;
	}

	public Prodotto() {

	}

	public String getCodice() {
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getConfezione() {
		return confezione;
	}

	public void setConfezione(String confezione) {
		this.confezione = confezione;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}
	
	
	public String toString() {
		return "Prodotto [codice=" + codice + ", nome=" + nome + ", tipo=" + tipo + ", descrizione=" + descrizione
				+ ", confezione=" + confezione + ", prezzo=" + prezzo + ", immagine=" + immagine + "]";
	}

	public Prodotto clone(Prodotto prodotto) {
		Prodotto cloned = new Prodotto();
		cloned.setNome(prodotto.nome);
		cloned.setCodice(prodotto.codice);
		cloned.setDescrizione(prodotto.descrizione);
		cloned.setTipo(prodotto.tipo);
		cloned.setConfezione(prodotto.confezione);
		cloned.setPrezzo(prodotto.prezzo);
		cloned.setImmagine(prodotto.immagine);
		return cloned;
	}

	private String codice;
	private String nome;
	private String tipo;
	private String descrizione;
	private String confezione;
	private double prezzo;
	private String immagine;
}
