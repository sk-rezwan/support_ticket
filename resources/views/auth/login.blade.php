<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #eef2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 380px;
            text-align: center;
        }

        .logo {
            font-size: 32px;
            font-weight: 800;
            color: #007BFF;
            letter-spacing: 2px;
            margin-bottom: 10px;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #222;
            font-size: 22px;
            font-weight: 600;
        }

        .login-container input {
            width: 100%;
            padding: 12px 12px;
            margin-bottom: 14px;
            border: 1px solid #d0d6dd;
            border-radius: 8px;
            background: #f9fafb;
            font-size: 15px;
            transition: all 0.25s ease;
        }

        .login-container input:focus {
            border-color: #007BFF;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.15);
            outline: none;
        }

        .login-container button {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.25s ease;
        }

        .login-container button:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: #e74c3c;
            margin-bottom: 16px;
            font-size: 14px;
        }

        .footer-text {
            margin-top: 15px;
            font-size: 13px;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="login-container">

        <div class="logo">CDIP</div>

        <h2>Login</h2>

        @if ($errors->any())
            <div class="error-message">
                {{ $errors->first() }}
            </div>
        @endif

        <form method="POST" action="/login">
            @csrf
            <input type="text" name="email" placeholder="User ID" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>

        <div class="footer-text">© {{ date('Y') }} CDIP IT Services— All Rights Reserved.</div>
    </div>
</body>
</html>
