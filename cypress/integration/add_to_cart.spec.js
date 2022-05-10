describe('Jungle app', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it("Clicking on add to cart should change cart count", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn').click({force: true})
    cy.get('.end-0 > .nav-link').contains(1)

    cy.get(':nth-child(2) > div > .button_to > .btn').click({force: true})
    cy.get('.end-0 > .nav-link').contains(2)
  });

})