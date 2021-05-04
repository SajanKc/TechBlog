<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="./index.jsp">TechBlog</a>
	<button
		class="navbar-toggler"
		type="button"
		data-toggle="collapse"
		data-target="#navbarTogglerDemo02"
		aria-controls="navbarTogglerDemo02"
		aria-expanded="false"
		aria-label="Toggle navigation"
	>
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			<li class="nav-item active">
				<a class="nav-link" href="index.jsp"
					>Home
					<span class="sr-only">(current)</span>
				</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
			<li class="nav-item dropdown">
				<a
					class="nav-link dropdown-toggle"
					data-toggle="dropdown"
					href="#"
					role="button"
					aria-haspopup="true"
					aria-expanded="false"
					>Categories</a
				>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Programming Language</a>
					<a class="dropdown-item" href="#">Tech Novel</a>
					<a class="dropdown-item" href="#">Syllabus</a>
				</div>
			</li>
			<li class="nav-item">
				<a
					class="nav-link login btn btn-outline-dark btn-sm"
					href="login.jsp"
				>
					<i class="fa fa-sign-in" aria-hidden="true"></i> Login
				</a>
			</li>
			<li class="nav-item ml-lg-3">
				<a
					class="nav-link register btn btn-outline-dark btn-sm"
					href="register.jsp"
				>
					<i class="fa fa-user-plus" aria-hidden="true"></i>
					Register
				</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input
				class="form-control mr-sm-2"
				type="search"
				placeholder="Search"
			/>
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
				Search
			</button>
		</form>
	</div>
</nav>
