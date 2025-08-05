//  Package weather gives you current condtion and forecast.
package weather

// CurrentCondition condition string.
var CurrentCondition string
// CurrentLocation Location string.
var CurrentLocation string

// Forecast function computing current weather.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
