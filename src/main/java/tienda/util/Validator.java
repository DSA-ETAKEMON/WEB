package tienda.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;


/********************************************************************************************
 * NOMBRE: Validator.java
 * 
 * DESCRIPCION: 
 * 			Clase auxiliar para validar los datos que sean 
 * 			introducidos en la aplicaci�n.
 * 
 *  @version	30/01/2016 
 *  @author 	Miguel Garcia
 *  
 * ******************************************************************************************/
public class Validator {
	
	private static final String ALFANUMERIC_PATTERN = "^[0-9a-zA-Z]+$";
	
	private static final String PASSWORD_PATTERN = 
            "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})";
	/**
	 * Patr�n para validar el email, evitando puntos finales antes de la @ y que solo contenga
	 * car�cteres alfanum�ricos		 
	 */
	private final static String EMAIL_PATTERN = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		
	/**
	 * Permite verificar que un DNI cumple con el patr�n XX.XXX.XXX-L
	 */
	private final static String DNI_PATTERN = "\\d{2}\\.\\d{3}\\.\\d{3}-[a-zA-Z]";
		
	/**
	 * Permite validar un tel�fono, el cual debe contener de 10 a 20 d�gitos
	 * y donde los espacios est�n permitidos
	 */
	private final static String PHONE_PATTERN =  "[\\d ]{10,20}";
	
	/**
	 * Orden de las letras con las cuales se comprobar� la validez del DNI
	 */
	private final static String LETRA_DNI = "TRWAGMYFPDXBNJZSQVHLCKE";
	
	/**
	 * Longitud que debe tener todo DNI pasado a la aplicaci�n.
	 */
	private final static int LONGITUD_DNI = 12;
	
	private final int LONG_MAX_EMAIL_AND_NAME = 100;
	private final static int LONG_MAX_PASS = 20;
	private final int LONG_MAX_DNI = 12;
	private final static int LONG_MIN_PASS = 8;

	private final int LONG_MIN_NAME = 5;
	private final int LONG_MIN_EMAIL = 6;

	/* ***************************************************************************************
	 * NOMBRE: isAlfanumeric                                                                 *
	 * 
	 * DESCRIPCI�N: *//**
	 * 		Permite verificar que el texto pasado solo contiene caracters alfanum�ricos
	 * 
	 * @param texto String a verificar que solo tenga car�cteres alfanum�ricos
	 * 
	 * @return  true, si cumple solo contiene caracters alfanum�ricos. <br> 
	 * 			false en caso contrario
	 * FECHA: Enero 2016
	 * 
	 * AUTOR: Miguel Garcia - Barcelona
	 * 
	 * **************************************************************************************/
	public static boolean isAlfanumeric(String texto){
		return texto.matches(ALFANUMERIC_PATTERN);		
	}
	
	public static boolean isVacio( String prueba ){
		if(prueba !=null)
		return prueba.length() > 0 && !prueba.equals("");
		else
			return false;
	}
	
	/* ***************************************************************************************
	 * NOMBRE: cumplePhoneNumber                                                                 *
	 * 
	 * DESCRIPCI�N: *//**
	 * 		El phone number debe tener un total de entre 10 y 20, contando d�gitos y espacios.
	 * 		M�nimo aceptable son 10 d�gitos.
	 * 
	 * @param phoneNumber String con el n�mero de telefono de entre 10 y 20 d�gitos. 
	 * 		Puede tener espacios, pero siempre con 10 d�gitos como m�nimo.
	 * 
	 * @return true, si cumple todas las condiciones
	 *
	 * FECHA: Enero 2016
	 * AUTOR: Miguel Garcia
	 * 
	 * **************************************************************************************/
	public static boolean cumplePhoneNumber(String phoneNumber){
		return phoneNumber.matches(PHONE_PATTERN);
	}

	/* ***************************************************************************************
	 * NOMBRE: isEmailValido                                                                 *
	 * 
	 * DESCRIPCI�N: *//**
	 * 			Comprueba si el email tiene un formato que pueda ser v�lido.
	 * 
	 * @param email String a comprobar
	 * 
	 * @return true, en caso que el formato sea v�lido
	 * FECHA: Enero 2016
	 * 
	 * AUTOR: Miguel Garcia
	 * 
	 * **************************************************************************************/
	public static boolean isEmailValido(String email){
		return email.matches(EMAIL_PATTERN); 
		
	}

	/* ***************************************************************************************
	 * NOMBRE: cumpleDNI                                                                 *
	 * 
	 * DESCRIPCI�N: *//**
	 * 			Esta funci�n verifica que el DNI cumple el siguiente formato: xx.xxx.xxx-L <br>
	 * 			El DNI ha de tener longitud 12
	 * 
	 * @param dni String con DNI a ser validado
	 * 
	 * @return true, si el DNI cumple el estandar nacional.
	 * FECHA: Dic 2016
	 * AUTOR: Hicham Azouagh
	 * @throws ErrorMessages
	 * 
	 * **************************************************************************************/
	public static boolean cumpleDNI(String dni) throws ErrorMessages {
		boolean res = false;
		if(dni.length()==LONGITUD_DNI){
		 String letra = dni.substring(dni.length()-1);
		 String numeros = dni.substring(0,dni.length()-2 );
		 String dniSinPuntos = numeros.replace(".", "");
		 int losNumeros = Integer.parseInt(dniSinPuntos);
		 System.out.println(dniSinPuntos);
		 int numero =0;
		 numero = losNumeros % 23;
		 String dniNew = LETRA_DNI.substring(numero, numero+1);
		 if(dniNew.equals(letra))
			 res = dni.matches(DNI_PATTERN);
		}
		else
			throw new ErrorMessages("DNI CON lONGUITUD EXCEDIDO");
		return res;
	}
	

