<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>ORI AUCTION</title>
  <link rel="icon" href="${path}/img/favicon.png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
  <!-- animate CSS -->
  <link rel="stylesheet" href="${path}/css/animate.css">
  <!-- owl carousel CSS -->
  <link rel="stylesheet" href="${path}/css/owl.carousel.min.css">
  <!-- nice select CSS -->
  <link rel="stylesheet" href="${path}/css/nice-select.css">
  <!-- font awesome CSS -->
  <link rel="stylesheet" href="${path}/css/all.css">
  <!-- flaticon CSS -->
  <link rel="stylesheet" href="${path}/css/flaticon.css">
  <link rel="stylesheet" href="${path}/css/themify-icons.css">
  <!-- font awesome CSS -->
  <link rel="stylesheet" href="${path}/css/magnific-popup.css">
  <!-- swiper CSS -->
  <link rel="stylesheet" href="${path}/css/slick.css">
  <link rel="stylesheet" href="${path}/css/price_rangs.css">
  <!-- style CSS -->
  <link rel="stylesheet" href="${path}/css/style.css">
   <style>
    #mainLogo{width:250px; height:45px}
    @import url(//db.onlinewebfonts.com/c/537c29c4b78689a51f1c48cd802a503f?family=ITC+Grouch);
    @import url(//db.onlinewebfonts.com/c/789f9065baf48309d73fd0ff02fe4aec?family=Big+Caslon+Black);
    @import url('https://fonts.googleapis.com/css2?family=Archivo:wght@100&display=swap');
    .dropdown-item{font-family: ITC Grouch;}
    #banana{font-family:ITC Grouch;}
    h2, h3, h4, h5, h6, p{font-family: adobe-caslon-pro, serif; font-style: normal; font-weight: 700}
    #mainSample1{width:580px; height:400px}
    #artTypes{font-family: 'Archivo', sans-serif; color:#2E64FE;}
   #title{font-family:ITC Grouch;}
    .table{text-align: center;}
   #oti{text-align: center; font-family:ITC Grouch; font-size: 100px; color:yellow}
    #tho{font-family:ITC Grouch;}  
    .genric-btn.primary{font-family: ITC Grouch; background-color: yellow; 
   border:0; outline:0; padding:10px 30px; font-size: 15px; color:black;}
   .progress-table{align:center;}
    
}
    
    
    </style>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script>

	$(function() {

		// ?????? ??????, ????????? ?????? ??????
		$("[name=search]").submit(function() {
			if ($("[name=keyField]").val() == "0") {
				alert("?????? ????????? ??????????????????.");
				return false;//??????????????? ?????????.
			}

			if ($("[name=keyWord]").val() == "") {
				alert("?????? ???????????? ??????????????????.");
				$("[name=keyWord]").focus();
				return false;
			}

		});

		$("input[value='Delete Art']").click(function() {
			if (confirm("????????? ?????????????????????????")) {
				var acode = $(this).parent().siblings().eq(0).text();
				location.href = "${path}/front?key=art&methodName=deleteArt&artCode="+ acode;
			}
		});
	});
	
</script>
</head>
<body>

    <!--::header part start::-->
   <header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand" href="${path}/index.jsp"> <img
							src="${path}/img/mainLogo.png" alt="logo" id="mainLogo">
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>

						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> Online-Auction </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item"
											href="${path}/front?key=auction&methodName=selectAll">All
											Auction</a> <a class="dropdown-item"
											href="${path}/front?key=auction&methodName=selectAuction&aucCategory=1">Normal
											Auction</a> <a class="dropdown-item"
											href="${path}/front?key=auction&methodName=selectAuction&aucCategory=2">Charity
											Auction</a> <a class="dropdown-item"
											href="${path}/front?key=auction&methodName=selectAuction&aucCategory=3">Zero-Base
											Auction</a>
										<c:if test="${sessionScope.loginState==0}">
											<a class="dropdown-item"
												href="${path}/front?key=auction&methodName=searchByState&state=1">Manage
												Auctions</a>
										</c:if>
									</div></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> Consignment </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="${path}/art/artInsert.jsp">Art
											Application</a>
										<c:if test="${sessionScope.loginState==2}">
											<a class="dropdown-item" href="${path}/art/artInsertZB.jsp">ZB
												Application</a>
										</c:if>
										<c:if
											test="${sessionScope.loginState==1||sessionScope.loginState==2}">
											<a class="dropdown-item"
												href="${path}/front?key=cons&methodName=selectById">My
												Consignment</a>
										</c:if>
										<a class="dropdown-item"
											href="${path}/front?key=art&methodName=searchByKeyWord&keyField=id&keyWord=${sessionScope.loginUser}">My
											Arts</a>
										<c:if test="${sessionScope.loginState==0}">
											<a class="dropdown-item"
												href="${path}/front?key=cons&methodName=selectAll">Consignment
												List</a>
										</c:if>

									</div></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> Board </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item"
											href="${path}/front?key=board&methodName=selectAll">Free
											Board</a> <a class="dropdown-item"
											href="${path}/front?key=review&methodName=selectAll">Review
											Board</a> <a class="dropdown-item"
											href="${path}/front?key=sb&methodName=selectAll">1:1
											Inquiry</a> <a class="dropdown-item"
											href="${path}/front?key=faq&methodName=selectAll">FAQ</a> <a
											class="dropdown-item"
											href="${path}/front?key=artist&methodName=selectAllArtist">Artist
											List</a>
									</div></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> About </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="${path}/about/introduce.jsp">Introduce</a>
										<a class="dropdown-item" href="${path}/serBoard/donIndex.jsp">Donation
											Activity</a> <a class="dropdown-item"
											href="${path}/front?key=article&methodName=selectAll">Article</a>
									</div></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> My Page </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item"
											href="${path}/front?key=like&methodName=selectAll">Liked
											Arts</a> <a class="dropdown-item"
											href="${path}/front?key=member&methodName=myInform">My
											Information</a> <a class="dropdown-item"
											href="${path}/artist/registArtist.jsp">Artist Service</a> <a
											class="dropdown-item"
											href="${path}/front?key=bid&methodName=searchBidArtState&userId=${sessionScope.loginUser}">My
											Bidding</a> <a class="dropdown-item"
											href="${path}/front?key=sucBid&methodName=searchByUserId&userId=${sessionScope.loginUser}">My
											Successful Bid</a>
										<c:if test="${sessionScope.loginState==0}">
											<a class="dropdown-item"
												href="${path}/front?key=member&methodName=selectAllMember">Our
												Members</a>
										</c:if>

									</div></li>
							</ul>
						</div>
						<div class="hearer_icon d-flex">
							<c:if test="${sessionScope.loginUser==null}">
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
									id="search_1" href="${path}/member/login.jsp">login</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <a id="search_1"
									href="${path}/member/join.jsp">signin</a>
							</c:if>
							<c:if test="${sessionScope.loginUser!=null}">
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
									id="search_1" href="${path}/front?key=member&methodName=logout">logout</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <a id="search_1" href="#">${loginUser}</a>
							</c:if>
						</div>
					</nav>
				</div>
			</div>
		</div>

	</header>
    <!-- Header part end-->
    
	<section>
			<div style="position: relative; z-index: 1; margin-bottom: 80px">
				<img src="${path}/img/ttt.jpg" width="100%" alt="" class="img-fluid" style="margin-top: 80px" id="mainI">
			</div>
			<div style="position:absolute; left: 30px; top: 350px; z-index: 2;">
				<p id="oti">In Ori Auction's Art Storage</p>
			</div>
			<h1 id="forma" style="font-family:ITC Grouch; text-align:center;"> </h1>
	</section>

	<div class="whole-wrap" align="center">
		<div style="margin-left:auto; margin-right:auto;">
			<div style="width:100%;">
				<h1 align="center" style="margin:0px 0px 50px; font-family:ITC Grouch; ">All Our Arts are here</h1>
				<div class="col-lg-12">
					<div class="product_top_bar d-flex justify-content-between align-items-center">
						<div class="single_product_menu d-flex">
							<p>
								??? <span>${fn:length(artList)} </span> ?????? ??????
							</p>
						</div>
						<div>
						<c:if test="${sessionScope.loginState==0}">
							<span>Art Category : 
								<a href="${path}/front?key=art&methodName=searchByKeyWord&keyField=artCategory&keyWord=1" 
								class="genric-btn primary small" style="padding:0px 7px" title="Photograph">Photograph</a>
								<a href="${path}/front?key=art&methodName=searchByKeyWord&keyField=artCategory&keyWord=2" 
								class="genric-btn primary small" style="padding:0px 7px" title="Fine-Art">Fine-Art</a>
								<a href="${path}/front?key=art&methodName=searchByKeyWord&keyField=artCategory&keyWord=3" 
								class="genric-btn primary small" style="padding:0px 7px" title="Craft & Sculpture">Craft & Sculpture</a>
							</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span>Art State : 
								<a href="${path}/front?key=art&methodName=searchByKeyWord&keyField=artState&keyWord=1" 
								class="genric-btn primary small" style="padding:0px 5px" title="???????????? ??????">?????????</a>
								<a href="${path}/front?key=art&methodName=searchByKeyWord&keyField=artState&keyWord=2" 
								class="genric-btn primary small" style="padding:0px 5px" title="?????? ?????? ?????? ??????">?????????</a>
								<a href="${path}/front?key=art&methodName=searchByKeyWord&keyField=artState&keyWord=3" 
								class="genric-btn primary small" style="padding:0px 5px" title="????????? ??????">??????</a>
							</span>
							</c:if>
						</div>
						
						<div>
						<c:if test="${sessionScope.loginState ne 0}">
							<span>Art Category : 
								<a href="${path}/front?key=art&methodName=searchByKeyWordUser&keyField=artCategory&keyWord=1&userId=${sessionScope.loginUser}" 
								class="genric-btn primary small" style="padding:0px 5px" title="Photograph">Photograph</a>
								<a href="${path}/front?key=art&methodName=searchByKeyWordUser&keyField=artCategory&keyWord=2&userId=${sessionScope.loginUser}" 
								class="genric-btn primary small" style="padding:0px 5px" title="Fine-Art">Fine-Art</a>
								<a href="${path}/front?key=art&methodName=searchByKeyWordUser&keyField=artCategory&keyWord=3&userId=${sessionScope.loginUser}" 
								class="genric-btn primary small" style="padding:0px 5px" title="Craft & Sculpture">Craft & Sculpture</a>
							</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span>Art State : 
								<a href="${path}/front?key=art&methodName=searchByKeyWordUser&keyField=artState&keyWord=1&userId=${sessionScope.loginUser}" 
								class="genric-btn primary small" style="padding:0px 5px" title="???????????? ??????">?????????</a>
								<a href="${path}/front?key=art&methodName=searchByKeyWordUser&keyField=artState&keyWord=2&userId=${sessionScope.loginUser}" 
								class="genric-btn primary small" style="padding:0px 5px" title="?????? ?????? ?????? ??????">?????????</a>
								<a href="${path}/front?key=art&methodName=searchByKeyWordUser&keyField=artState&keyWord=3&userId=${sessionScope.loginUser}" 
								class="genric-btn primary small" style="padding:0px 5px" title="????????? ??????">??????</a>
							</span>
							</c:if>
						</div>
						
						<c:if test="${sessionScope.loginState==0}">
						<form name="search" action="${path}/front?key=art&methodName=searchByKeyWord" method="post">
							<select name="keyField">
								<option value="0">???????????????</option>
								<option value="id">UserID</option>
								<option value="artistCode">ArtistCode</option>
								<option value="artCode">ArtCode</option>
								<option value="artName">Title</option>
								<option value="artistName">Artist</option>
								<option value="artDetail">Detail</option>
							</select>
							<input type="text" name="keyWord" placeholder=""/><input type="submit" value="Search">
						</form>
						</c:if>
						<c:if test="${sessionScope.loginState ne 0}">
						<form name="search" action="${path}/front?key=art&methodName=searchByKeyWordUser&userId=${sessionScope.loginUser}" method="post">
							<select name="keyField">
								<option value="0">???????????????</option>
								<option value="artCode">ArtCode</option>
								<option value="artName">Title</option>
								<option value="artistName">Artist</option>
								<option value="artDetail">Detail</option>
							</select>
							<input type="text" name="keyWord" placeholder=""/><input type="submit" value="Search">
						</form>
						</c:if>
					</div>
				</div>
				<div class="progress-table-wrap" style="overflow:hidden">
					<div class="progress-table">
						<table class="table table-borderless">
							<thead>
								<tr>
									<th scope="col">NO</th>
									<c:if test="${sessionScope.loginState==0}">
									<th scope="col">USER ID</th>
									<th scope="col">A.CODE</th>
									</c:if>
									<th scope="col" id="tho">TITLE</th>
									<th scope="col" id="tho">ARTIST</th>
									<th scope="col" id="tho">CATEGORY</th>
									<th scope="col" id="tho">YEAR</th>
									<th scope="col" id="tho">DETAIL</th>
									<th scope="col" id="tho">SIZE</th>
									<th scope="col" id="tho">COST</th>
									<th scope="col"id="tho">STATE</th>
									<c:if test="${sessionScope.loginState==0}">
									<th scope="col" style="color:red">DEL.ART</th></c:if>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty requestScope.artList}">
										<tr>
											<td colspan="12">
												<p align="center">
													<b><span style="font-size: 9pt;">????????? ????????? ????????????.</span></b>
												</p>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${requestScope.artList}" var="artDto">
											<tr onmouseover="this.style.background='white'"
												onmouseout="this.style.background=''">
												<td bgcolor="">
													<p>
														<span style="font-size: 9pt;">
															<a href="${path}/front?key=art&methodName=searchByArtCode&artCode=${artDto.artCode}">
																${artDto.artCode} </a>
														</span>
													</p>
												</td>
												<c:if test="${sessionScope.loginState==0}">
												<td bgcolor="">
													<p>
														<span style="font-size: 9pt;">${artDto.id}</span>
													</p>
												</td>
												<td bgcolor="">
													<p>
														<span style="font-size: 9pt;">${artDto.artistCode}</span>
													</p>
												</td>
												</c:if>
												<%-- <td bgcolor="">
														<p>
															<span style="font-size: 9pt;">
																<a href="${path}/front?key=art&methodName=selectByArtCode&artCode=${artDto.artCode}">
																	${artDto.artName} </a>
															</span>
														</p>
													</td> --%>
												<td bgcolor="">
													<p>
														<span style="font-size: 9pt;"> ${artDto.artName} </span>
													</p>
												</td>
												<td bgcolor="">
													<p>
														<span style="font-size: 9pt;">${artDto.artistName}</span>
													</p>
												</td>
												<c:choose>
													
													<c:when test="${artDto.artCategory==1}">
														<td bgcolor="">
															<p>
																<span style="font-size: 9pt;">Photograph</span>
															</p>
														</td>
													</c:when>
													<c:when test="${artDto.artCategory==2}">
														<td bgcolor="">
															<p>
																<span style="font-size: 9pt;">FineArt</span>
															</p>
														</td>
													</c:when>
													<c:when test="${artDto.artCategory==3}">
														<td bgcolor="">
															<p>
																<span style="font-size: 9pt;">Craft</span>
															</p>
														</td>
													</c:when>
												</c:choose>
												<td bgcolor="">
													<p>
														<span style="font-size: 9pt;">${artDto.prdYear}</span>
													</p>
												</td>
												<td bgcolor="">
													<p>
														<span style="font-size: 9pt;">${artDto.artDetail}</span>
													</p>
												</td>
												<td bgcolor="">
													<p>
														<span style="font-size: 9pt;">${artDto.artSizeHeight}??${artDto.artSizeWidth}??${artDto.artSizeVol}</span>
													</p>
												</td>
												<td bgcolor="">
													<p>
														<span style="font-size: 9pt;">
														<fmt:formatNumber value="${artDto.estimateCost}" />
														</span>
													</p>
												</td>
												<c:choose>
													<c:when test="${artDto.artState==1}">
														<td bgcolor="">
															<p>
																<span style="font-size: 9pt;">?????????</span>
															</p>
														</td>
													</c:when>
													<c:when test="${artDto.artState==2}">
														<td bgcolor="">
															<p>
																<span style="font-size: 9pt;">???????????????</span>
															</p>
														</td>
													</c:when>
													<c:when test="${artDto.artState==3}">
														<td bgcolor="">
															<p>
																<span style="font-size: 9pt;">??????</span>
															</p>
														</td>
													</c:when>
												</c:choose>
												<c:if test="${sessionScope.loginState==0}">
												<td bgcolor="">
												<input name="delete" type="submit" value="Delete Art" class="genric-btn primary-border small" style="padding:0px 5px; background-color: black;
												color:yellow; border:0; outline:0;"/>
												</td>
												</c:if>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
							<tfoot>
								<tr>
									<td bgcolor="" colspan="8" align="left">
										<c:if test="${sessionScope.loginState==0}">
										<a href="${path}/front?key=art&methodName=selectAll" class="genric-btn primary small" 
										style="padding:0px 7px" >All Artwork List for Manager</a>
										</c:if>
										<c:if test="${sessionScope.loginState ne 0}">
										<a href="${path}/front?key=art&methodName=searchByKeyWord&keyField=id&keyWord=${sessionScope.loginUser}" class="genric-btn primary small" 
										style="padding:0px 7px">All Artwork List for ${sessionScope.loginUser}</a>
										</c:if>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer_part">
		<div class="container">
			<div class="row justify-content-around">
				<div class="col-sm-6 col-lg-2">
					<div class="single_footer_part">
						<h4>Auctions</h4>
						<ul class="list-unstyled">
							<li><a href="">See All Auctions</a></li>
							<li><a href="">Find My ArtWorks</a></li>
							<li><a href="">Zero-Base?</a></li>
							<li><a href="">Charity Auction</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-lg-2">
					<div class="single_footer_part">
						<h4>Main Services</h4>
						<ul class="list-unstyled">
							<li><a href="">Consignment </a></li>
							<li><a href="">Member Service</a></li>
							<li><a href="">Auction Service</a></li>
							<li><a href="">Our Artists</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-lg-2">
					<div class="single_footer_part">
						<h4>Our Future</h4>
						<ul class="list-unstyled">
							<li><a href="">For Society</a></li>
							<li><a href="">Kids Art Service</a></li>
							<li><a href="">Our Donations</a></li>
							<li><a href="">Ori Museum</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-lg-2">
					<div class="single_footer_part">
						<h4>Ori Auction</h4>
						<ul class="list-unstyled">
							<li><a href="">DongHyun</a></li>
							<li><a href="">MinSub</a></li>
							<li><a href="">SungHee</a></li>
							<li><a href="">Soyoung</a></li>
							<li><a href="">KiHyun</a></li>
							<li><a href="">DongSo</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="single_footer_part">
						<h4>Newsletter</h4>
						<p>Undoubtedly, these are all developments that would have
							appealed to the pioneering character of Ori Auction.</p>
						<div id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="subscribe_form relative mail_part">
								<input type="email" name="email" id="newsletter-form-email"
									placeholder="Email Address" class="placeholder hide-on-focus"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = ' Email Address '">
								<button type="submit" name="submit" id="modify">subscribe</button>
								<div class="mt-10 info"></div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="copyright_part">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<div class="copyright_text">
							<P>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with by OriAuction
								Team</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</P>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="footer_icon social_icon">
							<ul class="list-unstyled">
								<li><a href="#" class="single_social_icon"><i
										class="fab fa-facebook-f"></i></a></li>
								<li><a href="#" class="single_social_icon"><i
										class="fab fa-twitter"></i></a></li>
								<li><a href="#" class="single_social_icon"><i
										class="fas fa-globe"></i></a></li>
								<li><a href="#" class="single_social_icon"><i
										class="fab fa-behance"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--::footer_part end::-->

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script src="${path}/js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="${path}/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="${path}/js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="${path}/js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="${path}/js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="${path}/js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="${path}/js/owl.carousel.min.js"></script>
	<script src="${path}/js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="${path}/js/slick.min.js"></script>
	<script src="${path}/js/jquery.counterup.min.js"></script>
	<script src="${path}/js/waypoints.min.js"></script>
	<script src="${path}/js/contact.js"></script>
	<script src="${path}/js/jquery.ajaxchimp.min.js"></script>
	<script src="${path}/js/jquery.form.js"></script>
	<script src="${path}/js/jquery.validate.min.js"></script>
	<script src="${path}/js/mail-script.js"></script>
	<script src="${path}/js/stellar.js"></script>
	<script src="${path}/js/price_rangs.js"></script>
	<!-- custom js -->
	<script src="${path}/js/custom.js"></script>
</body>

</html>