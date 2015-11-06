var VideosController = Paloma.controller('Videos');

VideosController.prototype.show = function () {
  var params = this.params;
  var player = videojs('video', {
    fluid: true,
    customControlsOnMobile: true,
    plugins: {
      videoJsResolutionSwitcher: {
        default: 'low', // Default resolution [{Number}, 'low', 'high'],
        dynamicLabel: true // Display dynamic labels or gear symbol
      }
    }
  });
};
