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
        Schema::create('purchase', function (Blueprint $table) {
            $table->bigIncrements('purchase_id');
            $table->bigInteger('device_id');
            $table->bigInteger('user_id');
            $table->date('transaction_date');
            $table->string('transaction_status');
            $table->timestamp('created_at');

            $table->foreign('device_id')->references('device_id')->on('devices');
            $table->foreign('user_id')->references('user_id')->on('parents');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchase');
    }
};
