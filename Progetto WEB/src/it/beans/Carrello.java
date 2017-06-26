package it.beans;

import java.util.*;

public class Carrello {
	
	public Carrello(){
		this.articoli=new ArrayList<Prodotto>();
	}


	public void rimuoviProdotto(String codiceProdotto) {
		if(articoli.size()==0){
			this.articoli=new ArrayList<Prodotto>();
		} else {
		for(int i=0; i< this.articoli.size(); i++) {
			Prodotto prod = (Prodotto) articoli.get(i);
			if (prod.getCodice().equals(codiceProdotto)) {
				articoli.remove(i);
				break;
			}
		}
		}
		
	}

	public void aggiungiProdotto(Prodotto prodotto, String quantita) {
			int q=  Integer.parseInt(quantita);
			for(int i=0; i<q; i++){
				this.articoli.add(prodotto);
			}
			
	}
	
	public double calcolaTotale(){
		double tot=0;
		for(int i=0; i< articoli.size(); i++){
			tot+= articoli.get(i).getPrezzo();
		}
		return tot;
	}

	public List<Prodotto> getArticoli() {
		return articoli;
	}

	public void setArticoli(List<Prodotto> articoli) {
		this.articoli = articoli;
	}

	private List<Prodotto> articoli;
}
