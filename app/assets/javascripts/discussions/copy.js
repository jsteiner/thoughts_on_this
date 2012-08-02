$(document).ready(function () {
  ZeroClipboard.setMoviePath( '/assets/ZeroClipboard.swf' );
  var clip = new ZeroClipboard.Client();

  var discussion_url = document.getElementById('discussion-url').value;

  clip.setText( discussion_url );
  clip.setHandCursor( true );
  clip.glue( 'copy-button', 'copy-wrapper' );
})
