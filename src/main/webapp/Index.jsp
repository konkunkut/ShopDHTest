<%@page import="ModelBean.SanPham"%>

<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Trang chủ</title>    
    <link rel="stylesheet" href="lib/css/index.css">
    <link rel="stylesheet" href="lib/vendor/fontawesome/css/all.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    
    <script src="lib/js/index.js"></script>
    
</head>
<body>
	<%@ include file="/Layout/Header.jsp"%>   
    <header>
        <div id="my-carousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#my-carousel" data-slide-to="0" class=""></li>
                <li data-target="#my-carousel" data-slide-to="1" class=""></li>
                <li data-target="#my-carousel" data-slide-to="2" class="active"></li>
            </ol>
            <div class="carousel-inner">
    			<div class=" item ">
    				<img src="lib/images/photo1.jpeg">
    				<div class=" container ">
    					<div class=" carousel-caption d-none d-md-block ">
    						  <h1 style="font-family: 'Philosopher', sans-serif;">Sang Trọng</h1>
    						<!--<p>Note: If you're viewing this page via a <code>file://</code> URL, the " next " and " previous " Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
    						-->
    						<a class="btn btn-primary" href="BoLocSanPham" role="button">Khám Phá Bộ Sưu Tập</a>
    					</div>
    				</div>
    			</div>
    			<div class=" item ">
    				<img src="lib/images/photo2.jpeg">
    				<div class=" container ">
    					<div class=" carousel-caption d-none d-md-block ">
    						  <h1 style="font-family: 'Philosopher', sans-serif;">Lịch Lãm</h1>
    						<!--<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
    						-->
    						<a class="btn btn-primary" href="BoLocSanPham" role="button">Khám Phá Bộ Sưu Tập</a>
    					</div>
    				</div>
    			</div>
    			<div class=" item active ">
    				<img src="lib/images/photo3.jpeg">
                <div class="container">
                    <div class="carousel-caption d-none d-md-block">
                          <h1 style="font-family: 'Philosopher', sans-serif;">Thời Trang</h1>
                       <!-- <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        -->
                        <a class="btn btn-primary" href="BoLocSanPham" role="button">Khám Phá Bộ Sưu Tập</a>
                    </div>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#my-carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#my-carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
    </header>
    <!---Page Content--->
    <div class="container">
        <!--Sản Phẩm nổi bật--->
        <p class="deMuc"> <span style="border-bottom: 2px #f69400 solid; ">Sản Phẩm Nổi Bật</span></p>
        <div class="row">
         
			<%
				Object result = request.getAttribute("LayThongTinSanPhamNoiBat");
							if (result != null){
										SanPham[] sp = (SanPham[])result;
										for(int i=0;i<sp.length;i++)
										{
											int maSP= sp[i].getMaSP();
											String ten=sp[i].getTenSp();
											double giaBan = sp[i].getGiaBan();
											String HinhAnh1= sp[i].getHinhAnh1();
											out.println("<div class=\"col-lg-3\">");
											out.println("<div class=\"thumbnail-list-product\">");
												out.println("<div class=\"thumbnail-product\">");
												
												
													out.println("<div class=\"profilebox profilebox1\" style=\"background: url(lib/images/"+HinhAnh1+")\" >");
													
								        				out.println("<div class=\"SocialIcons\">");
								        				//href=\"AddCart?MaSP="+maSP+"\"
								        			
								                      		out.println("<a data-MaSP="+maSP+" class=\"btnAddCart\">");
								                                out.println("<i class=\"fas fa-cart-plus\">");
								                                out.println("</i>");
								                            out.println("</a>");
								                            
								                            
								                            
								                        	out.println("<a href=\"#\">");
								                                out.println("<i class=\"far fa-heart\">");
								                                out.println("</i>");
								                            out.println("</a>");
								                  		out.println("</div>");
								                  		
								                   	out.println("</div>");	
								                   						                   	
								                   	
								            		out.println("<div class=\"product-title\">");                 
								            		out.println("<a href=\"ChiTietSanPham?MaSP="+maSP+"\">"+ten+"<br />"+ String.format("%,.0f", giaBan)+" VNĐ"+"</a>");
								                	out.println("</div>");	
								                	
								                	
								          		out.println("</div>");
								     		out.println("</div>");
										out.println("</div>");
										}
										
								
							}
			%>
			



        </div>
        <div class="btn-more" style="margin-top:30px;margin-bottom:30px;">
            <ul class="pager">
                <li class="next"> <a href="BoLocSanPham">Xem Thêm</a></li>
            </ul>
        </div>
        <!--end Sản Phẩm nổi bật--->
        <!--Sản Phẩm mới--->
        <p class="deMuc"><span style="border-bottom: 2px #f69400 solid">Sản Phẩm Mới</span></p>
        <div class="row">
            
            <%
				Object result2 = request.getAttribute("LayThongTinSanPhamMoi");
							if (result2 != null){										
										SanPham[] sp = (SanPham[])result2;
										for(int i=0;i<sp.length;i++)
										{
											int maSP= sp[i].getMaSP();
											String ten=sp[i].getTenSp();
											double giaBan = sp[i].getGiaBan();
											String HinhAnh1= sp[i].getHinhAnh1();
											out.println("<div class=\"col-lg-3\">");
											out.println("<div class=\"thumbnail-list-product\">");
												out.println("<div class=\"thumbnail-product\">");
												
												
													out.println("<div class=\"profilebox profilebox1\" style=\"background: url(lib/images/"+HinhAnh1+")\" >");
													
								        				out.println("<div class=\"SocialIcons\">");
								        					out.println("<a data-MaSP="+maSP+" class=\"btnAddCart\">");
								                                out.println("<i class=\"fas fa-cart-plus\">");
								                                out.println("</i>");
								                            out.println("</a>");
								                            
								                            
								                        	out.println("<a href=\"#\">");
								                                out.println("<i class=\"far fa-heart\">");
								                                out.println("</i>");
								                            out.println("</a>");
								                  		out.println("</div>");
								                  		
								                   	out.println("</div>");	
								                   						                   	
								                   	
								            		out.println("<div class=\"product-title\">");                 
								            			out.println("<a href=\"ChiTietSanPham?MaSP="+maSP+"\">"+ten+"<br />"+ String.format("%,.0f", giaBan)+" VNĐ"+"</a>");
								                	out.println("</div>");	
							
								        	                	
								          		out.println("</div>");
								     		out.println("</div>");
										out.println("</div>");
										}
										
								
									}

							
					%>
					
            
        </div>
        <div class="btn-more" style="margin-top:30px;margin-bottom:30px;">
            <ul class="pager">
                <li class="next"> <a href="BoLocSanPham">Xem Thêm</a></li>
            </ul>
        </div>
        <div class="clear">
        </div>
        <!-- end Sản Phẩm mới--->
        <!--Carousel Thương hiệu-->
        <p class="deMuc"><span style="border-bottom: 2px #f69400 solid">Thương Hiệu Nổi Bật</span></p>
        <div id="trademark-carousel">
            <div class="hideLeft">
                <img src="lib/logo/seiko.png" >
                <a href="BoLocSanPham?MaTH=1"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="hideLeft">
                <img src="lib/logo/tissot.png" >
                <a href="BoLocSanPham?MaTH=9"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="hideLeft">
                <img src="lib/logo/bovet.jpg" >
                <a href="BoLocSanPham?MaTH=8"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="hideLeft">
                <img src="lib/logo/dg.jpg" >
                <a href="#"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="hideLeft">
                <img src="lib/logo/longines.jpg" >
                <a href="#"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="prevLeftSecond">
                <img src="lib/logo/breitling.jpg">
                <a href="BoLocSanPham?MaTH=5"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="prev">
                <img src="lib/logo/charriol.jpg" >
                <a href="#"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="selected">
                <img src="lib/logo/omega.jpg">
                <a href="BoLocSanPham?MaTH=3"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="next">
                <img src="lib/logo/victorinox.jpg" >
                <a href="BoLocSanPham?MaTH=4"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="nextRightSecond">
                <img src="lib/logo/gucci.jpg">
                <a href="BoLocSanPham?MaTH=6"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="hideRight">
                <img src="lib/logo/zenith2.jpg" >
                <a href="#"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="hideRight">
                <img src="lib/logo/hermes.png" >
                <a href="BoLocSanPham?MaTH=10"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="hideRight">
                <img src="lib/logo/hublot.jpg" >
                <a href="BoLocSanPham?MaTH=11"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="hideRight">
                <img src="lib/logo/puma.jpg" >
                <a href="BoLocSanPham?MaTH=12"><i class="fas fa-angle-double-down"></i></a>
            </div>
            <div class="hideRight">
                <img src="lib/logo/rolex.jpg" >
                <a href="BoLocSanPham?MaTH=2"><i class="fas fa-angle-double-down"></i></a>
            </div>
        </div>
        <!-- end Carousel Thương hiệu-->
    </div>
    <!--lisst-slider cho thang hoang-->
	<%@ include file="/Layout/Footer.jsp"%>  
	<%
		if(request.getAttribute("ThanhToanThanhCong")!=null)
		{%>
			
		<%}
	%>
	<script>
		
	
		$('.btnAddCart').click(function(e) {
		    e.preventDefault();
		    $.ajax({
		        url: 'AddCart',
		        type: 'get',
		        dataType: 'text',
		        data:{
		        	MaSP : $(this).attr("data-MaSP")
		        },
		        
		       
		    })
		    .done(function(data) {	

		    	CallBoxThongBao(data);

		    });
		});   
		
		
	    function CallBoxThongBao(data) {
	    	
	    	if(data=="0")
	    		
	    		{
	    		 swal({
	    		      title: "", 
	    		      text: "Thêm thành công", 
	    		      type: "success",
	    		      showCancelButton: false
	    		    }, function() {
	    		    	$("#loadcha").load(location.href + " #loadcon");
	    		    });
	    		
	    		}
	    	else
	    		{
	    			alert("Không đủ số lượng...!");
	    			//$('#ThongBaoDangNhap').text("Sản phẩm hết hàng");
	    		}
	    	
	   
	  }
	    
	</script>
</body>

</html>