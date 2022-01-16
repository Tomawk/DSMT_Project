<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HereThePaw Petsitters</title>
    <link rel="icon" href="images/paw_icon.png" sizes="32x32">
    <link href="CSS/index.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/a30f811c28.js" crossorigin="anonymous"></script>
</head>
<body>
<nav class="topnav">
    <img src="images/HereThePaw_Logo.png" alt="logo">
    <table>
        <tr>
            <td><a onclick="scrollup()">Home</a></td>
            <td><a href="#hr1">Pets</a></td>
            <td><a href="#hr2">My Profile</a></td>
            <td><a href="#contatti">Reviews</a></td>
        </tr>
    </table>
</nav>
<aside class="rightnav">
    <table>
        <tr>
            <td id="facebook"></td>
        </tr>
        <tr>
            <td id="instagram"></td>
        </tr>
        <tr>
            <td id="google"></td>
        </tr>
    </table>
</aside>
<div class="image_div">
    <div class="search_div">
        <div class="pet_search">
            <h2><i class="fas fa-dog"></i> Pets</h2>
            <select name="pets" id="pets">
                <option value="dog">Dog</option>
                <option value="cat">Cat</option>
                <option value="rabbit">Rabbit</option>
                <option value="hamster">Hamster</option>
            </select>
        </div>
        <div class="location_search">
            <h2><i class="fas fa-search"></i> Where</h2>
            <input type="text" placeholder="Location" id="location">
        </div>
        <div class="confirmation_search">
            <button type="submit">Search Now</button>
        </div>
    </div>
</div>
<hr>
<div class="info_div">
    <h1> Here is how HereThePaw service works.</h1>
    <h2> Search and connect with trusted pet sitters. It's easy as 1, 2, 3. </h2>
    <div class="infos">
        <div class="info_1">
            <h3><i class="fas fa-search"></i>&nbsp;&nbsp;1. Find a verified pet sitter</h3>
            <p>Search and find experienced local pet sitters nearby</p>
        </div>
        <div class="info_2">
            <h3><i class="far fa-calendar-alt"></i>&nbsp;&nbsp;2. Arrange a meet & greet online</h3>
            <p>Get to know your sitter online, obligation-free.</p>
        </div>
        <div class="info_3">
            <h3><i class="far fa-credit-card"></i>&nbsp;&nbsp;3. Pay online</h3>
            <p>Book your sitter through our safe online system, with flexible cancellations in case your plans change.</p>
        </div>
    </div>
</div>
</body>
</html>