import { Given, Then, When } from '@cucumber/cucumber'
import { Actor } from '@serenity-js/core';

import { CreateEvent, VisitEventPage,  } from '../../test/examples';

Given('{actor} utworzyła wydarzenie, w krórym ograniczyła liczbę miejsc do {int}', (agnes: Actor, participantsLimit: number) => {
    
    agnes.attemptsTo(CreateEvent.viaApiWithParticipantLimit(participantsLimit))  
})

When('{actor} chcę się zapisać na spotkanie {string}', (joana: Actor, eventName: string) => {
    
    joana.attemptsTo(VisitEventPage.forEvent(eventName))

})

