<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->integer('id')->primaryKey();
            $table->string('api_token')->nullable();
            $table->integer('acctype_id');
            $table->string('name')->unique();
            $table->string('fullname')->nullable();
            $table->string('email')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();

            $table->foreign('id')->references('acc_id')->on('pdmv_accounts');
        });

        DB::table('users')
        ->insertUsing(['id', 'name', 'password', 'acctype_id'], function ($query) {
            $query->select(['acc_id', 'usname', 'password', 'acctype_id'])
                ->from('pdmv_accounts');
        });

        DB::table('users')
        ->join('pdmv_users', 'users.id', '=', 'pdmv_users.user_id')
        ->update([
            'users.email' => DB::raw('pdmv_users.email'),
            'users.fullname' => DB::raw('pdmv_users.fullname'),
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};