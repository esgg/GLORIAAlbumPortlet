<%
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script>

//Check if the user has taken any image in this reservation time and draw it

var imagesAlbum = new Array();


$(function() {
    // there's the gallery and the trash
    var $gallery = $( "#gallery" );
      
 
    // image preview function, demonstrating the ui.dialog used as a modal window
    function viewLargerImage( $link ) {
      var src = $link.attr( "href" ),
        title = $link.siblings( "img" ).attr( "alt" ),
        $modal = $( "img[src$='" + src + "']" );
   

        var img = $( "<img alt='" + title + "' width='384' height='288' style='display: none; padding: 8px;' />" )
          .attr( "src", src ).appendTo( "body" );

       
          img.dialog({
            title: title,
            width:400,
            modal: true,
            show: {
                effect: "blind",
                duration: 1000
              },
              hide: {
                effect: "explode",
                duration: 1000
              }
          });
       
      
    }
 
    function viewImage( $link ) {
    	var src = $link.attr( "src" );
    	
    	 var img = $( "<img src='"+src+"' width='384px' style='padding: 8px;' />" );

      
         img.dialog({
           width:400,
           modal: true,
           show: {
               effect: "blind",
               duration: 1000
             },
             hide: {
               effect: "explode",
               duration: 1000
             }
         });
    }
    
    // resolve the icons behavior with event delegation
    $( "img.thumbmailImage" ).click(function( event ) {
      var $item = $( this );
 	  viewImage($item);
    });
  });
</script>


<style>
 #gallery { float: left; width: 65%; min-height: 12em; }
  .gallery.custom-state-active { background: #eee; }
  .gallery li { float: left; width: 96px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center; }
  .gallery li h5 { margin: 0 0 0.4em; cursor: move; }
  .gallery li a { float: right; }
  .gallery li a.ui-icon-zoomin { float: left; }
  .gallery li img { width: 100%; cursor: move; }
 
  #trash { float: right; width: 32%; min-height: 18em; padding: 1%; }
  #trash h4 { line-height: 16px; margin: 0 0 0.4em; }
  #trash h4 .ui-icon { float: left; }
  #trash .gallery h5 { display: none; }
  
  .thumbmail {border:1px; background-color:white; width: 96px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center;}
  .thumbmailImage {width:80px; height:60px}
  .imageTitle {background-color:grey; color:white; margin: 0 0 0.4em}

</style>

<div>
<table id="albumImageCcd"> 
	<tr>
	</tr>
</table>
</div>


