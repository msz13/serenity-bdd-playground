import { Given, Then, When } from '@cucumber/cucumber';
import { Actor, actorInTheSpotlight } from '@serenity-js/core';
import { Navigate } from '@serenity-js/web';

import { Authenticate, VerifyAuthentication } from '../../test/authentication';
import { PickExample } from '../../test/examples';

/**
 * Below step definitions use Cucumber Expressions
 * see: https://cucumber.io/docs/cucumber/cucumber-expressions/
 *
 * {actor} and {pronoun} are custom expressions defined under support/parameters.ts
 */
Given('{actor} starts with the {string} example', async (actor: Actor, exampleName: string) =>
    actor.attemptsTo(
        Navigate.to('/'),
        PickExample.called(exampleName),
    )
);

When('{pronoun} log(s) in using {string} and {string}', async (actor: Actor, username: string, password: string) =>
    actor.attemptsTo(
        Authenticate.using(username, password),
    )
);

/**
 * If you need to use a RegExp instead of Cucumber Expressions like {actor} and {pronoun}
 * you can use actorCalled(name) and actorInTheSpotlight() instead
 *
 *  see: https://serenity-js.org/modules/core/function/index.html#static-function-actorCalled
 *  see: https://serenity-js.org/modules/core/function/index.html#static-function-actorInTheSpotlight
 */
Then(/.* should see that authentication has (succeeded|failed)/, async (expectedOutcome: string) =>
    actorInTheSpotlight().attemptsTo(
        VerifyAuthentication[expectedOutcome](),
    )
);

Then('{actor} ma możliwości dołączenia do spotkania', (actor: actor) => {
  // Write code here that turns the phrase above into concrete actions
})

Then('{actor} możliwość dołączenia do listy oczekujących', (actor: actor) => {
  // Write code here that turns the phrase above into concrete actions
})

When('{actor}  chcę się zapisać na nie zapisać', (actor: actor) => {
  // Write code here that turns the phrase above into concrete actions
})

Given('Zapisało się na nie {int} uczestników', (int: number) => {
  // Write code here that turns the phrase above into concrete actions
})

Given('{actor} utworzyła wydarzenie, w krórym ograniczyła liczbę miejsc do {int}', (actor: actor, int: number) => {
  // Write code here that turns the phrase above into concrete actions
})




