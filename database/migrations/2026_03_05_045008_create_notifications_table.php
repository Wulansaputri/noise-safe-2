<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('notifications', function (Blueprint $table) {
            $table->bigIncrements('notif_id');
            $table->bigInteger('user_id');
            $table->bigInteger('device_id');
            $table->text('message');
            $table->string('status');
            $table->timestamp('created_at');

            $table->foreign('user_id')->references('user_id')->on('parents');
            $table->foreign('device_id')->references('device_id')->on('devices');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('notifications');
    }
};
