<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Device extends Model
{
    use HasFactory;

    protected $table = 'devices';
    protected $primaryKey = 'device_id';
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'owner_name',
        'serial_number',
        'status',
        'purchase_date',
        'garansi',
        'registered_at',
    ];
}
