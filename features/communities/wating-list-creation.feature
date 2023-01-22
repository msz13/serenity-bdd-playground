Feature: Dołączanie do listy oczekujących

@gh-1234 @ui
Scenario: Lista oczekujących została utworzona

Given Agnieszka utworzyła wydarzenie, w krórym ograniczyła liczbę miejsc do 30
And Zapisało się na nie 2 uczestników
When Jonna  chcę się zapisać na nie zapisać
Then Ma możliwość dołączenia do listy oczekujących
And Nie ma możliwości dołączenia do spotkania
