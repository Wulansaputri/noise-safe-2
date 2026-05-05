<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeviceLocation extends Model
{
    use HasFactory;

    protected $table = 'device_location';
    protected $primaryKey = 'loc_id';
    public $timestamps = false;

    protected $fillable = [
        'device_id',
        'latitude',
        'longitude',
        'recorded_at',
    ];

    public function device()
    {
        return $this->belongsTo(Device::class, 'device_id', 'device_id');
    }
}
