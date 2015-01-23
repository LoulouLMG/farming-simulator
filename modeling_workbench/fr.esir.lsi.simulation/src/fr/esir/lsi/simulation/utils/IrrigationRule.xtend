package fr.esir.lsi.simulation.utils

import java.util.Calendar
import java.util.Date

class IrrigationRule {

	static public int k = 15 //days
	static public float fwi = 60 // mm
	static public float dose = 40 //mm

	static def float getHydricDeficit(Date date, int k) {
		var float result = 0

		var Calendar c = Calendar.getInstance
		c.setTime(date)
		c.add(Calendar.DATE, k)
		
		var Date endDate = c.getTime();
		println(date)
		println(endDate)
		println("*****************************")

		while (endDate.after(date)) {
			result = evaporation(endDate) - rain(endDate)

			c.setTime(date)
			c.add(Calendar.DATE, -1)
			endDate = c.getTime();
			//We count from the last day to now
		}


		return result
	}

	static def float evaporation(Date day) {
		return ClimatiqueDatas.getEvaporationDayD(day)
	}

	static def float rain(Date day) {
		return ClimatiqueDatas.getRainDayD(day)
	}

}
