package fr.esir.lsi.simulation.utils
@Data class ClimatiqueData {
	double num_post;
	int year;
	int month;
	int day;
	float etp;		//EVAPOTRANSPIRATION MESUREE (MILLIMETRES)
	float rr;		//HAUTEUR DES PRECIPITATIONS (MILLIMETRES)
	float tm;		//TEMPERATURE MOYENNE (DEGRES CELSIUS)
	float par;		//RAYONNEMENT PAR (JOULES/CM2)
}