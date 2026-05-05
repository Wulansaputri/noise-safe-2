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
        Schema::create('device_location', function (Blueprint $table) {
            $table->bigIncrements('loc_id');
            $table->bigInteger('device_id');
            $table->float('latitude');
            $table->float('longitude');
            $table->timestamp('recorded_at');
            
            $table->foreign('device_id')->references('device_id')->on('devices');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('device_location');
    }
};
