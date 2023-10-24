import { Given, When, Then, And } from "cypress-cucumber-preprocessor/steps";

const timeout = 2000
const urlBase = "https://www.saucedemo.com"

Given("User on Login Pages Saucedemo", () => {
    cy.visit(urlBase)
    cy.get(".login_logo").should("be.visible");
    cy.get("#login_button_container").should("be.visible")
})

When('User fills valid {} as username and {} as password', (username, password) => {
    cy.get('#user-name').clear().type(username).should('have.value', username)
    cy.get('#password').clear().type(password).should('have.value', password)
   
});

And("User click on Login button", () => {
    cy.get('#login-button').click().wait(timeout)
})

Then("User redirect to Dashboard Page", () => {
    cy.get('.app_logo').should('have.text', 'Swag Labs')
    cy.get('.inventory_container').should('be.be.visible').wait(timeout)
})
