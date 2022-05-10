describe('Jungle app', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it("Clicking on image should navigate to product detail page", () => {
    cy.get(':nth-child(1) > a > img').click()
    cy.get('.product-detail').should('exist')
  });

  it("Clicking on image should navigate to product detail page", () => {
    cy.get(':nth-child(2) > a > img').click()
    cy.get('.product-detail').should('exist')
  });

})