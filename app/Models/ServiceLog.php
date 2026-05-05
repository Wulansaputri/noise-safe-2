<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ServiceLog extends Model
{
    use HasFactory;

    protected $table = 'service_log';
    protected $primaryKey = 'service_id';
    public $timestamps = false;

    protected $fillable = [
        'device_id',
        'admin_id',
        'is_warranty',
        'service_status',
        'date',
        'description',
        'created_at',
    ];
}
