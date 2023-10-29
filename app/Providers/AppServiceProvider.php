<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot()
    {
        Validator::extend('valid_otp_for_email', function ($attribute, $value, $parameters, $validator) {
            $email = $parameters[0];
    
            // Thực hiện kiểm tra xem mã OTP ($value) có tương ứng với email trong cơ sở dữ liệu hay không.
            // Đây là nơi bạn thực hiện kiểm tra và trả về true hoặc false.
            return $this->checkOtpForEmail($value, $email);
        });
    }

    private function checkOtpForEmail($otp, $email)
    {
        // Thực hiện kiểm tra xem mã OTP có tương ứng với email trong cơ sở dữ liệu hay không.
        // Nếu có, trả về true, ngược lại trả về false.
        $user = User::where('email', $email)->where('password_otp', $otp)->first();
        if($user){
            return true;
        }
        else return false;
    }
}
