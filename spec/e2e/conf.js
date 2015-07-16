exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['tillReceiptFeature.js'],
  capabilities: {
    browserName: 'chrome'
  }
}