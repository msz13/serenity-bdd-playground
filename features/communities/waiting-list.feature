Feature: Obsługa listy rezerwowej uczestników spotkań

Aby ułatwić zainteresowanym uczestnikom dołączenie do wydarzeń, 
po zwolnieniu miejsca na spotkaniu z ograniczoną liczbą uczestników,
jako organizator wydarzenia,
chcę zarządzać listą oczekujących.

  Background: 
    Given Anna koordynatorka grupy założyla konto
    And utworzyła grupę

  Rule: Lista oczekujących powstaje, gdy wyczerpano limit miejsc

    @gh-1123 @ui 
    Scenario: Lita oczekujących została utworzona
      Given Agnieszka utworzyła wydarzenie, w krórym ograniczyła liczbę miejsc do 3
      And Zapisało się na nie 3 uczestników
      When Jan, członek grupy, próbuje się zapisać
      Then Lista oczekujących jest utworzona
      And Jan zostaje zapisany na liście oczekujących

    
Scenario: Wszycy oczekujący zainteresowani zostali uczestnikami wydarzenia

    Scenario: lista oczekujących została utworzona
      Given Agnieszka utworzyła wydarzenie, w ktrórym w formularzu uzupełniła następujące informacje:
        | nazwa wydarzenia | data wydarzenia  | opis           | liczba miejsc |
        | BDD by example   | 22.01.2023 13:00 | Zapraszamy ... |             3 |
      And 2 użytkowników kliknęło przycisk weź udział
      When Jan, członek grupy, klika na na przycisk "Weź udział w spotkaniu"
      Then Pozycja lista oczekujących jest dostępna w menu administratora
      And Lista oczekujących zawiera Jana

  Rule: Gdy zwolni się miejsce na liście uczestników, osoba z listy oczekujących się automatycznie staje się uczestnikiem
Given Na liście oczekujących znajdują się następujace osoby:
| Imię | Status w grupie | Data dołączenia do listy |
| Jan  | Członek         | 2002-12-19  18:18:30     |
| Joanna  | Członek         | 2002-12-18  18:18:31     |
When Uczestnik wydarzenia zrezygnował z uczestnictwa
Then Jan został dospisany do listy uczesnitków

  Rule: Pierwszeństwo mają tylko członkowie grupy

    Scenario: 
      Given Na liście oczekujących znajdują się następujace osoby:
        | Imię  | Status w grupie | Data dołączenia do listy |
        | Zosia | Gość            |     2002-12-18  18:18:33 |
        | Jan   | Członek         |      2002-12-19 20:20:33 |
      When Uczestnik wydarzenia zrezygnował z uczestnictwa
      Then Jan został dospisany do listy uczesnitków

  Rule: Gdy wyczerpano limit miejsc uczestnik może się zapisać na listę uczestników



    