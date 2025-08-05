package techpalace
import "strings"
// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
    return "Welcome to the Tech Palace, " + strings.ToUpper(customer)
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
    stars := strings.Repeat("*", numStarsPerLine)
	chunks := []string{stars, welcomeMsg, stars}
    return strings.Join(chunks, "\n")
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	s := strings.ReplaceAll(oldMsg, "*", "")
    s = strings.TrimSpace(s)
    return s
}
