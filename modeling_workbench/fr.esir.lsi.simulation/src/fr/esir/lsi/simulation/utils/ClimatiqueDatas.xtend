package fr.esir.lsi.simulation.utils

import java.io.FileReader
import java.util.Date

import static extension com.google.common.io.CharStreams.*

class ClimatiqueDatas {

	static val climatiqueDatas = new FileReader('res/data.csv').readLines.map [ line |
		val segments = line.split(';').iterator
		return new ClimatiqueData(
			Double.parseDouble(segments.next),
			Integer.parseInt(segments.next),
			Integer.parseInt(segments.next),
			Integer.parseInt(segments.next),
			Float.parseFloat(segments.next),
			Float.parseFloat(segments.next),
			Float.parseFloat(segments.next),
			Float.parseFloat(segments.next)
		)
	]

	static def float getRainDayD(Date dayD) {
		var float result = 0

		var data = getData(dayD)

		result = data.rr

		return result

	}

	static def float getEvaporationDayD(Date dayD) {
		var float result = 0

		var data = getData(dayD)

		result = data.etp

		return result

	}

	static private def ClimatiqueData getData(Date dayD) {
		var data = climatiqueDatas.filter[day.equals(dayD.date) && month.equals(dayD.month+1) && year.equals(dayD.year+1900)]

		return data.iterator.next()

	}

}
