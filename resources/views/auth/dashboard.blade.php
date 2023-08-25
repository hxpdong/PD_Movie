@if(auth()->check())
<p>Welcome, {{ auth()->user()->name }}</p>
<form method="POST" action="/logout">
    @csrf
    <button type="submit">Logout</button>
</form>
@else
<p>You are not logged in.</p>
@endif

<script>
    var userName = "{{ auth()->user()->name }}"; // Chuyển tên người dùng từ PHP sang JavaScript
    console.log("day ne: " + userName);
</script>
