(function(){
  var els = document.querySelectorAll('.reveal');
  if (!('IntersectionObserver' in window)) {
    for (var i=0;i<els.length;i++){ els[i].classList.add('show'); }
    return;
  }
  var obs = new IntersectionObserver(function(entries){
    for (var i=0;i<entries.length;i++){
      var e = entries[i];
      if (e.isIntersecting){
        e.target.classList.add('show');
        obs.unobserve(e.target);
      }
    }
  }, { threshold: 0.1, rootMargin: '40px 0px' });
  for (var j=0;j<els.length;j++){ obs.observe(els[j]); }
})();