
<!doctype html>
<html lang="en">

<head>
<title>Masuk - SIPO</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<!-- VENDOR CSS -->
<link rel="stylesheet" href="{{asset('assets/vendor/bootstrap/css/bootstrap.min.css')}}">
<link rel="stylesheet" href="{{asset('assets/vendor/font-awesome/css/font-awesome.min.css')}}">
<link rel="stylesheet" href="{{asset('assets/vendor/animate-css/vivify.min.css')}}">

<!-- MAIN CSS -->
<link rel="stylesheet" href="{{asset('assets/css/site.min.css')}}">
<link rel="stylesheet" href="{{asset('assets/css/custom.css')}}">
<link rel="stylesheet" href="{{asset('assets/css/animation.css')}}">

</head>

<body class="theme-cyan font-montserrat light_version">
<!-- Page Loader -->
@extends('layouts._loader')

<div class="auth-main2 particles_js">
    <div class="auth_div vivify fadeInTop">
        <div class="card">
            <div class="body justify-content-around">
                <div class="login-img">
                    @include('shared.svg.login-svg')
                </div>
                <form class="form-auth-small my-auto" action="{{route('auth')}}" method="post">
                    {{ csrf_field() }}
                    <b><p class="text-center" style="font-size: 16px;">SIPO(sistem pembelajaran online)</p></b>
                    <p class="text-center" style="font-size: 12px;">Silahkan masukan e-mail & password anda.</p>

                    <div class="form-group">
                        <label for="signin-username" class="control-label sr-only">Username</label>
                        <input type="text" class="form-control round" id="signin-username" name="username" placeholder="Username" required>
                    </div>
                    <div class="form-group">
                        <label for="signin-password" class="control-label sr-only">Password</label>
                        <input type="password" class="form-control round" id="signin-password" name="password" placeholder="Password" required>
                    </div>
                    <div class="form-group clearfix">
                        <label class="fancy-checkbox element-left">
                            <input type="checkbox" name="remember">
                            <span>Ingat saya</span>
                        </label>
                    </div>
                    <button type="submit" class="btn bg-blue-2 text-white btn-round btn-block">MASUK</button>
                </form>
            </div>
        </div>
    </div>
    <div id="particles-js"></div>
</div>
<!-- END WRAPPER -->

<script src="{{asset('assets/bundles/libscripts.bundle.js')}}"></script>
<script src="{{asset('assets/bundles/vendorscripts.bundle.js')}}"></script>
<script src="{{asset('assets/bundles/mainscripts.bundle.js')}}"></script>
</body>
</html>
