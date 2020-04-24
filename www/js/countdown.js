var loader = document.getElementById('loader')
  , α = 0
  , π = Math.PI
  , t = 30;

(function draw() {
  α++;
  α %= 360;
  var r = ( -α * π / 180 )
    , x = Math.sin( r ) * 10
    , y = Math.cos( r ) * - 10
    , mid = ( α > 180 ) ? 0 : 1
    , anim = 'M 0 0 v -10 A 10 10 1 ' 
           + mid + ' 1 ' 
           +  x  + ' ' 
           +  y  + ' z';
  //[x,y].forEach(function( d ){
  //  d = Math.round( d * 1e3 ) / 1e3;
  //});
 
  loader.setAttribute( 'd', anim );
  
  setTimeout(draw, t); // Redraw
})();

(function ($) {

  $.fn.countdown = function () {
      this.each(function () {
          $(this).html(draw());
      });
      return this;
  };

}(jQuery));