	/** ***************************************************************************************
	 * NOMBRE: cumpleRango                                                                 *
	 * 
	 * DESCRIPCI�N: *//**
	 * 		Comprueba que un N�mero se necuentra entre 2 valores
	 * 
	 * @param valor (int)/(double) N�mero a comprobar
	 * @param valorMinimo (int) N�mero valor aceptable
	 * @param valorMaximo (int) M�N�mero valor aceptable
	 * 
	 * @return true si valorMinimo > valor > valorMaximo
	 * FECHA: Dic 2016
	 * AUTOR: Hicham Azouagh 
	 * 
	 * **************************************************************************************/
	public static boolean cumpleRango(
			int valor, 
			int valorMinimo,
			int valorMaximo){
		
		return valor >= valorMinimo && valor <= valorMaximo;
		
	}


	/* ***************************************************************************************
	 * NOMBRE: cumpleLongitudMin                                                                 *
	 * 
	 * DESCRIPCI�N: *//**
	 * 		Comprobar que el texto pasado tiene una longitud de al menos x caracteres, siendo
	 * 		x el entero pasado como par�metro
	 * 
	 * @param texto String texto a comprobar
	 * @param longitudMinima int que indique longitud m�nima.
	 * 
	 * @return cierto, si la longitud del texto es mayor o igual que longitudMinima
	 * FECHA: Dic 2016
	 * AUTOR: Hicham Azouagh
	 * 
	 * **************************************************************************************/
	public static boolean cumpleLongitudMin(
			String texto, 
			int longitudMinima){
		return texto != null && texto.length() >= longitudMinima;
	}


	/* ***************************************************************************************
	 * NOMBRE: cumpleLongitudMax                                                                 *
	 * 
	 * DESCRIPCI�N: *//**
	 * 		Comprobar que el texto pasado tiene una longitud de, como mucho, x caracteres, siendo
	 * 		x el entero pasado como par�metro
	 * 
	 * @param texto String con el texto a comprobar
	 * @param longitudMaxima int con la longitud m�xima del texto
	 * 
	 * @return true, si el texto es menor o igual que la longitud m�xima.
	 * FECHA: Dic 2016 
	 * AUTOR: Hicham Azouagh 
	 * 
	 * **************************************************************************************/
	public static boolean cumpleLongitudMax(
			String texto, 
			int longitudMaxima){
		return  texto.length() <= longitudMaxima;
	}


	/****************************************************************************************
	 * NOMBRE: cumpleLongitud                                                                 *
	 * 
	 * DESCRIPCI�N: *//**
	 * 		Comprobar que la longitud de un texto se encuentra entre unos valores m�ximos y m�nimos 
	 * 
	 * @param texto String con el texto que a validar
	 * @param longitudMinima (int) M�nima longitud del texto
	 * @param longitudMaxima (int) M�xima longitud v�lida para el texo
	 * 
	 * @return true, si la longitud del texto cumple: longitudMinima
	 *               <= longitudTexto <=longitudMaxima
	 * FECHA: Dic 2016 
	 * AUTOR: Hicham Azouagh
	 * 
	 * **************************************************************************************/
	public static boolean cumpleLongitud(
			String texto, 
			int longitudMinima, 
			int longitudMaxima){

		return cumpleLongitudMin(texto,longitudMinima) && cumpleLongitudMax(texto,longitudMaxima);

	}
	/**
	 * Valida una fecha calendar con m�nimo min
	 * @param fecha
	 * @param min
	 * @return
	 */
	
	public static boolean valDateMin(Calendar fecha, Calendar min){
		return fecha.after(min);
	}
	
	/**
	 * Valida una fecha calendar con m�ximo max
	 * @param fecha
	 * @param max
	 * @return
	 */
	public static boolean valDateMax(Calendar fecha, Calendar max){
		return fecha.before(max);
	}	
	
	/**
	 * esFechaValida
	 * Recibe una string con formato fecha dd/mm/aaaa y comprueba el formato
	 * @param fecha
	 * @return
	 * @throws ParseException 
	 * @throws ErrorMessages
	 */
	public static boolean esFechaValida(String fecha) throws ParseException, ErrorMessages {
		if(fecha.length()>0){
		try {
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
	    df.setLenient(false);   // this is important!
	     df.parse(fecha);
		}
	    catch (ParseException e) {
	     return false;
	    }
	    return true;
		}
		else 
			throw new ErrorMessages("La fecha introducida no es valida");
		}

	
	/**
	 * Nombre esPasswordValida
	 * Descripcion Comprueba que la cadena recibida cumpla con lasnormas de contrase�a
	 * @param password string con la contrase�a introducida
	 * @return true si cumple con las especificaciones
	 * @throws ErrorMessages
	 */
	public static boolean esPasswordValida(String password) throws ErrorMessages {
		boolean res=false;
		if(password.length()>=LONG_MIN_PASS && password.length()<=LONG_MAX_PASS)
		res= password.matches(PASSWORD_PATTERN);
		else
			throw new ErrorMessages("password no valido");
		return res;
	}
}
