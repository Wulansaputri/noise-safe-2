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
        Schema::create('service_log', function (Blueprint $table) {
            $table->bigIncrements('service_id');
            $table->bigInteger('device_id');
            $table->bigInteger('admin_id');
            $table->boolean('is_warranty');
            $table->string('service_status');
            $table->date('date');
            $table->string('description');
            $table->timestamp('created_at');

            $table->foreign('device_id')->references('device_id')->on('devices');
            $table->foreign('admin_id')->references('admin_id')->on('admins');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('service_log');
    }
};
