describe('Ecosia.org Demo', function() {

  before(browser => browser.navigateTo('https://www.ecosia.org/'));

  it('Demo test ecosia.org', function(browser) {
    browser
      .waitForElementVisible('body')
      .assert.titleContains('Ecosia')
      .assert.visible('input[type=search]')
      .setValue('input[type=search]', 'nightwatch')
      .assert.visible('button[type=submit]')
      .click('button[type=submit]')
      .assert.textContains('.mainline-results', 'Nightwatch.js');
    console.log('>>>>>>>>>>>>>>>>>>');
    console.log('__dirname', __dirname);
    console.log('__filename', __filename);
  });

  after(browser => browser.end());
});
