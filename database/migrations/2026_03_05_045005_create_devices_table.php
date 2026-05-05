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
        Schema::create('devices', function (Blueprint $table) {
            $table->bigIncrements('device_id');
            $table->bigInteger('user_id');
            $table->string('owner_name');
            $table->string('serial_number');
            $table->string('status');
            $table->bigInteger('purchase_date');
            $table->bigInteger('garansi');
            $table->timestamp('registered_at');
            
            $table->foreign('user_id')->references('user_id')->on('parents');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('devices');
    }
};
