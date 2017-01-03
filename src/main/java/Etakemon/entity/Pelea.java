package Etakemon.entity;

public class Pelea {

	int Id;

	int PuntosContrincanteDos;

	int PuntosContrincanteUno;

	String NameContrincanteUno, NameContrincanteDos;

	Etakemon ContrincanteUno;

	Etakemon ContrincanteDos;

	public Pelea() {

	}

	public Pelea(int id, int puntosContrincanteDos, int puntosContrincanteUno, String nameContrincanteUno,
                 String nameContrincanteDos, Etakemon contrincanteUno, Etakemon contrincanteDos) {

		Id = id;

		PuntosContrincanteDos = puntosContrincanteDos;

		PuntosContrincanteUno = puntosContrincanteUno;

		NameContrincanteUno = nameContrincanteUno;

		NameContrincanteDos = nameContrincanteDos;

		ContrincanteUno = contrincanteUno;

		ContrincanteDos = contrincanteDos;

	}

	public int getId() {

		return Id;

	}

	public void setId(int id) {

		Id = id;

	}

	public int getPuntosContrincanteDos() {

		return PuntosContrincanteDos;

	}

	public void setPuntosContrincanteDos(int puntosContrincanteDos) {

		PuntosContrincanteDos = puntosContrincanteDos;

	}

	public int getPuntosContrincanteUno() {

		return PuntosContrincanteUno;

	}

	public void setPuntosContrincanteUno(int puntosContrincanteUno) {

		PuntosContrincanteUno = puntosContrincanteUno;

	}

	public String getNameContrincanteUno() {

		return NameContrincanteUno;

	}

	public void setNameContrincanteUno(String nameContrincanteUno) {

		NameContrincanteUno = nameContrincanteUno;

	}

	public String getNameContrincanteDos() {

		return NameContrincanteDos;

	}

	public void setNameContrincanteDos(String nameContrincanteDos) {

		NameContrincanteDos = nameContrincanteDos;

	}

	public Etakemon getContrincanteUno() {

		return ContrincanteUno;

	}

	public void setContrincanteUno(Etakemon contrincanteUno) {

		ContrincanteUno = contrincanteUno;

	}

	public Etakemon getContrincanteDos() {

		return ContrincanteDos;

	}

	public void setContrincanteDos(Etakemon contrincanteDos) {

		ContrincanteDos = contrincanteDos;

	}

}
