package Etakemon.entity;

public class Etakemon {
	int id;

	int idUser;

	String Tipo, Nombre, Puntos;

	public Etakemon(int id, int idUser, String tipo, String nombre, String puntos) {

		this.id = id;

		Tipo = tipo;

		Nombre = nombre;

		Puntos = puntos;

		this.idUser = idUser;

	}

	public int getIdUser() {

		return idUser;

	}

	public void setIdUser(int idUser) {

		this.idUser = idUser;

	}

	public int getId() {

		return id;

	}

	public void setId(int id) {

		this.id = id;

	}

	public String getTipo() {

		return Tipo;

	}

	public void setTipo(String tipo) {

		Tipo = tipo;

	}

	public String getNombre() {

		return Nombre;

	}

	public void setNombre(String nombre) {

		Nombre = nombre;

	}

	public String getPuntos() {

		return Puntos;

	}

	public void setPuntos(String puntos) {

		Puntos = puntos;

	}

	public Etakemon() {
	}

}
