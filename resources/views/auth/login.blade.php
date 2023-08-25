<!-- resources/views/login.blade.php -->

<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
</head>

<body>
    <h2>Login</h2>

    @if(session('message'))
    <p>{{ session('message') }}</p>
    @endif

    <form method="POST" action="/login">
        @csrf
        <label for="name">Username:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <button type="submit">Login</button>
    </form>
</body>

</html>