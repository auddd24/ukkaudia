<?php
session_start();
include ("koneksi.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
       body {
  background: url('loginbg.jpg') no-repeat center center fixed;
  background-size: 50% 100%;
  background-position: center;
  font-family: 'Poppins', sans-serif;
}
    </style>
</head>
<body class="flex items-center justify-center min-h-screen">

    <div class="bg-pink bg-opacity-10 backdrop-blur-md p-8 rounded-xl shadow-lg w-96 border border-white border-opacity-30">
        <div class="text-center">
            <img src="profil .jpg"
                 alt="User avatar" 
                 class="w-24 h-24 mx-auto rounded-full border-4 border-pink mb-4"/>

            <h1 class="text-grey text-3xl font-bold mb-2">LOGIN</h1>
        </div>

        <?php if (isset($_SESSION['error_message'])): ?>
            <div class="bg-red-500 text-white p-3 mb-4 rounded text-center">
                <?= $_SESSION['error_message']; unset($_SESSION['error_message']); ?>
            </div>
        <?php endif; ?>

        <form class="space-y-4" action="proses_login.php" method="POST">
            <div class="relative">
                <input type="text" name="username" placeholder="Username" required
                       class="w-full px-4 py-3 pl-10 rounded-full bg-pink bg-opacity-30 text-grey placeholder-grey-200 focus:ring-2 focus:ring-blue-400 focus:outline-none"/>
                <i class="fas fa-user absolute left-3 top-3 text-gray-300"></i>
            </div>
            <div class="relative">
                <input type="password" name="password" placeholder="Password" required
                       class="w-full px-4 py-3 pl-10 rounded-full bg-pink bg-opacity-30 text-grey placeholder-grey-200 focus:ring-2 focus:ring-blue-400 focus:outline-none"/>
                <i class="fas fa-lock absolute left-3 top-3 text-gray-300"></i>
            </div>
            <div>
                <button type="submit"
                        class="w-full px-4 py-3 rounded-full bg-pink-500 text-white font-bold hover:bg-pink-600 transition duration-300 focus:outline-none">
                    LOGIN
                </button>
            </div>
        </form>
    </div>

</body>
</html>
