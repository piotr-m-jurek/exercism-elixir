package cars

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour.
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	return float64(productionRate) * successRate / 100
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
    productionPerMinute := float64(productionRate / 60)
    successPercentage := successRate / 100
	return int(productionPerMinute * successPercentage)
}

// CalculateCost works out the cost of producing the given number of cars.
func CalculateCost(carsCount int) uint {
    tens := int(carsCount / 10)
    singles := carsCount % 10
    return uint((tens * 95000) + (singles * 10000))
}
