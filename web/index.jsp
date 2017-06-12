<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.lang.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.ImageIO"%>
<!DOCTYPE HTML>
<!--
	Hyperspace by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>CloudSpace</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>

		<!-- Sidebar -->
			<section id="sidebar">
				<div class="inner">
					<nav>
						<ul>
							<li><a href="#intro">Bienvenido</a></li>
							<li><a href="#one">Quiénes somos</a></li>
							<li><a href="#two">Que ofrecemos</a></li>
							<li><a href="#three">Contacto</a></li>
						</ul>
					</nav>
				</div>
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Intro -->
					<section id="intro" class="wrapper style1 fullscreen fade-up">
						<div class="inner">
							<h1>Cloudspace</h1>
							<p>Cloudspace es una plataforma de almacenamiento online desarrollada en  <a href="http://html5up.net">HTML5 y jsp</a><br />
							creada y desarrollada bajo la licencia <a href="http://html5up.net/license">Creative Commons.</a> </p>
							<ul class="actions">
								<li><a href="#one" class="button scrolly">Aprende mas </a></li>
                                                                <li><a href="./publico/login.jsp" class="button scrolly">Inicia sesión</a></li>
                                                                <li><a href="./publico/register.jsp" class="button scrolly">Registrate </a></li>
                                                                
							</ul>
						</div>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style2 spotlights">
						<section>
							<a href="#" class="image"><img src="images/pic01.jpg" alt="" data-position="center center" /></a>
							<div class="content">
								<div class="inner">
									<h2>CloudSpace</h2>
									<p>CloudSpace, es una plataforma de almacenamiento online, de codigo abieta y totalmente gratuita.</p>
									<ul class="actions">
										<li><a href="#two" class="button">Aprende mas</a></li>
									</ul>
								</div>
							</div>
						</section>
						<section>
							<a href="#" class="image"><img src="images/pic02.jpg" alt="" data-position="top center" /></a>
							<div class="content">
								<div class="inner">
									<h2>Filosofía GNU</h2>
									<p>La filosofía GNU es crear un proyecto colaborativo de software libre con el objetivo de crear un sistema completamente libre.</p>
                                                                        <p>A través de la promoción del desarrollo colaborativo de software y conocimiento mediante el uso de licencias libres: GPL, AGPL, LGPL, GFDL, entre otros</p>
                                                                        <ul class="actions">
										<li><a href="#" class="button">Aprenda mas</a></li>
									</ul>
								</div>
							</div>
						</section>
						<section>
							<a href="#" class="image"><img src="images/pic03.jpg" alt="" data-position="25% 25%" /></a>
							<div class="content">
								<div class="inner">
									<h2>Libre distribución</h2>
									<p>Este proyecto puede ser copiado, estudiado, modificado, utilizado libremente con cualquier fin y redistribuido con o sin cambios o mejoras..</p>
									<ul class="actions">
										<li><a href="#" class="button">Aprenda mas</a></li>
									</ul>
								</div>
							</div>
						</section>
					</section>

				<!-- Two -->
					<section id="two" class="wrapper style3 fade-up">
						<div class="inner">
							<h2>Que ofrecemos</h2>
							<div class="features">
								<section>
									<span class="icon major fa-code"></span>
									<h3>Codigo abierto</h3>
									<p>Nuestro codigo esta disponible para ser examinado en GitHub.</p>
								</section>
								<section>
									<span class="icon major fa-lock"></span>
									<h3>Seguridad</h3>
									<p>Nuestra plataforma es compatible con SSL,HTTPS y otras tecnologías que aportan seguridad..</p>
								</section>
								<section>
									<span class="icon major fa-cog"></span>
									<h3>Plataforma multisistema</h3>
									<p>Elegir JSP como lenguaje de programación permite que la plataforma sea instalable en cientos de dispositivos.</p>
								</section>
								<section>
									<span class="icon major fa-desktop"></span>
									<h3>Responsive desing </h3>
									<p>El "responsive desing" o diseño web adaptable es una filosofía que permite adaptar la web a varios dispositivos tales como ordenadores,tabets,moviles y etc...</p>
								</section>
								<section>
									<span class="icon major fa-chain"></span>
									<h3>Creacion de workgroups</h3>
									<p>El sistema ademas de ser una nube de almacenamiento online personal, permite crear workgroups para compartir archivos.</p>
								</section>
								<section>
									<span class="icon major fa-diamond"></span>
									<h3>Sistema de copias de seguridad</h3>
									<p>Sabemos que tus datos son importantes,por lo que hemos desarrollado un sistema de copias de seguirdad que nos permite mantener tus datos a salvo.</p>
								</section>
							</div>
							<ul class="actions">
								<li><a href="#" class="button">Learn more</a></li>
							</ul>
						</div>
					</section>

				<!-- Three -->
					<section id="three" class="wrapper style1 fade-up">
						<div class="inner">
							<h2>Contacto</h2>
							<p>Nuestra plataforma acepta sugerencias y nuevas ideas, asi como nuevos posibles colaboradores que quieran contribuir a esta fantastico proyecto.</p>
							<div class="split style1">
								<section>
									<form method="post" action="#">
										<div class="field half first">
											<label for="name">Nombre</label>
											<input type="text" name="name" id="name" />
										</div>
										<div class="field half">
											<label for="email">Email</label>
											<input type="text" name="email" id="email" />
										</div>
										<div class="field">
											<label for="message">Mensaje</label>
											<textarea name="message" id="message" rows="5"></textarea>
										</div>
										<ul class="actions">
											<li><a href="" class="button submit">Enviar mensaje</a></li>
										</ul>
									</form>
								</section>
								<section>
									<ul class="contact">
										<li>
											<h3>Dirección</h3>
											<span>Lorca,Murcia<br />
											Codigo postal 30800<br />
											España</span>
										</li>
										<li>
											<h3>Email</h3>
											<a href="#">mariok32@hotmail.com</a>
										</li>
										
										<li>
											<h3>Social</h3>
											<ul class="icons">
												<li><a href="#" class="fa-twitter"><span class="label">Twitter</span></a></li>
												<li><a href="#" class="fa-facebook"><span class="label">Facebook</span></a></li>
												<li><a href="#" class="fa-github"><span class="label">GitHub</span></a></li>
												<li><a href="#" class="fa-instagram"><span class="label">Instagram</span></a></li>
												<li><a href="#" class="fa-linkedin"><span class="label">LinkedIn</span></a></li>
											</ul>
										</li>
									</ul>
								</section>
							</div>
						</div>
					</section>

			</div>

		<!-- Footer -->
			<footer id="footer" class="wrapper style1-alt">
				<div class="inner">
					<ul class="menu">
						<li>&copy; CloudSpace. Todos los derechos reservados.</li><li>Diseño: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>